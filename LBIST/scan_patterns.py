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

# scan1 is 195, others are 194
N = 16

scan_chain = [0] * N

for i in range(N):
    if i == 0:
        scan_chain[i] = 195 * [0]
    else:
        scan_chain[i] = 194 * [0]


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
        lfsr_equation[M-i] = int(line[i])
    
    # first not used
    update_lfsr(lfsr_equation)

    # how many cycle for seed
    for j in range(200):
        # chain1 is one more long and all other waste 1 lfsr value
        for i in range(M-1):
            app_chain1 = XOR3(lfsr_equation[i], lfsr_equation[i+1], lfsr_equation[i+2])
        update_lfsr(lfsr_equation)
        # long chain for load all scan FF
        for y in range(194):
            # calculate phase shiftare value and assign to each scan chain
            for i in range(16):
                app = XOR3(lfsr_equation[i], lfsr_equation[i+1], lfsr_equation[i+2])
                if app == True:
                    scan_chain[i][y] = 1
                else:
                    scan_chain[i][y] = 0

            update_lfsr(lfsr_equation)
        # special threat for chain 1
        scan_chain[0][0:194] = scan_chain[0][1:195]
        scan_chain[0][0] = app_chain1

        fw.write("\"pattern %d\": Call \"load_unload\" {\n" % count) 
        count += 1
        for y in range(16):
            # write patterns for scan chain
            fw.write("\t\t\"test_si%s\"=" % str(y+1))
            for i in range(len(scan_chain[y])):
                fw.write(str(scan_chain[y][i]))
            fw.write(";\n")  
        fw.write("}\n")               

fp.close()
fw.close()