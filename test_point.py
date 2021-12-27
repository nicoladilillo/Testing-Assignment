f = open("test_point.txt", "r")
f1 = open("point.txt", "w")

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
            f1.write("* %s %s [%d]\n" % (t, name, i))
    else:
        f1.write("* %s %s\n" % (t, name))

# ext_perf_counters_i: IN std_logic_vector(1 to 2);
f1.write("* force_01 ext_perf_counters_i[1]\n")
f1.write("* force_01 ext_perf_counters_i[2]\n")
    
f.close()
f1.close()