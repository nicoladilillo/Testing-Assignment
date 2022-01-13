f = open("test_point.txt", "r")
f1 = open("point.txt", "w")
index = 0

for line in f:
    s = line.split()
    name = s[0][:-1]  # remove last charter
    if s[1] == "OUT":
        t = "observe"
    else:
        t = "force_01"
    
    s = s[2].split('(')
    if len(s) > 1:
        for i in range(int(s[1])):
            f1.write("%d %s %s[%d]\n" % (index, t, name, i))
            index=index+1
    else:
        f1.write("%d %s %s\n" % (index, t, name))
        index=index+1

# ext_perf_counters_i: IN std_logic_vector(1 to 2);
f1.write("%d force_01 ext_perf_counters_i[1]\n" % (index))
index=index+1
f1.write("%d force_01 ext_perf_counters_i[2]\n" % (index))
    
f.close()
f1.close()