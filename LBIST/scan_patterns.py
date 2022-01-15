def AND(a,b): return a*b
def OR(a,b):  return 1-(1-a)*(1-b)
def NOT(a):   return 1-a

def XOR3 (a, b, c):
    w1 = AND(a,b)
    w2 = NOT(w1)
    w3 = OR(a,b)
    w4 = AND(w2,w3)
    w5 = AND(w4,c)
    w6 = NOT(w5)
    w7 = OR(w4,c)
    return AND(w6,w7)

def update_lfsr(lfsr_equation):
    # calculate lfsr new value
    app = XOR3(XOR3(lfsr_equation[M], lfsr_equation[7], lfsr_equation[2]), lfsr_equation[1], lfsr_equation[0])
    lfsr_equation[0:len(lfsr_equation)-1] = lfsr_equation[1:len(lfsr_equation)]
    lfsr_equation[M] = app


N = 16  # number of scan chains
T = 199 # longest scan chain, 203 minos
L = 10  # number of long scan chain
PATH_FOR_SEDD = 1000

scan_chain = [0] * N
app_chain = [0] * L

for i in range(N):
    if i > L:
        scan_chain[i] = (T-1) * [0]
    else:
        scan_chain[i] = T * [0]

# LFSR equation used: x^24 + x^7 + x^2 + x^1 + 1
M = 24 # lfsr size
lfsr_equation =  [0] * (M+1)
phase_shifter =  [0] * (M+1)
fp = open("seed.txt", "r")
fw = open("result.txt", "w")
count = 0

for line in fp:
    # load seed for lfsr
    for i in range(M+1):
        lfsr_equation[i] = int(line[i])
    
    # first not used
    update_lfsr(lfsr_equation)

    # how many cycle for seed
    for j in range(PATH_FOR_SEDD):

        # chain from 1 to 8 are longe than 1 value and save first values
        for i in range(L):
            app_chain[i] = XOR3(lfsr_equation[i], lfsr_equation[i+1], lfsr_equation[i+2])
        update_lfsr(lfsr_equation)

        # load chain for load all scan FF
        for y in range(T-1):
            # calculate phase shiftare value and assign to each scan chain
            for i in range(N):
                app = XOR3(lfsr_equation[i], lfsr_equation[i+1], lfsr_equation[i+2])
                if app == True:
                    scan_chain[i][y] = 1
                else:
                    scan_chain[i][y] = 0

            update_lfsr(lfsr_equation)

        # special threat for lnger chain 
        for i in range(L):
            scan_chain[i][1:T] = scan_chain[i][0:T-1]
            scan_chain[i][0]   = app_chain[i]
        update_lfsr(lfsr_equation)
        

        # one lost value when run in normal mode
        update_lfsr(lfsr_equation)

        fw.write("\"pattern %d\": Call \"load_unload\" {\n" % count) 
        # add test_so to compare
        if count > 0:
            for i in range(N):
                if i == 6:
                    fw.write("\t\t\"data_we_o\"=")
                elif  i == 7:
                    fw.write("\t\t\"irq_id_o[4]\"=")
                else:
                    fw.write("\t\t\"test_so%d\"=" % (i+1))
                
                if i > L:
                    fw.write("\\r203 H ; \n")
                else:
                    fw.write("\\r204 H ; \n")
        count += 1
        for y in range(N):
            # write patterns for scan chain
            fw.write("\t\t\"test_si%s\"=" % str(y+1))
            for i in range(len(scan_chain[y])):
                fw.write(str(scan_chain[y][i]))
            fw.write(";\n")  
        fw.write("}\n") 

        fw.write("Call \"multiclock_capture\" {\n")
        # the last 4 bits are in order lbist_en, rst_ni, test_en_i and test_mode_tp
        fw.write("\t\t\"_pi\"=NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNP1NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN1101")
        # bit coming from lfsr
        for i in range(N):
            fw.write(str(lfsr_equation[i])) 
        fw.write(";\n" ) 
        # understand what do with this signals and how to update them
        fw.write("\t\t\"_po\"=\\r246 H ; }\n")
         

fp.close()
fw.close()
