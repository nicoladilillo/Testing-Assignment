/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : M-2016.12
// Date      : Sun Jan  9 05:33:12 2022
/////////////////////////////////////////////////////////////


module lfsr_N32 ( clk, reset, seed, q );
  input [31:0] seed;
  output [32:0] q;
  input clk, reset;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n1, n2, n3, n4, n70, n71;

  DFFRS_X1 r_reg_reg_0_ ( .D(q[1]), .CK(clk), .RN(n6), .SN(n5), .Q(q[0]) );
  DFFRS_X1 r_reg_reg_31_ ( .D(q[32]), .CK(clk), .RN(n68), .SN(n67), .Q(q[31])
         );
  DFFRS_X1 r_reg_reg_30_ ( .D(q[31]), .CK(clk), .RN(n66), .SN(n65), .Q(q[30])
         );
  DFFRS_X1 r_reg_reg_29_ ( .D(q[30]), .CK(clk), .RN(n64), .SN(n63), .Q(q[29])
         );
  DFFRS_X1 r_reg_reg_28_ ( .D(q[29]), .CK(clk), .RN(n62), .SN(n61), .Q(q[28])
         );
  DFFRS_X1 r_reg_reg_27_ ( .D(q[28]), .CK(clk), .RN(n60), .SN(n59), .Q(q[27])
         );
  DFFRS_X1 r_reg_reg_26_ ( .D(q[27]), .CK(clk), .RN(n58), .SN(n57), .Q(q[26])
         );
  DFFRS_X1 r_reg_reg_25_ ( .D(q[26]), .CK(clk), .RN(n56), .SN(n55), .Q(q[25])
         );
  DFFRS_X1 r_reg_reg_24_ ( .D(q[25]), .CK(clk), .RN(n54), .SN(n53), .Q(q[24])
         );
  DFFRS_X1 r_reg_reg_23_ ( .D(q[24]), .CK(clk), .RN(n52), .SN(n51), .Q(q[23])
         );
  DFFRS_X1 r_reg_reg_22_ ( .D(q[23]), .CK(clk), .RN(n50), .SN(n49), .Q(q[22])
         );
  DFFRS_X1 r_reg_reg_21_ ( .D(q[22]), .CK(clk), .RN(n48), .SN(n47), .Q(q[21])
         );
  DFFRS_X1 r_reg_reg_20_ ( .D(q[21]), .CK(clk), .RN(n46), .SN(n45), .Q(q[20])
         );
  DFFRS_X1 r_reg_reg_19_ ( .D(q[20]), .CK(clk), .RN(n44), .SN(n43), .Q(q[19])
         );
  DFFRS_X1 r_reg_reg_18_ ( .D(q[19]), .CK(clk), .RN(n42), .SN(n41), .Q(q[18])
         );
  DFFRS_X1 r_reg_reg_17_ ( .D(q[18]), .CK(clk), .RN(n40), .SN(n39), .Q(q[17])
         );
  DFFRS_X1 r_reg_reg_16_ ( .D(q[17]), .CK(clk), .RN(n38), .SN(n37), .Q(q[16])
         );
  DFFRS_X1 r_reg_reg_15_ ( .D(q[16]), .CK(clk), .RN(n36), .SN(n35), .Q(q[15])
         );
  DFFRS_X1 r_reg_reg_14_ ( .D(q[15]), .CK(clk), .RN(n34), .SN(n33), .Q(q[14])
         );
  DFFRS_X1 r_reg_reg_13_ ( .D(q[14]), .CK(clk), .RN(n32), .SN(n31), .Q(q[13])
         );
  DFFRS_X1 r_reg_reg_12_ ( .D(q[13]), .CK(clk), .RN(n30), .SN(n29), .Q(q[12])
         );
  DFFRS_X1 r_reg_reg_11_ ( .D(q[12]), .CK(clk), .RN(n28), .SN(n27), .Q(q[11])
         );
  DFFRS_X1 r_reg_reg_10_ ( .D(q[11]), .CK(clk), .RN(n26), .SN(n25), .Q(q[10])
         );
  DFFRS_X1 r_reg_reg_9_ ( .D(q[10]), .CK(clk), .RN(n24), .SN(n23), .Q(q[9]) );
  DFFRS_X1 r_reg_reg_8_ ( .D(q[9]), .CK(clk), .RN(n22), .SN(n21), .Q(q[8]) );
  DFFRS_X1 r_reg_reg_7_ ( .D(q[8]), .CK(clk), .RN(n20), .SN(n19), .Q(q[7]) );
  DFFRS_X1 r_reg_reg_6_ ( .D(q[7]), .CK(clk), .RN(n18), .SN(n17), .Q(q[6]) );
  DFFRS_X1 r_reg_reg_5_ ( .D(q[6]), .CK(clk), .RN(n16), .SN(n15), .Q(q[5]) );
  DFFRS_X1 r_reg_reg_4_ ( .D(q[5]), .CK(clk), .RN(n14), .SN(n13), .Q(q[4]) );
  DFFRS_X1 r_reg_reg_3_ ( .D(q[4]), .CK(clk), .RN(n12), .SN(n11), .Q(q[3]) );
  DFFRS_X1 r_reg_reg_2_ ( .D(q[3]), .CK(clk), .RN(n10), .SN(n9), .Q(q[2]) );
  DFFRS_X1 r_reg_reg_1_ ( .D(q[2]), .CK(clk), .RN(n8), .SN(n7), .Q(q[1]) );
  DFFR_X1 r_reg_reg_32_ ( .D(n69), .CK(clk), .RN(n71), .Q(q[32]) );
  INV_X1 U3 ( .A(reset), .ZN(n71) );
  CLKBUF_X1 U4 ( .A(n71), .Z(n2) );
  OR2_X1 U5 ( .A1(seed[31]), .A2(n2), .ZN(n68) );
  INV_X1 U6 ( .A(n2), .ZN(n1) );
  NAND2_X1 U7 ( .A1(n1), .A2(seed[31]), .ZN(n67) );
  OR2_X1 U8 ( .A1(seed[30]), .A2(n2), .ZN(n66) );
  NAND2_X1 U9 ( .A1(n1), .A2(seed[30]), .ZN(n65) );
  OR2_X1 U10 ( .A1(seed[29]), .A2(n71), .ZN(n64) );
  NAND2_X1 U11 ( .A1(n1), .A2(seed[29]), .ZN(n63) );
  OR2_X1 U12 ( .A1(seed[28]), .A2(n71), .ZN(n62) );
  NAND2_X1 U13 ( .A1(n1), .A2(seed[28]), .ZN(n61) );
  OR2_X1 U14 ( .A1(seed[27]), .A2(n71), .ZN(n60) );
  NAND2_X1 U15 ( .A1(n1), .A2(seed[27]), .ZN(n59) );
  OR2_X1 U16 ( .A1(seed[26]), .A2(n71), .ZN(n58) );
  NAND2_X1 U17 ( .A1(n1), .A2(seed[26]), .ZN(n57) );
  OR2_X1 U18 ( .A1(seed[25]), .A2(n2), .ZN(n56) );
  NAND2_X1 U19 ( .A1(n1), .A2(seed[25]), .ZN(n55) );
  OR2_X1 U20 ( .A1(seed[24]), .A2(n2), .ZN(n54) );
  NAND2_X1 U21 ( .A1(n1), .A2(seed[24]), .ZN(n53) );
  OR2_X1 U22 ( .A1(seed[23]), .A2(n2), .ZN(n52) );
  NAND2_X1 U23 ( .A1(n1), .A2(seed[23]), .ZN(n51) );
  OR2_X1 U24 ( .A1(seed[22]), .A2(n71), .ZN(n50) );
  NAND2_X1 U25 ( .A1(n1), .A2(seed[22]), .ZN(n49) );
  OR2_X1 U26 ( .A1(seed[21]), .A2(n2), .ZN(n48) );
  NAND2_X1 U27 ( .A1(n1), .A2(seed[21]), .ZN(n47) );
  OR2_X1 U28 ( .A1(seed[20]), .A2(n71), .ZN(n46) );
  NAND2_X1 U29 ( .A1(n1), .A2(seed[20]), .ZN(n45) );
  OR2_X1 U30 ( .A1(seed[19]), .A2(n71), .ZN(n44) );
  NAND2_X1 U31 ( .A1(reset), .A2(seed[19]), .ZN(n43) );
  OR2_X1 U32 ( .A1(seed[18]), .A2(n2), .ZN(n42) );
  NAND2_X1 U33 ( .A1(reset), .A2(seed[18]), .ZN(n41) );
  OR2_X1 U34 ( .A1(seed[17]), .A2(n2), .ZN(n40) );
  NAND2_X1 U35 ( .A1(reset), .A2(seed[17]), .ZN(n39) );
  OR2_X1 U36 ( .A1(seed[16]), .A2(n71), .ZN(n38) );
  NAND2_X1 U37 ( .A1(reset), .A2(seed[16]), .ZN(n37) );
  OR2_X1 U38 ( .A1(seed[15]), .A2(n71), .ZN(n36) );
  NAND2_X1 U39 ( .A1(reset), .A2(seed[15]), .ZN(n35) );
  OR2_X1 U40 ( .A1(seed[14]), .A2(n2), .ZN(n34) );
  NAND2_X1 U41 ( .A1(reset), .A2(seed[14]), .ZN(n33) );
  OR2_X1 U42 ( .A1(seed[13]), .A2(n71), .ZN(n32) );
  NAND2_X1 U43 ( .A1(reset), .A2(seed[13]), .ZN(n31) );
  OR2_X1 U44 ( .A1(seed[12]), .A2(n71), .ZN(n30) );
  NAND2_X1 U45 ( .A1(reset), .A2(seed[12]), .ZN(n29) );
  OR2_X1 U46 ( .A1(seed[11]), .A2(n71), .ZN(n28) );
  NAND2_X1 U47 ( .A1(reset), .A2(seed[11]), .ZN(n27) );
  OR2_X1 U48 ( .A1(seed[10]), .A2(n2), .ZN(n26) );
  NAND2_X1 U49 ( .A1(reset), .A2(seed[10]), .ZN(n25) );
  OR2_X1 U50 ( .A1(seed[9]), .A2(n71), .ZN(n24) );
  NAND2_X1 U51 ( .A1(reset), .A2(seed[9]), .ZN(n23) );
  OR2_X1 U52 ( .A1(seed[8]), .A2(n2), .ZN(n22) );
  NAND2_X1 U53 ( .A1(n1), .A2(seed[8]), .ZN(n21) );
  OR2_X1 U54 ( .A1(seed[7]), .A2(n71), .ZN(n20) );
  NAND2_X1 U55 ( .A1(reset), .A2(seed[7]), .ZN(n19) );
  OR2_X1 U56 ( .A1(seed[6]), .A2(n2), .ZN(n18) );
  NAND2_X1 U57 ( .A1(n1), .A2(seed[6]), .ZN(n17) );
  OR2_X1 U58 ( .A1(seed[5]), .A2(n2), .ZN(n16) );
  NAND2_X1 U59 ( .A1(reset), .A2(seed[5]), .ZN(n15) );
  OR2_X1 U60 ( .A1(seed[4]), .A2(n2), .ZN(n14) );
  NAND2_X1 U61 ( .A1(n1), .A2(seed[4]), .ZN(n13) );
  OR2_X1 U62 ( .A1(seed[3]), .A2(n2), .ZN(n12) );
  NAND2_X1 U63 ( .A1(reset), .A2(seed[3]), .ZN(n11) );
  OR2_X1 U64 ( .A1(seed[2]), .A2(n2), .ZN(n10) );
  NAND2_X1 U65 ( .A1(n1), .A2(seed[2]), .ZN(n9) );
  OR2_X1 U66 ( .A1(seed[1]), .A2(n71), .ZN(n8) );
  NAND2_X1 U67 ( .A1(reset), .A2(seed[1]), .ZN(n7) );
  OR2_X1 U68 ( .A1(seed[0]), .A2(n71), .ZN(n6) );
  NAND2_X1 U69 ( .A1(n1), .A2(seed[0]), .ZN(n5) );
  XOR2_X1 U70 ( .A(q[0]), .B(q[2]), .Z(n4) );
  XNOR2_X1 U71 ( .A(q[32]), .B(q[1]), .ZN(n3) );
  XNOR2_X1 U72 ( .A(n4), .B(n3), .ZN(n70) );
  XOR2_X1 U73 ( .A(q[22]), .B(n70), .Z(n69) );
endmodule


module phase_shifter_N32 ( data_in, data_out );
  input [32:0] data_in;
  output [32:0] data_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;

  XNOR2_X1 U1 ( .A(data_in[2]), .B(data_in[1]), .ZN(n1) );
  XNOR2_X1 U2 ( .A(n1), .B(data_in[0]), .ZN(data_out[0]) );
  XNOR2_X1 U3 ( .A(data_in[4]), .B(data_in[5]), .ZN(n2) );
  XNOR2_X1 U4 ( .A(data_in[3]), .B(n2), .ZN(data_out[3]) );
  XNOR2_X1 U5 ( .A(data_in[6]), .B(n2), .ZN(data_out[4]) );
  XNOR2_X1 U6 ( .A(data_in[18]), .B(data_in[19]), .ZN(n3) );
  XNOR2_X1 U7 ( .A(data_in[17]), .B(n3), .ZN(data_out[17]) );
  XNOR2_X1 U8 ( .A(data_in[20]), .B(n3), .ZN(data_out[18]) );
  XNOR2_X1 U9 ( .A(data_in[6]), .B(data_in[7]), .ZN(n4) );
  XNOR2_X1 U10 ( .A(data_in[5]), .B(n4), .ZN(data_out[5]) );
  XNOR2_X1 U11 ( .A(data_in[8]), .B(n4), .ZN(data_out[6]) );
  XNOR2_X1 U12 ( .A(data_in[8]), .B(data_in[9]), .ZN(n5) );
  XNOR2_X1 U13 ( .A(data_in[7]), .B(n5), .ZN(data_out[7]) );
  XNOR2_X1 U14 ( .A(data_in[10]), .B(n5), .ZN(data_out[8]) );
  XNOR2_X1 U15 ( .A(data_in[20]), .B(data_in[21]), .ZN(n6) );
  XNOR2_X1 U16 ( .A(data_in[19]), .B(n6), .ZN(data_out[19]) );
  XNOR2_X1 U17 ( .A(data_in[22]), .B(n6), .ZN(data_out[20]) );
  XNOR2_X1 U18 ( .A(data_in[27]), .B(data_in[26]), .ZN(n7) );
  XNOR2_X1 U19 ( .A(data_in[25]), .B(n7), .ZN(data_out[25]) );
  XNOR2_X1 U20 ( .A(data_in[28]), .B(n7), .ZN(data_out[26]) );
  XNOR2_X1 U21 ( .A(data_in[10]), .B(data_in[11]), .ZN(n8) );
  XNOR2_X1 U22 ( .A(data_in[9]), .B(n8), .ZN(data_out[9]) );
  XNOR2_X1 U23 ( .A(data_in[12]), .B(n8), .ZN(data_out[10]) );
  XNOR2_X1 U24 ( .A(data_in[12]), .B(data_in[13]), .ZN(n9) );
  XNOR2_X1 U25 ( .A(data_in[11]), .B(n9), .ZN(data_out[11]) );
  XNOR2_X1 U26 ( .A(data_in[14]), .B(n9), .ZN(data_out[12]) );
  XNOR2_X1 U27 ( .A(data_in[22]), .B(data_in[23]), .ZN(n10) );
  XNOR2_X1 U28 ( .A(data_in[21]), .B(n10), .ZN(data_out[21]) );
  XNOR2_X1 U29 ( .A(data_in[24]), .B(n10), .ZN(data_out[22]) );
  XNOR2_X1 U30 ( .A(data_in[14]), .B(data_in[15]), .ZN(n11) );
  XNOR2_X1 U31 ( .A(data_in[13]), .B(n11), .ZN(data_out[13]) );
  XNOR2_X1 U32 ( .A(data_in[16]), .B(n11), .ZN(data_out[14]) );
  XNOR2_X1 U33 ( .A(data_in[17]), .B(data_in[16]), .ZN(n12) );
  XNOR2_X1 U34 ( .A(data_in[15]), .B(n12), .ZN(data_out[15]) );
  XNOR2_X1 U35 ( .A(data_in[18]), .B(n12), .ZN(data_out[16]) );
  XNOR2_X1 U36 ( .A(data_in[25]), .B(data_in[24]), .ZN(n13) );
  XNOR2_X1 U37 ( .A(data_in[23]), .B(n13), .ZN(data_out[23]) );
  XNOR2_X1 U38 ( .A(data_in[26]), .B(n13), .ZN(data_out[24]) );
  XNOR2_X1 U39 ( .A(data_in[28]), .B(data_in[29]), .ZN(n14) );
  XNOR2_X1 U40 ( .A(data_in[27]), .B(n14), .ZN(data_out[27]) );
  XNOR2_X1 U41 ( .A(data_in[30]), .B(n14), .ZN(data_out[28]) );
  XNOR2_X1 U42 ( .A(data_in[2]), .B(data_in[3]), .ZN(n15) );
  XNOR2_X1 U43 ( .A(data_in[1]), .B(n15), .ZN(data_out[1]) );
  XNOR2_X1 U44 ( .A(data_in[4]), .B(n15), .ZN(data_out[2]) );
  XNOR2_X1 U45 ( .A(data_in[30]), .B(data_in[31]), .ZN(n16) );
  XNOR2_X1 U46 ( .A(data_in[29]), .B(n16), .ZN(data_out[29]) );
  XNOR2_X1 U47 ( .A(data_in[32]), .B(n16), .ZN(data_out[30]) );
endmodule


module LBIST_SEED_dimension32_SCAN_CHAIN_number190 ( CLK, RESET, START, 
        TEST_NORMAL, MISR_Pass_Fail, GO_NOGO, LFSR_reset, DUT_reset, seed, 
        FINISH, TEST_en_i_s );
  output [31:0] seed;
  input CLK, RESET, START, TEST_NORMAL, MISR_Pass_Fail;
  output GO_NOGO, LFSR_reset, DUT_reset, FINISH, TEST_en_i_s;
  wire   N108, N109, N110, N172, N173, N177, N179, N181, N184, N185, N187,
         N188, N191, N193, N194, N200, N201, N202, N203, N241, N244, N245,
         N246, N247, N248, N249, N250, N251, N252, N253, N254, N255, N256,
         N257, N258, N259, N260, N261, N262, N263, N264, N265, N266, N267,
         N268, N269, N270, N271, N272, N273, N274, N275, N276, N277, N278,
         N279, N280, N281, N283, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n144, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287;
  wire   [2:0] current_state;
  wire   [31:0] CNT_CLK;
  wire   [2:0] next_state;
  wire   [3:0] seed_index;
  wire   [31:0] CNT_LOOP;

  DLH_X1 next_state_reg_0_ ( .G(n142), .D(n146), .Q(next_state[0]) );
  DLH_X1 next_state_reg_2_ ( .G(n142), .D(n143), .Q(next_state[2]) );
  DLH_X1 next_state_reg_1_ ( .G(n142), .D(n145), .Q(next_state[1]) );
  DLH_X1 START_LOOP_reg ( .G(N283), .D(n148), .Q(TEST_en_i_s) );
  DLH_X1 LFSR_reset_reg ( .G(n147), .D(N244), .Q(LFSR_reset) );
  DLH_X1 DUT_reset_reg ( .G(n287), .D(n148), .Q(DUT_reset) );
  DLH_X1 CNT_LOOP_reg_31_ ( .G(N241), .D(N281), .Q(CNT_LOOP[31]) );
  DLH_X1 CNT_LOOP_reg_30_ ( .G(n287), .D(N280), .Q(CNT_LOOP[30]) );
  DLH_X1 CNT_LOOP_reg_29_ ( .G(N241), .D(N279), .Q(CNT_LOOP[29]) );
  DLH_X1 CNT_LOOP_reg_28_ ( .G(n287), .D(N278), .Q(CNT_LOOP[28]) );
  DLH_X1 CNT_LOOP_reg_27_ ( .G(N241), .D(N277), .Q(CNT_LOOP[27]) );
  DLH_X1 CNT_LOOP_reg_26_ ( .G(n287), .D(N276), .Q(CNT_LOOP[26]) );
  DLH_X1 CNT_LOOP_reg_25_ ( .G(N241), .D(N275), .Q(CNT_LOOP[25]) );
  DLH_X1 CNT_LOOP_reg_24_ ( .G(n287), .D(N274), .Q(CNT_LOOP[24]) );
  DLH_X1 CNT_LOOP_reg_23_ ( .G(N241), .D(N273), .Q(CNT_LOOP[23]) );
  DLH_X1 CNT_LOOP_reg_22_ ( .G(n287), .D(N272), .Q(CNT_LOOP[22]) );
  DLH_X1 CNT_LOOP_reg_21_ ( .G(N241), .D(N271), .Q(CNT_LOOP[21]) );
  DLH_X1 CNT_LOOP_reg_20_ ( .G(N241), .D(N270), .Q(CNT_LOOP[20]) );
  DLH_X1 CNT_LOOP_reg_19_ ( .G(n287), .D(N269), .Q(CNT_LOOP[19]) );
  DLH_X1 CNT_LOOP_reg_18_ ( .G(N241), .D(N268), .Q(CNT_LOOP[18]) );
  DLH_X1 CNT_LOOP_reg_17_ ( .G(n287), .D(N267), .Q(CNT_LOOP[17]) );
  DLH_X1 CNT_LOOP_reg_16_ ( .G(N241), .D(N266), .Q(CNT_LOOP[16]) );
  DLH_X1 CNT_LOOP_reg_15_ ( .G(n287), .D(N265), .Q(CNT_LOOP[15]) );
  DLH_X1 CNT_LOOP_reg_14_ ( .G(N241), .D(N264), .Q(CNT_LOOP[14]) );
  DLH_X1 CNT_LOOP_reg_13_ ( .G(n287), .D(N263), .Q(CNT_LOOP[13]) );
  DLH_X1 CNT_LOOP_reg_12_ ( .G(N241), .D(N262), .Q(CNT_LOOP[12]) );
  DLH_X1 CNT_LOOP_reg_11_ ( .G(N241), .D(N261), .Q(CNT_LOOP[11]) );
  DLH_X1 CNT_LOOP_reg_10_ ( .G(n287), .D(N260), .Q(CNT_LOOP[10]) );
  DLH_X1 CNT_LOOP_reg_9_ ( .G(n287), .D(N259), .Q(CNT_LOOP[9]) );
  DLH_X1 CNT_LOOP_reg_8_ ( .G(n287), .D(N258), .Q(CNT_LOOP[8]) );
  DLH_X1 CNT_LOOP_reg_7_ ( .G(n287), .D(N257), .Q(CNT_LOOP[7]) );
  DLH_X1 CNT_LOOP_reg_6_ ( .G(n287), .D(N256), .Q(CNT_LOOP[6]) );
  DLH_X1 CNT_LOOP_reg_5_ ( .G(n287), .D(N255), .Q(CNT_LOOP[5]) );
  DLH_X1 CNT_LOOP_reg_4_ ( .G(n287), .D(N254), .Q(CNT_LOOP[4]) );
  DLH_X1 CNT_LOOP_reg_3_ ( .G(N241), .D(N253), .Q(CNT_LOOP[3]) );
  DLH_X1 CNT_LOOP_reg_2_ ( .G(n287), .D(N252), .Q(CNT_LOOP[2]) );
  DLH_X1 CNT_LOOP_reg_1_ ( .G(N241), .D(N251), .Q(CNT_LOOP[1]) );
  DLH_X1 CNT_LOOP_reg_0_ ( .G(n287), .D(N250), .Q(CNT_LOOP[0]) );
  DLH_X1 seed_index_reg_0_ ( .G(N245), .D(N246), .Q(seed_index[0]) );
  DLH_X1 seed_index_reg_1_ ( .G(N245), .D(N247), .Q(seed_index[1]) );
  DLH_X1 seed_reg_18_ ( .G(n149), .D(N185), .Q(seed[18]) );
  DLH_X1 seed_reg_15_ ( .G(n149), .D(N188), .Q(seed[15]) );
  DLH_X1 seed_reg_12_ ( .G(n149), .D(N191), .Q(seed[12]) );
  DLH_X1 seed_reg_14_ ( .G(n149), .D(N191), .Q(seed[14]) );
  DLH_X1 seed_reg_22_ ( .G(n149), .D(N181), .Q(seed[22]) );
  DLH_X1 seed_reg_19_ ( .G(n149), .D(N184), .Q(seed[19]) );
  DLH_X1 seed_reg_23_ ( .G(n149), .D(N184), .Q(seed[23]) );
  DLH_X1 seed_reg_30_ ( .G(n149), .D(N173), .Q(seed[30]) );
  DLH_X1 seed_reg_31_ ( .G(n149), .D(N172), .Q(seed[31]) );
  DLH_X1 seed_reg_9_ ( .G(n149), .D(N194), .Q(seed[9]) );
  DLH_X1 seed_reg_3_ ( .G(n149), .D(N200), .Q(seed[3]) );
  DLH_X1 seed_reg_7_ ( .G(n149), .D(N200), .Q(seed[7]) );
  DLH_X1 seed_reg_26_ ( .G(n149), .D(N177), .Q(seed[26]) );
  DLH_X1 seed_reg_24_ ( .G(n149), .D(N179), .Q(seed[24]) );
  DLH_X1 seed_reg_10_ ( .G(n149), .D(N193), .Q(seed[10]) );
  DLH_X1 seed_reg_1_ ( .G(n149), .D(N202), .Q(seed[1]) );
  DLH_X1 seed_reg_5_ ( .G(n149), .D(N202), .Q(seed[5]) );
  DLH_X1 seed_reg_0_ ( .G(n149), .D(N203), .Q(seed[0]) );
  DLH_X1 seed_reg_4_ ( .G(n149), .D(N203), .Q(seed[4]) );
  DLH_X1 seed_reg_2_ ( .G(n149), .D(N201), .Q(seed[2]) );
  DLH_X1 seed_reg_27_ ( .G(n149), .D(N201), .Q(seed[27]) );
  DLH_X1 seed_reg_29_ ( .G(n149), .D(N201), .Q(seed[29]) );
  DLH_X1 seed_reg_17_ ( .G(n149), .D(n158), .Q(seed[17]) );
  DLH_X1 seed_reg_21_ ( .G(n149), .D(n157), .Q(seed[21]) );
  DLH_X1 seed_reg_16_ ( .G(n149), .D(N187), .Q(seed[16]) );
  DLH_X1 seed_reg_25_ ( .G(n149), .D(n156), .Q(seed[25]) );
  DLH_X1 seed_reg_20_ ( .G(n149), .D(n155), .Q(seed[20]) );
  DLH_X1 seed_reg_6_ ( .G(n149), .D(n154), .Q(seed[6]) );
  DLH_X1 seed_reg_8_ ( .G(n149), .D(n153), .Q(seed[8]) );
  DLH_X1 seed_reg_28_ ( .G(n149), .D(n152), .Q(seed[28]) );
  DLH_X1 seed_reg_11_ ( .G(n149), .D(n151), .Q(seed[11]) );
  DLH_X1 seed_reg_13_ ( .G(n149), .D(n150), .Q(seed[13]) );
  DFF_X1 current_state_reg_0_ ( .D(N108), .CK(CLK), .Q(current_state[0]), .QN(
        n284) );
  DFF_X1 CNT_CLK_reg_31_ ( .D(n110), .CK(CLK), .Q(CNT_CLK[31]) );
  DFF_X1 current_state_reg_2_ ( .D(N110), .CK(CLK), .Q(current_state[2]) );
  DFF_X1 current_state_reg_1_ ( .D(N109), .CK(CLK), .Q(current_state[1]), .QN(
        n285) );
  DFF_X1 CNT_CLK_reg_0_ ( .D(n141), .CK(CLK), .Q(CNT_CLK[0]), .QN(n286) );
  DFF_X1 CNT_CLK_reg_1_ ( .D(n140), .CK(CLK), .Q(CNT_CLK[1]) );
  DFF_X1 CNT_CLK_reg_2_ ( .D(n139), .CK(CLK), .Q(CNT_CLK[2]), .QN(n17) );
  DFF_X1 CNT_CLK_reg_3_ ( .D(n138), .CK(CLK), .Q(CNT_CLK[3]), .QN(n1) );
  DFF_X1 CNT_CLK_reg_4_ ( .D(n137), .CK(CLK), .Q(CNT_CLK[4]) );
  DFF_X1 CNT_CLK_reg_5_ ( .D(n136), .CK(CLK), .Q(CNT_CLK[5]) );
  DFF_X1 CNT_CLK_reg_6_ ( .D(n135), .CK(CLK), .Q(CNT_CLK[6]), .QN(n283) );
  DFF_X1 CNT_CLK_reg_7_ ( .D(n134), .CK(CLK), .Q(CNT_CLK[7]), .QN(n4) );
  DFF_X1 CNT_CLK_reg_8_ ( .D(n133), .CK(CLK), .Q(CNT_CLK[8]), .QN(n5) );
  DFF_X1 CNT_CLK_reg_9_ ( .D(n132), .CK(CLK), .Q(CNT_CLK[9]), .QN(n6) );
  DFF_X1 CNT_CLK_reg_10_ ( .D(n131), .CK(CLK), .Q(CNT_CLK[10]), .QN(n16) );
  DFF_X1 CNT_CLK_reg_11_ ( .D(n130), .CK(CLK), .Q(CNT_CLK[11]) );
  DFF_X1 CNT_CLK_reg_12_ ( .D(n129), .CK(CLK), .Q(CNT_CLK[12]), .QN(n15) );
  DFF_X1 CNT_CLK_reg_13_ ( .D(n128), .CK(CLK), .Q(CNT_CLK[13]), .QN(n14) );
  DFF_X1 CNT_CLK_reg_14_ ( .D(n127), .CK(CLK), .Q(CNT_CLK[14]), .QN(n13) );
  DFF_X1 CNT_CLK_reg_15_ ( .D(n126), .CK(CLK), .Q(CNT_CLK[15]), .QN(n19) );
  DFF_X1 CNT_CLK_reg_16_ ( .D(n125), .CK(CLK), .Q(CNT_CLK[16]), .QN(n12) );
  DFF_X1 CNT_CLK_reg_17_ ( .D(n124), .CK(CLK), .Q(CNT_CLK[17]) );
  DFF_X1 CNT_CLK_reg_18_ ( .D(n123), .CK(CLK), .Q(CNT_CLK[18]), .QN(n11) );
  DFF_X1 CNT_CLK_reg_19_ ( .D(n122), .CK(CLK), .Q(CNT_CLK[19]), .QN(n10) );
  DFF_X1 CNT_CLK_reg_20_ ( .D(n121), .CK(CLK), .Q(CNT_CLK[20]), .QN(n18) );
  DFF_X1 CNT_CLK_reg_21_ ( .D(n120), .CK(CLK), .Q(CNT_CLK[21]) );
  DFF_X1 CNT_CLK_reg_22_ ( .D(n119), .CK(CLK), .Q(CNT_CLK[22]), .QN(n9) );
  DFF_X1 CNT_CLK_reg_23_ ( .D(n118), .CK(CLK), .Q(CNT_CLK[23]), .QN(n8) );
  DFF_X1 CNT_CLK_reg_24_ ( .D(n117), .CK(CLK), .Q(CNT_CLK[24]) );
  DFF_X1 CNT_CLK_reg_25_ ( .D(n116), .CK(CLK), .Q(CNT_CLK[25]) );
  DFF_X1 CNT_CLK_reg_26_ ( .D(n115), .CK(CLK), .Q(CNT_CLK[26]), .QN(n7) );
  DFF_X1 CNT_CLK_reg_27_ ( .D(n114), .CK(CLK), .Q(CNT_CLK[27]), .QN(n2) );
  DFF_X1 CNT_CLK_reg_28_ ( .D(n113), .CK(CLK), .Q(CNT_CLK[28]) );
  DFF_X1 CNT_CLK_reg_29_ ( .D(n112), .CK(CLK), .Q(CNT_CLK[29]) );
  DFF_X1 CNT_CLK_reg_30_ ( .D(n111), .CK(CLK), .Q(CNT_CLK[30]), .QN(n3) );
  DLH_X1 seed_index_reg_2_ ( .G(N245), .D(N248), .Q(seed_index[2]) );
  DLH_X1 seed_index_reg_3_ ( .G(N245), .D(N249), .Q(seed_index[3]) );
  AND2_X1 U3 ( .A1(n240), .A2(CNT_CLK[18]), .ZN(n244) );
  AND2_X1 U4 ( .A1(n247), .A2(CNT_CLK[20]), .ZN(n250) );
  AND2_X1 U5 ( .A1(n244), .A2(CNT_CLK[19]), .ZN(n247) );
  AND2_X1 U6 ( .A1(n234), .A2(CNT_CLK[16]), .ZN(n237) );
  AND2_X1 U7 ( .A1(n231), .A2(CNT_CLK[15]), .ZN(n234) );
  AND2_X1 U8 ( .A1(n228), .A2(CNT_CLK[14]), .ZN(n231) );
  AND2_X1 U9 ( .A1(n216), .A2(CNT_CLK[10]), .ZN(n219) );
  AND2_X1 U10 ( .A1(n213), .A2(CNT_CLK[9]), .ZN(n216) );
  AND2_X1 U11 ( .A1(n210), .A2(CNT_CLK[8]), .ZN(n213) );
  NOR2_X1 U12 ( .A1(n207), .A2(n4), .ZN(n210) );
  AND2_X1 U13 ( .A1(n194), .A2(CNT_CLK[3]), .ZN(n197) );
  AND2_X1 U14 ( .A1(n191), .A2(CNT_CLK[2]), .ZN(n194) );
  AND2_X1 U15 ( .A1(CNT_CLK[0]), .A2(CNT_CLK[1]), .ZN(n191) );
  CLKBUF_X1 U16 ( .A(n280), .Z(n252) );
  XNOR2_X1 U17 ( .A(n266), .B(n7), .ZN(n267) );
  XNOR2_X1 U18 ( .A(n257), .B(CNT_CLK[23]), .ZN(n258) );
  XNOR2_X1 U19 ( .A(n254), .B(n9), .ZN(n255) );
  XNOR2_X1 U20 ( .A(n247), .B(n18), .ZN(n248) );
  XNOR2_X1 U21 ( .A(n244), .B(n10), .ZN(n245) );
  XNOR2_X1 U22 ( .A(n240), .B(n11), .ZN(n241) );
  XNOR2_X1 U23 ( .A(n234), .B(n12), .ZN(n235) );
  XNOR2_X1 U24 ( .A(n231), .B(n19), .ZN(n232) );
  NOR2_X1 U25 ( .A1(n269), .A2(n2), .ZN(n272) );
  NOR2_X1 U26 ( .A1(n257), .A2(n8), .ZN(n260) );
  NOR2_X1 U27 ( .A1(n225), .A2(n14), .ZN(n228) );
  XNOR2_X1 U28 ( .A(n269), .B(CNT_CLK[27]), .ZN(n270) );
  XNOR2_X1 U29 ( .A(n222), .B(n15), .ZN(n223) );
  NOR2_X1 U30 ( .A1(current_state[2]), .A2(n285), .ZN(N283) );
  NAND2_X1 U31 ( .A1(n203), .A2(CNT_CLK[6]), .ZN(n207) );
  NAND2_X1 U32 ( .A1(n222), .A2(CNT_CLK[12]), .ZN(n225) );
  NAND2_X1 U33 ( .A1(n254), .A2(CNT_CLK[22]), .ZN(n257) );
  NAND2_X1 U34 ( .A1(n266), .A2(CNT_CLK[26]), .ZN(n269) );
  NAND2_X1 U35 ( .A1(n278), .A2(CNT_CLK[30]), .ZN(n20) );
  XNOR2_X1 U36 ( .A(n20), .B(CNT_CLK[31]), .ZN(n21) );
  INV_X1 U37 ( .A(N283), .ZN(n175) );
  INV_X1 U38 ( .A(RESET), .ZN(n35) );
  OAI211_X1 U39 ( .C1(n284), .C2(n175), .A(TEST_en_i_s), .B(n35), .ZN(n188) );
  INV_X1 U40 ( .A(n188), .ZN(n280) );
  NAND2_X1 U41 ( .A1(n21), .A2(n280), .ZN(n23) );
  OR2_X1 U42 ( .A1(TEST_en_i_s), .A2(RESET), .ZN(n206) );
  INV_X1 U43 ( .A(n206), .ZN(n281) );
  NAND2_X1 U44 ( .A1(CNT_CLK[31]), .A2(n281), .ZN(n22) );
  NAND2_X1 U45 ( .A1(n23), .A2(n22), .ZN(n110) );
  NOR2_X1 U46 ( .A1(current_state[2]), .A2(current_state[1]), .ZN(N244) );
  NAND2_X1 U47 ( .A1(current_state[0]), .A2(N244), .ZN(n171) );
  INV_X1 U48 ( .A(n171), .ZN(n149) );
  NOR2_X1 U49 ( .A1(current_state[2]), .A2(current_state[0]), .ZN(N241) );
  CLKBUF_X1 U50 ( .A(N241), .Z(n287) );
  NAND2_X1 U51 ( .A1(n284), .A2(N283), .ZN(n172) );
  INV_X1 U52 ( .A(n172), .ZN(n148) );
  NOR2_X1 U53 ( .A1(CNT_LOOP[1]), .A2(CNT_LOOP[0]), .ZN(n40) );
  NOR4_X1 U54 ( .A1(CNT_LOOP[31]), .A2(CNT_LOOP[7]), .A3(CNT_LOOP[4]), .A4(
        CNT_LOOP[3]), .ZN(n25) );
  INV_X1 U55 ( .A(CNT_LOOP[9]), .ZN(n24) );
  INV_X1 U56 ( .A(CNT_LOOP[8]), .ZN(n55) );
  NAND4_X1 U57 ( .A1(n40), .A2(n25), .A3(n24), .A4(n55), .ZN(n33) );
  INV_X1 U58 ( .A(CNT_LOOP[30]), .ZN(n99) );
  NAND4_X1 U59 ( .A1(CNT_LOOP[6]), .A2(CNT_LOOP[5]), .A3(CNT_LOOP[2]), .A4(n99), .ZN(n32) );
  OR4_X1 U60 ( .A1(CNT_LOOP[29]), .A2(CNT_LOOP[28]), .A3(CNT_LOOP[27]), .A4(
        CNT_LOOP[26]), .ZN(n31) );
  NOR4_X1 U61 ( .A1(CNT_LOOP[17]), .A2(CNT_LOOP[16]), .A3(CNT_LOOP[15]), .A4(
        CNT_LOOP[14]), .ZN(n29) );
  NOR4_X1 U62 ( .A1(CNT_LOOP[13]), .A2(CNT_LOOP[12]), .A3(CNT_LOOP[11]), .A4(
        CNT_LOOP[10]), .ZN(n28) );
  NOR4_X1 U63 ( .A1(CNT_LOOP[25]), .A2(CNT_LOOP[24]), .A3(CNT_LOOP[23]), .A4(
        CNT_LOOP[22]), .ZN(n27) );
  NOR4_X1 U64 ( .A1(CNT_LOOP[21]), .A2(CNT_LOOP[20]), .A3(CNT_LOOP[19]), .A4(
        CNT_LOOP[18]), .ZN(n26) );
  NAND4_X1 U65 ( .A1(n29), .A2(n28), .A3(n27), .A4(n26), .ZN(n30) );
  NOR4_X1 U66 ( .A1(n33), .A2(n32), .A3(n31), .A4(n30), .ZN(n173) );
  AND3_X1 U67 ( .A1(N283), .A2(current_state[0]), .A3(n173), .ZN(n143) );
  INV_X1 U68 ( .A(seed_index[0]), .ZN(n166) );
  INV_X1 U69 ( .A(seed_index[3]), .ZN(n165) );
  OAI21_X1 U70 ( .B1(seed_index[2]), .B2(seed_index[1]), .A(n165), .ZN(n170)
         );
  NAND2_X1 U71 ( .A1(n166), .A2(seed_index[1]), .ZN(n159) );
  INV_X1 U72 ( .A(n159), .ZN(n38) );
  NAND2_X1 U73 ( .A1(n166), .A2(seed_index[3]), .ZN(n39) );
  INV_X1 U74 ( .A(n39), .ZN(n34) );
  AOI21_X1 U75 ( .B1(seed_index[2]), .B2(n38), .A(n34), .ZN(n36) );
  OAI21_X1 U76 ( .B1(n166), .B2(n170), .A(n36), .ZN(N187) );
  AND2_X1 U77 ( .A1(next_state[0]), .A2(n35), .ZN(N108) );
  AND2_X1 U78 ( .A1(next_state[1]), .A2(n35), .ZN(N109) );
  AND2_X1 U79 ( .A1(next_state[2]), .A2(n35), .ZN(N110) );
  INV_X1 U80 ( .A(seed_index[1]), .ZN(n108) );
  AOI21_X1 U81 ( .B1(seed_index[0]), .B2(n108), .A(n38), .ZN(n102) );
  INV_X1 U82 ( .A(seed_index[2]), .ZN(n167) );
  OAI21_X1 U83 ( .B1(n102), .B2(n167), .A(n39), .ZN(N173) );
  NOR2_X1 U84 ( .A1(n108), .A2(n166), .ZN(n37) );
  NAND2_X1 U85 ( .A1(n37), .A2(n167), .ZN(n162) );
  NAND2_X1 U86 ( .A1(n36), .A2(n162), .ZN(N177) );
  INV_X1 U87 ( .A(n37), .ZN(n164) );
  NAND2_X1 U88 ( .A1(n165), .A2(n164), .ZN(N179) );
  OAI21_X1 U89 ( .B1(seed_index[3]), .B2(seed_index[2]), .A(seed_index[0]), 
        .ZN(n109) );
  OAI21_X1 U90 ( .B1(n159), .B2(n167), .A(n109), .ZN(N181) );
  NAND2_X1 U91 ( .A1(seed_index[2]), .A2(n166), .ZN(n163) );
  OAI21_X1 U92 ( .B1(seed_index[3]), .B2(seed_index[1]), .A(seed_index[0]), 
        .ZN(n107) );
  OAI21_X1 U93 ( .B1(seed_index[1]), .B2(n163), .A(n107), .ZN(N184) );
  NAND2_X1 U94 ( .A1(seed_index[2]), .A2(seed_index[0]), .ZN(n144) );
  NAND2_X1 U95 ( .A1(n159), .A2(n144), .ZN(N185) );
  NAND2_X1 U96 ( .A1(n159), .A2(n163), .ZN(N188) );
  OAI21_X1 U97 ( .B1(n37), .B2(n167), .A(n162), .ZN(N191) );
  OAI211_X1 U98 ( .C1(seed_index[1]), .C2(n144), .A(n165), .B(n162), .ZN(N193)
         );
  NAND2_X1 U99 ( .A1(n108), .A2(seed_index[2]), .ZN(n160) );
  NAND3_X1 U100 ( .A1(n39), .A2(n162), .A3(n160), .ZN(N194) );
  OAI21_X1 U101 ( .B1(seed_index[1]), .B2(n163), .A(n39), .ZN(N172) );
  OR2_X1 U102 ( .A1(n37), .A2(N172), .ZN(N200) );
  OAI21_X1 U103 ( .B1(n38), .B2(n167), .A(n39), .ZN(N201) );
  NAND2_X1 U104 ( .A1(n39), .A2(n144), .ZN(N203) );
  OAI21_X1 U105 ( .B1(seed_index[2]), .B2(n108), .A(n39), .ZN(N202) );
  NOR2_X1 U106 ( .A1(CNT_LOOP[0]), .A2(n172), .ZN(N250) );
  NAND2_X1 U107 ( .A1(CNT_LOOP[1]), .A2(CNT_LOOP[0]), .ZN(n42) );
  INV_X1 U108 ( .A(n42), .ZN(n41) );
  NOR3_X1 U109 ( .A1(n41), .A2(n40), .A3(n172), .ZN(N251) );
  INV_X1 U110 ( .A(CNT_LOOP[2]), .ZN(n43) );
  NOR2_X1 U111 ( .A1(n43), .A2(n42), .ZN(n44) );
  AOI211_X1 U112 ( .C1(n43), .C2(n42), .A(n44), .B(n172), .ZN(N252) );
  NAND2_X1 U113 ( .A1(CNT_LOOP[3]), .A2(n44), .ZN(n46) );
  OAI211_X1 U114 ( .C1(CNT_LOOP[3]), .C2(n44), .A(n148), .B(n46), .ZN(n45) );
  INV_X1 U115 ( .A(n45), .ZN(N253) );
  INV_X1 U116 ( .A(CNT_LOOP[4]), .ZN(n47) );
  NOR2_X1 U117 ( .A1(n47), .A2(n46), .ZN(n48) );
  AOI211_X1 U118 ( .C1(n47), .C2(n46), .A(n48), .B(n172), .ZN(N254) );
  NAND2_X1 U119 ( .A1(CNT_LOOP[5]), .A2(n48), .ZN(n50) );
  OAI211_X1 U120 ( .C1(CNT_LOOP[5]), .C2(n48), .A(n148), .B(n50), .ZN(n49) );
  INV_X1 U121 ( .A(n49), .ZN(N255) );
  INV_X1 U122 ( .A(CNT_LOOP[6]), .ZN(n51) );
  NOR2_X1 U123 ( .A1(n51), .A2(n50), .ZN(n52) );
  AOI211_X1 U124 ( .C1(n51), .C2(n50), .A(n52), .B(n172), .ZN(N256) );
  NAND2_X1 U125 ( .A1(CNT_LOOP[7]), .A2(n52), .ZN(n54) );
  OAI211_X1 U126 ( .C1(CNT_LOOP[7]), .C2(n52), .A(n148), .B(n54), .ZN(n53) );
  INV_X1 U127 ( .A(n53), .ZN(N257) );
  NOR2_X1 U128 ( .A1(n55), .A2(n54), .ZN(n56) );
  AOI211_X1 U129 ( .C1(n55), .C2(n54), .A(n56), .B(n172), .ZN(N258) );
  NAND2_X1 U130 ( .A1(CNT_LOOP[9]), .A2(n56), .ZN(n58) );
  OAI211_X1 U131 ( .C1(CNT_LOOP[9]), .C2(n56), .A(n148), .B(n58), .ZN(n57) );
  INV_X1 U132 ( .A(n57), .ZN(N259) );
  INV_X1 U133 ( .A(CNT_LOOP[10]), .ZN(n59) );
  NOR2_X1 U134 ( .A1(n59), .A2(n58), .ZN(n60) );
  AOI211_X1 U135 ( .C1(n59), .C2(n58), .A(n60), .B(n172), .ZN(N260) );
  NAND2_X1 U136 ( .A1(CNT_LOOP[11]), .A2(n60), .ZN(n62) );
  OAI211_X1 U137 ( .C1(CNT_LOOP[11]), .C2(n60), .A(n148), .B(n62), .ZN(n61) );
  INV_X1 U138 ( .A(n61), .ZN(N261) );
  INV_X1 U139 ( .A(CNT_LOOP[12]), .ZN(n63) );
  NOR2_X1 U140 ( .A1(n63), .A2(n62), .ZN(n64) );
  AOI211_X1 U141 ( .C1(n63), .C2(n62), .A(n64), .B(n172), .ZN(N262) );
  NAND2_X1 U142 ( .A1(CNT_LOOP[13]), .A2(n64), .ZN(n66) );
  OAI211_X1 U143 ( .C1(CNT_LOOP[13]), .C2(n64), .A(n148), .B(n66), .ZN(n65) );
  INV_X1 U144 ( .A(n65), .ZN(N263) );
  INV_X1 U145 ( .A(CNT_LOOP[14]), .ZN(n67) );
  NOR2_X1 U146 ( .A1(n67), .A2(n66), .ZN(n68) );
  AOI211_X1 U147 ( .C1(n67), .C2(n66), .A(n68), .B(n172), .ZN(N264) );
  NAND2_X1 U148 ( .A1(CNT_LOOP[15]), .A2(n68), .ZN(n70) );
  OAI211_X1 U149 ( .C1(CNT_LOOP[15]), .C2(n68), .A(n148), .B(n70), .ZN(n69) );
  INV_X1 U150 ( .A(n69), .ZN(N265) );
  INV_X1 U151 ( .A(CNT_LOOP[16]), .ZN(n71) );
  NOR2_X1 U152 ( .A1(n71), .A2(n70), .ZN(n72) );
  AOI211_X1 U153 ( .C1(n71), .C2(n70), .A(n72), .B(n172), .ZN(N266) );
  NAND2_X1 U154 ( .A1(CNT_LOOP[17]), .A2(n72), .ZN(n74) );
  OAI211_X1 U155 ( .C1(CNT_LOOP[17]), .C2(n72), .A(n148), .B(n74), .ZN(n73) );
  INV_X1 U156 ( .A(n73), .ZN(N267) );
  INV_X1 U157 ( .A(CNT_LOOP[18]), .ZN(n75) );
  NOR2_X1 U158 ( .A1(n75), .A2(n74), .ZN(n76) );
  AOI211_X1 U159 ( .C1(n75), .C2(n74), .A(n76), .B(n172), .ZN(N268) );
  NAND2_X1 U160 ( .A1(CNT_LOOP[19]), .A2(n76), .ZN(n78) );
  OAI211_X1 U161 ( .C1(CNT_LOOP[19]), .C2(n76), .A(n148), .B(n78), .ZN(n77) );
  INV_X1 U162 ( .A(n77), .ZN(N269) );
  INV_X1 U163 ( .A(CNT_LOOP[20]), .ZN(n79) );
  NOR2_X1 U164 ( .A1(n79), .A2(n78), .ZN(n80) );
  AOI211_X1 U165 ( .C1(n79), .C2(n78), .A(n80), .B(n172), .ZN(N270) );
  NAND2_X1 U166 ( .A1(CNT_LOOP[21]), .A2(n80), .ZN(n82) );
  OAI211_X1 U167 ( .C1(CNT_LOOP[21]), .C2(n80), .A(n148), .B(n82), .ZN(n81) );
  INV_X1 U168 ( .A(n81), .ZN(N271) );
  INV_X1 U169 ( .A(CNT_LOOP[22]), .ZN(n83) );
  NOR2_X1 U170 ( .A1(n83), .A2(n82), .ZN(n84) );
  AOI211_X1 U171 ( .C1(n83), .C2(n82), .A(n84), .B(n172), .ZN(N272) );
  NAND2_X1 U172 ( .A1(CNT_LOOP[23]), .A2(n84), .ZN(n86) );
  OAI211_X1 U173 ( .C1(CNT_LOOP[23]), .C2(n84), .A(n148), .B(n86), .ZN(n85) );
  INV_X1 U174 ( .A(n85), .ZN(N273) );
  INV_X1 U175 ( .A(CNT_LOOP[24]), .ZN(n87) );
  NOR2_X1 U176 ( .A1(n87), .A2(n86), .ZN(n88) );
  AOI211_X1 U177 ( .C1(n87), .C2(n86), .A(n88), .B(n172), .ZN(N274) );
  NAND2_X1 U178 ( .A1(CNT_LOOP[25]), .A2(n88), .ZN(n90) );
  OAI211_X1 U179 ( .C1(CNT_LOOP[25]), .C2(n88), .A(n148), .B(n90), .ZN(n89) );
  INV_X1 U180 ( .A(n89), .ZN(N275) );
  INV_X1 U181 ( .A(CNT_LOOP[26]), .ZN(n91) );
  NOR2_X1 U182 ( .A1(n91), .A2(n90), .ZN(n92) );
  AOI211_X1 U183 ( .C1(n91), .C2(n90), .A(n92), .B(n172), .ZN(N276) );
  NAND2_X1 U184 ( .A1(CNT_LOOP[27]), .A2(n92), .ZN(n94) );
  OAI211_X1 U185 ( .C1(CNT_LOOP[27]), .C2(n92), .A(n148), .B(n94), .ZN(n93) );
  INV_X1 U186 ( .A(n93), .ZN(N277) );
  INV_X1 U187 ( .A(CNT_LOOP[28]), .ZN(n95) );
  NOR2_X1 U188 ( .A1(n95), .A2(n94), .ZN(n96) );
  AOI211_X1 U189 ( .C1(n95), .C2(n94), .A(n96), .B(n172), .ZN(N278) );
  NAND2_X1 U190 ( .A1(CNT_LOOP[29]), .A2(n96), .ZN(n98) );
  OAI211_X1 U191 ( .C1(CNT_LOOP[29]), .C2(n96), .A(n148), .B(n98), .ZN(n97) );
  INV_X1 U192 ( .A(n97), .ZN(N279) );
  NOR2_X1 U193 ( .A1(n99), .A2(n98), .ZN(n101) );
  AOI211_X1 U194 ( .C1(n99), .C2(n98), .A(n101), .B(n172), .ZN(N280) );
  OAI21_X1 U195 ( .B1(CNT_LOOP[31]), .B2(n101), .A(n148), .ZN(n100) );
  AOI21_X1 U196 ( .B1(CNT_LOOP[31]), .B2(n101), .A(n100), .ZN(N281) );
  NOR2_X1 U197 ( .A1(current_state[1]), .A2(current_state[0]), .ZN(N245) );
  NAND2_X1 U198 ( .A1(current_state[2]), .A2(N245), .ZN(n103) );
  NOR2_X1 U199 ( .A1(n102), .A2(n103), .ZN(N247) );
  INV_X1 U200 ( .A(n103), .ZN(n104) );
  AND2_X1 U201 ( .A1(n104), .A2(N191), .ZN(N248) );
  NOR2_X1 U202 ( .A1(seed_index[0]), .A2(n103), .ZN(N246) );
  NOR2_X1 U203 ( .A1(n167), .A2(n164), .ZN(n106) );
  OAI21_X1 U204 ( .B1(seed_index[3]), .B2(n106), .A(n104), .ZN(n105) );
  AOI21_X1 U205 ( .B1(seed_index[3]), .B2(n106), .A(n105), .ZN(N249) );
  AOI21_X1 U206 ( .B1(n108), .B2(n163), .A(seed_index[3]), .ZN(n158) );
  OAI21_X1 U207 ( .B1(seed_index[3]), .B2(n163), .A(n107), .ZN(n157) );
  OAI211_X1 U208 ( .C1(n167), .C2(n108), .A(n165), .B(n163), .ZN(n156) );
  OAI21_X1 U209 ( .B1(seed_index[3]), .B2(n159), .A(n109), .ZN(n155) );
  OAI211_X1 U210 ( .C1(seed_index[2]), .C2(n159), .A(n165), .B(n144), .ZN(n154) );
  INV_X1 U211 ( .A(n160), .ZN(n161) );
  OAI21_X1 U212 ( .B1(seed_index[3]), .B2(n161), .A(seed_index[0]), .ZN(n169)
         );
  OAI211_X1 U213 ( .C1(seed_index[3]), .C2(n163), .A(n169), .B(n162), .ZN(n153) );
  OAI211_X1 U214 ( .C1(n167), .C2(n166), .A(n165), .B(n164), .ZN(n152) );
  AOI21_X1 U215 ( .B1(seed_index[2]), .B2(seed_index[1]), .A(n152), .ZN(n168)
         );
  INV_X1 U216 ( .A(n168), .ZN(n151) );
  OAI21_X1 U217 ( .B1(seed_index[0]), .B2(n170), .A(n169), .ZN(n150) );
  OR2_X1 U218 ( .A1(N244), .A2(n287), .ZN(n147) );
  OR2_X1 U219 ( .A1(N245), .A2(n287), .ZN(n146) );
  OR2_X1 U220 ( .A1(n284), .A2(current_state[2]), .ZN(n187) );
  OAI211_X1 U221 ( .C1(n173), .C2(n187), .A(n172), .B(n171), .ZN(n145) );
  NAND4_X1 U222 ( .A1(CNT_CLK[2]), .A2(CNT_CLK[3]), .A3(CNT_CLK[1]), .A4(n286), 
        .ZN(n174) );
  NOR4_X1 U223 ( .A1(CNT_CLK[30]), .A2(CNT_CLK[31]), .A3(n175), .A4(n174), 
        .ZN(n184) );
  NOR4_X1 U224 ( .A1(CNT_CLK[11]), .A2(CNT_CLK[10]), .A3(CNT_CLK[9]), .A4(
        CNT_CLK[8]), .ZN(n176) );
  NAND3_X1 U225 ( .A1(CNT_CLK[7]), .A2(n176), .A3(n283), .ZN(n182) );
  NOR4_X1 U226 ( .A1(CNT_CLK[25]), .A2(CNT_CLK[24]), .A3(CNT_CLK[23]), .A4(
        CNT_CLK[22]), .ZN(n180) );
  NOR4_X1 U227 ( .A1(CNT_CLK[29]), .A2(CNT_CLK[28]), .A3(CNT_CLK[27]), .A4(
        CNT_CLK[26]), .ZN(n179) );
  NOR4_X1 U228 ( .A1(CNT_CLK[17]), .A2(CNT_CLK[16]), .A3(CNT_CLK[15]), .A4(
        CNT_CLK[14]), .ZN(n178) );
  NOR4_X1 U229 ( .A1(CNT_CLK[21]), .A2(CNT_CLK[20]), .A3(CNT_CLK[19]), .A4(
        CNT_CLK[18]), .ZN(n177) );
  NAND4_X1 U230 ( .A1(n180), .A2(n179), .A3(n178), .A4(n177), .ZN(n181) );
  NOR4_X1 U231 ( .A1(CNT_CLK[13]), .A2(CNT_CLK[12]), .A3(n182), .A4(n181), 
        .ZN(n183) );
  NAND4_X1 U232 ( .A1(CNT_CLK[5]), .A2(CNT_CLK[4]), .A3(n184), .A4(n183), .ZN(
        n186) );
  OAI21_X1 U233 ( .B1(current_state[2]), .B2(START), .A(n285), .ZN(n185) );
  NAND3_X1 U234 ( .A1(n187), .A2(n186), .A3(n185), .ZN(n142) );
  AOI22_X1 U235 ( .A1(CNT_CLK[0]), .A2(n206), .B1(n188), .B2(n286), .ZN(n141)
         );
  INV_X1 U236 ( .A(n206), .ZN(n242) );
  XOR2_X1 U237 ( .A(CNT_CLK[0]), .B(CNT_CLK[1]), .Z(n189) );
  AOI22_X1 U238 ( .A1(CNT_CLK[1]), .A2(n242), .B1(n280), .B2(n189), .ZN(n190)
         );
  INV_X1 U239 ( .A(n190), .ZN(n140) );
  XNOR2_X1 U240 ( .A(n191), .B(n17), .ZN(n192) );
  AOI22_X1 U241 ( .A1(CNT_CLK[2]), .A2(n242), .B1(n252), .B2(n192), .ZN(n193)
         );
  INV_X1 U242 ( .A(n193), .ZN(n139) );
  XNOR2_X1 U243 ( .A(n194), .B(n1), .ZN(n195) );
  AOI22_X1 U244 ( .A1(CNT_CLK[3]), .A2(n242), .B1(n252), .B2(n195), .ZN(n196)
         );
  INV_X1 U245 ( .A(n196), .ZN(n138) );
  HA_X1 U246 ( .A(n197), .B(CNT_CLK[4]), .CO(n200), .S(n198) );
  AOI22_X1 U247 ( .A1(CNT_CLK[4]), .A2(n242), .B1(n252), .B2(n198), .ZN(n199)
         );
  INV_X1 U248 ( .A(n199), .ZN(n137) );
  HA_X1 U249 ( .A(n200), .B(CNT_CLK[5]), .CO(n203), .S(n201) );
  AOI22_X1 U250 ( .A1(CNT_CLK[5]), .A2(n242), .B1(n252), .B2(n201), .ZN(n202)
         );
  INV_X1 U251 ( .A(n202), .ZN(n136) );
  XNOR2_X1 U252 ( .A(n203), .B(n283), .ZN(n204) );
  NAND2_X1 U253 ( .A1(n204), .A2(n280), .ZN(n205) );
  OAI21_X1 U254 ( .B1(n206), .B2(n283), .A(n205), .ZN(n135) );
  XNOR2_X1 U255 ( .A(n207), .B(CNT_CLK[7]), .ZN(n208) );
  AOI22_X1 U256 ( .A1(CNT_CLK[7]), .A2(n242), .B1(n252), .B2(n208), .ZN(n209)
         );
  INV_X1 U257 ( .A(n209), .ZN(n134) );
  XNOR2_X1 U258 ( .A(n210), .B(n5), .ZN(n211) );
  AOI22_X1 U259 ( .A1(CNT_CLK[8]), .A2(n242), .B1(n252), .B2(n211), .ZN(n212)
         );
  INV_X1 U260 ( .A(n212), .ZN(n133) );
  XNOR2_X1 U261 ( .A(n213), .B(n6), .ZN(n214) );
  AOI22_X1 U262 ( .A1(CNT_CLK[9]), .A2(n242), .B1(n252), .B2(n214), .ZN(n215)
         );
  INV_X1 U263 ( .A(n215), .ZN(n132) );
  XNOR2_X1 U264 ( .A(n216), .B(n16), .ZN(n217) );
  AOI22_X1 U265 ( .A1(CNT_CLK[10]), .A2(n242), .B1(n280), .B2(n217), .ZN(n218)
         );
  INV_X1 U266 ( .A(n218), .ZN(n131) );
  HA_X1 U267 ( .A(n219), .B(CNT_CLK[11]), .CO(n222), .S(n220) );
  AOI22_X1 U268 ( .A1(CNT_CLK[11]), .A2(n242), .B1(n280), .B2(n220), .ZN(n221)
         );
  INV_X1 U269 ( .A(n221), .ZN(n130) );
  AOI22_X1 U270 ( .A1(CNT_CLK[12]), .A2(n242), .B1(n280), .B2(n223), .ZN(n224)
         );
  INV_X1 U271 ( .A(n224), .ZN(n129) );
  XNOR2_X1 U272 ( .A(n225), .B(CNT_CLK[13]), .ZN(n226) );
  AOI22_X1 U273 ( .A1(CNT_CLK[13]), .A2(n242), .B1(n280), .B2(n226), .ZN(n227)
         );
  INV_X1 U274 ( .A(n227), .ZN(n128) );
  XNOR2_X1 U275 ( .A(n228), .B(n13), .ZN(n229) );
  AOI22_X1 U276 ( .A1(CNT_CLK[14]), .A2(n242), .B1(n280), .B2(n229), .ZN(n230)
         );
  INV_X1 U277 ( .A(n230), .ZN(n127) );
  AOI22_X1 U278 ( .A1(CNT_CLK[15]), .A2(n281), .B1(n280), .B2(n232), .ZN(n233)
         );
  INV_X1 U279 ( .A(n233), .ZN(n126) );
  AOI22_X1 U280 ( .A1(CNT_CLK[16]), .A2(n242), .B1(n280), .B2(n235), .ZN(n236)
         );
  INV_X1 U281 ( .A(n236), .ZN(n125) );
  HA_X1 U282 ( .A(n237), .B(CNT_CLK[17]), .CO(n240), .S(n238) );
  AOI22_X1 U283 ( .A1(CNT_CLK[17]), .A2(n281), .B1(n280), .B2(n238), .ZN(n239)
         );
  INV_X1 U284 ( .A(n239), .ZN(n124) );
  AOI22_X1 U285 ( .A1(CNT_CLK[18]), .A2(n242), .B1(n280), .B2(n241), .ZN(n243)
         );
  INV_X1 U286 ( .A(n243), .ZN(n123) );
  AOI22_X1 U287 ( .A1(CNT_CLK[19]), .A2(n281), .B1(n280), .B2(n245), .ZN(n246)
         );
  INV_X1 U288 ( .A(n246), .ZN(n122) );
  AOI22_X1 U289 ( .A1(CNT_CLK[20]), .A2(n281), .B1(n280), .B2(n248), .ZN(n249)
         );
  INV_X1 U290 ( .A(n249), .ZN(n121) );
  HA_X1 U291 ( .A(n250), .B(CNT_CLK[21]), .CO(n254), .S(n251) );
  AOI22_X1 U292 ( .A1(CNT_CLK[21]), .A2(n281), .B1(n252), .B2(n251), .ZN(n253)
         );
  INV_X1 U293 ( .A(n253), .ZN(n120) );
  AOI22_X1 U294 ( .A1(CNT_CLK[22]), .A2(n281), .B1(n280), .B2(n255), .ZN(n256)
         );
  INV_X1 U295 ( .A(n256), .ZN(n119) );
  AOI22_X1 U296 ( .A1(CNT_CLK[23]), .A2(n281), .B1(n280), .B2(n258), .ZN(n259)
         );
  INV_X1 U297 ( .A(n259), .ZN(n118) );
  HA_X1 U298 ( .A(n260), .B(CNT_CLK[24]), .CO(n263), .S(n261) );
  AOI22_X1 U299 ( .A1(CNT_CLK[24]), .A2(n281), .B1(n280), .B2(n261), .ZN(n262)
         );
  INV_X1 U300 ( .A(n262), .ZN(n117) );
  HA_X1 U301 ( .A(n263), .B(CNT_CLK[25]), .CO(n266), .S(n264) );
  AOI22_X1 U302 ( .A1(CNT_CLK[25]), .A2(n281), .B1(n280), .B2(n264), .ZN(n265)
         );
  INV_X1 U303 ( .A(n265), .ZN(n116) );
  AOI22_X1 U304 ( .A1(CNT_CLK[26]), .A2(n281), .B1(n280), .B2(n267), .ZN(n268)
         );
  INV_X1 U305 ( .A(n268), .ZN(n115) );
  AOI22_X1 U306 ( .A1(CNT_CLK[27]), .A2(n281), .B1(n280), .B2(n270), .ZN(n271)
         );
  INV_X1 U307 ( .A(n271), .ZN(n114) );
  HA_X1 U308 ( .A(n272), .B(CNT_CLK[28]), .CO(n275), .S(n273) );
  AOI22_X1 U309 ( .A1(CNT_CLK[28]), .A2(n281), .B1(n280), .B2(n273), .ZN(n274)
         );
  INV_X1 U310 ( .A(n274), .ZN(n113) );
  HA_X1 U311 ( .A(n275), .B(CNT_CLK[29]), .CO(n278), .S(n276) );
  AOI22_X1 U312 ( .A1(CNT_CLK[29]), .A2(n281), .B1(n280), .B2(n276), .ZN(n277)
         );
  INV_X1 U313 ( .A(n277), .ZN(n112) );
  XNOR2_X1 U314 ( .A(n278), .B(n3), .ZN(n279) );
  AOI22_X1 U315 ( .A1(CNT_CLK[30]), .A2(n281), .B1(n280), .B2(n279), .ZN(n282)
         );
  INV_X1 U316 ( .A(n282), .ZN(n111) );
endmodule


module MISR_NBIT32 ( CLK, RST, D, Golden_D, PASS_Fail );
  input [31:0] D;
  inout [31:0] Golden_D;
  input CLK, RST;
  output PASS_Fail;
  wire   n1, n3, n4, n6, n8, n10, n11, n13, n15, n16, n18, n20, n21, n23, n24,
         n25, n27, n29, n30, n32, n34, n35, n37, n39, n40, n42, n44, n45, n47,
         n49, n50, n52, n54, n55, n57, n59, n60, n62, n64, n65, n67, n69, n70,
         n72, n74, n75, n77, n79, n80, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n2,
         n5, n7, n9, n12, n14, n17, n19, n22, n26, n28, n31, n33, n36, n38,
         n41, n43, n46, n48, n51, n53, n56, n58, n61, n63, n66, n68, n71, n73,
         n76, n78, n81;
  tri   [31:0] Golden_D;

  DFF_X1 Golden_D_reg_16_ ( .D(n113), .CK(CLK), .Q(Golden_D[16]) );
  DFF_X1 Golden_D_reg_0_ ( .D(n112), .CK(CLK), .Q(Golden_D[0]) );
  DFF_X1 Golden_D_reg_31_ ( .D(n111), .CK(CLK), .Q(Golden_D[31]) );
  DFF_X1 Golden_D_reg_1_ ( .D(n110), .CK(CLK), .Q(Golden_D[1]) );
  DFF_X1 Golden_D_reg_30_ ( .D(n109), .CK(CLK), .Q(Golden_D[30]) );
  DFF_X1 Golden_D_reg_2_ ( .D(n108), .CK(CLK), .Q(Golden_D[2]) );
  DFF_X1 Golden_D_reg_29_ ( .D(n107), .CK(CLK), .Q(Golden_D[29]) );
  DFF_X1 Golden_D_reg_3_ ( .D(n106), .CK(CLK), .Q(Golden_D[3]) );
  DFF_X1 Golden_D_reg_28_ ( .D(n105), .CK(CLK), .Q(Golden_D[28]) );
  DFF_X1 Golden_D_reg_4_ ( .D(n104), .CK(CLK), .Q(Golden_D[4]) );
  DFF_X1 Golden_D_reg_27_ ( .D(n103), .CK(CLK), .Q(Golden_D[27]) );
  DFF_X1 Golden_D_reg_5_ ( .D(n102), .CK(CLK), .Q(Golden_D[5]) );
  DFF_X1 Golden_D_reg_26_ ( .D(n101), .CK(CLK), .Q(Golden_D[26]) );
  DFF_X1 Golden_D_reg_6_ ( .D(n100), .CK(CLK), .Q(Golden_D[6]) );
  DFF_X1 Golden_D_reg_25_ ( .D(n99), .CK(CLK), .Q(Golden_D[25]) );
  DFF_X1 Golden_D_reg_7_ ( .D(n98), .CK(CLK), .Q(Golden_D[7]) );
  DFF_X1 Golden_D_reg_24_ ( .D(n97), .CK(CLK), .Q(Golden_D[24]) );
  DFF_X1 Golden_D_reg_8_ ( .D(n96), .CK(CLK), .Q(Golden_D[8]) );
  DFF_X1 Golden_D_reg_23_ ( .D(n95), .CK(CLK), .Q(Golden_D[23]) );
  DFF_X1 Golden_D_reg_9_ ( .D(n94), .CK(CLK), .Q(Golden_D[9]) );
  DFF_X1 Golden_D_reg_22_ ( .D(n93), .CK(CLK), .Q(Golden_D[22]) );
  DFF_X1 Golden_D_reg_10_ ( .D(n92), .CK(CLK), .Q(Golden_D[10]) );
  DFF_X1 Golden_D_reg_20_ ( .D(n91), .CK(CLK), .Q(Golden_D[20]) );
  DFF_X1 Golden_D_reg_11_ ( .D(n90), .CK(CLK), .Q(Golden_D[11]) );
  DFF_X1 Golden_D_reg_12_ ( .D(n89), .CK(CLK), .Q(Golden_D[12]) );
  DFF_X1 Golden_D_reg_19_ ( .D(n88), .CK(CLK), .Q(Golden_D[19]) );
  DFF_X1 Golden_D_reg_13_ ( .D(n87), .CK(CLK), .Q(Golden_D[13]) );
  DFF_X1 Golden_D_reg_18_ ( .D(n86), .CK(CLK), .Q(Golden_D[18]) );
  DFF_X1 Golden_D_reg_14_ ( .D(n85), .CK(CLK), .Q(Golden_D[14]) );
  DFF_X1 Golden_D_reg_17_ ( .D(n84), .CK(CLK), .Q(Golden_D[17]) );
  DFF_X1 Golden_D_reg_15_ ( .D(n83), .CK(CLK), .Q(Golden_D[15]) );
  DFF_X1 Golden_D_reg_21_ ( .D(n82), .CK(CLK), .Q(Golden_D[21]) );
  INV_X1 U3 ( .A(Golden_D[21]), .ZN(n3) );
  XOR2_X1 U4 ( .A(Golden_D[20]), .B(Golden_D[11]), .Z(n1) );
  XOR2_X1 U8 ( .A(Golden_D[16]), .B(Golden_D[14]), .Z(n6) );
  NAND2_X1 U10 ( .A1(RST), .A2(Golden_D[15]), .ZN(n4) );
  INV_X1 U12 ( .A(Golden_D[17]), .ZN(n8) );
  INV_X1 U15 ( .A(Golden_D[14]), .ZN(n10) );
  XNOR2_X1 U16 ( .A(Golden_D[13]), .B(n8), .ZN(n11) );
  INV_X1 U19 ( .A(Golden_D[18]), .ZN(n13) );
  INV_X1 U22 ( .A(Golden_D[13]), .ZN(n15) );
  XNOR2_X1 U23 ( .A(Golden_D[12]), .B(n13), .ZN(n16) );
  INV_X1 U26 ( .A(Golden_D[19]), .ZN(n24) );
  INV_X1 U29 ( .A(Golden_D[12]), .ZN(n20) );
  INV_X1 U30 ( .A(Golden_D[11]), .ZN(n23) );
  AOI22_X1 U31 ( .A1(Golden_D[19]), .A2(Golden_D[11]), .B1(n23), .B2(n24), 
        .ZN(n18) );
  INV_X1 U34 ( .A(Golden_D[20]), .ZN(n27) );
  INV_X1 U35 ( .A(Golden_D[10]), .ZN(n29) );
  AOI22_X1 U36 ( .A1(Golden_D[10]), .A2(Golden_D[20]), .B1(n27), .B2(n29), 
        .ZN(n21) );
  AOI22_X1 U39 ( .A1(Golden_D[19]), .A2(Golden_D[10]), .B1(n29), .B2(n24), 
        .ZN(n25) );
  XOR2_X1 U42 ( .A(Golden_D[9]), .B(Golden_D[21]), .Z(n30) );
  INV_X1 U45 ( .A(Golden_D[22]), .ZN(n32) );
  INV_X1 U48 ( .A(Golden_D[9]), .ZN(n34) );
  XNOR2_X1 U49 ( .A(Golden_D[8]), .B(n32), .ZN(n35) );
  INV_X1 U52 ( .A(Golden_D[23]), .ZN(n37) );
  INV_X1 U55 ( .A(Golden_D[8]), .ZN(n39) );
  XNOR2_X1 U56 ( .A(Golden_D[7]), .B(n37), .ZN(n40) );
  INV_X1 U59 ( .A(Golden_D[24]), .ZN(n42) );
  INV_X1 U62 ( .A(Golden_D[7]), .ZN(n44) );
  XNOR2_X1 U63 ( .A(Golden_D[6]), .B(n42), .ZN(n45) );
  INV_X1 U66 ( .A(Golden_D[25]), .ZN(n47) );
  INV_X1 U69 ( .A(Golden_D[6]), .ZN(n49) );
  XNOR2_X1 U70 ( .A(Golden_D[5]), .B(n47), .ZN(n50) );
  INV_X1 U73 ( .A(Golden_D[26]), .ZN(n52) );
  INV_X1 U76 ( .A(Golden_D[5]), .ZN(n54) );
  XNOR2_X1 U77 ( .A(Golden_D[4]), .B(n52), .ZN(n55) );
  INV_X1 U80 ( .A(Golden_D[27]), .ZN(n57) );
  INV_X1 U83 ( .A(Golden_D[4]), .ZN(n59) );
  XNOR2_X1 U84 ( .A(Golden_D[3]), .B(n57), .ZN(n60) );
  INV_X1 U87 ( .A(Golden_D[28]), .ZN(n62) );
  INV_X1 U90 ( .A(Golden_D[3]), .ZN(n64) );
  XNOR2_X1 U91 ( .A(Golden_D[2]), .B(n62), .ZN(n65) );
  INV_X1 U94 ( .A(Golden_D[29]), .ZN(n67) );
  INV_X1 U97 ( .A(Golden_D[2]), .ZN(n69) );
  XNOR2_X1 U98 ( .A(Golden_D[1]), .B(n67), .ZN(n70) );
  INV_X1 U101 ( .A(Golden_D[30]), .ZN(n72) );
  INV_X1 U104 ( .A(Golden_D[1]), .ZN(n74) );
  XNOR2_X1 U105 ( .A(Golden_D[0]), .B(n72), .ZN(n75) );
  INV_X1 U108 ( .A(Golden_D[31]), .ZN(n77) );
  INV_X1 U111 ( .A(Golden_D[0]), .ZN(n80) );
  XNOR2_X1 U112 ( .A(Golden_D[31]), .B(D[0]), .ZN(n79) );
  MUX2_X1 U114 ( .A(D[16]), .B(Golden_D[16]), .S(RST), .Z(n113) );
  INV_X1 U5 ( .A(RST), .ZN(n58) );
  AOI22_X1 U6 ( .A1(RST), .A2(n80), .B1(n79), .B2(n58), .ZN(n112) );
  XNOR2_X1 U7 ( .A(n75), .B(D[31]), .ZN(n2) );
  CLKBUF_X1 U9 ( .A(n58), .Z(n78) );
  AOI22_X1 U11 ( .A1(RST), .A2(n77), .B1(n2), .B2(n78), .ZN(n111) );
  XNOR2_X1 U13 ( .A(n75), .B(D[1]), .ZN(n5) );
  AOI22_X1 U14 ( .A1(RST), .A2(n74), .B1(n5), .B2(n58), .ZN(n110) );
  XNOR2_X1 U17 ( .A(n70), .B(D[30]), .ZN(n7) );
  AOI22_X1 U18 ( .A1(RST), .A2(n72), .B1(n7), .B2(n78), .ZN(n109) );
  XNOR2_X1 U20 ( .A(n70), .B(D[2]), .ZN(n9) );
  AOI22_X1 U21 ( .A1(RST), .A2(n69), .B1(n9), .B2(n58), .ZN(n108) );
  XNOR2_X1 U24 ( .A(n65), .B(D[29]), .ZN(n12) );
  AOI22_X1 U25 ( .A1(RST), .A2(n67), .B1(n12), .B2(n78), .ZN(n107) );
  XNOR2_X1 U27 ( .A(n65), .B(D[3]), .ZN(n14) );
  AOI22_X1 U28 ( .A1(RST), .A2(n64), .B1(n14), .B2(n58), .ZN(n106) );
  XNOR2_X1 U32 ( .A(n60), .B(D[28]), .ZN(n17) );
  AOI22_X1 U33 ( .A1(RST), .A2(n62), .B1(n17), .B2(n78), .ZN(n105) );
  XNOR2_X1 U37 ( .A(n60), .B(D[4]), .ZN(n19) );
  AOI22_X1 U38 ( .A1(RST), .A2(n59), .B1(n19), .B2(n58), .ZN(n104) );
  XNOR2_X1 U40 ( .A(n55), .B(D[27]), .ZN(n22) );
  AOI22_X1 U41 ( .A1(RST), .A2(n57), .B1(n22), .B2(n78), .ZN(n103) );
  XNOR2_X1 U43 ( .A(n55), .B(D[5]), .ZN(n26) );
  AOI22_X1 U44 ( .A1(RST), .A2(n54), .B1(n26), .B2(n58), .ZN(n102) );
  XNOR2_X1 U46 ( .A(n50), .B(D[26]), .ZN(n28) );
  AOI22_X1 U47 ( .A1(RST), .A2(n52), .B1(n28), .B2(n58), .ZN(n101) );
  XNOR2_X1 U50 ( .A(n50), .B(D[6]), .ZN(n31) );
  AOI22_X1 U51 ( .A1(RST), .A2(n49), .B1(n31), .B2(n78), .ZN(n100) );
  XNOR2_X1 U53 ( .A(n45), .B(D[25]), .ZN(n33) );
  AOI22_X1 U54 ( .A1(RST), .A2(n47), .B1(n33), .B2(n58), .ZN(n99) );
  XNOR2_X1 U57 ( .A(n45), .B(D[7]), .ZN(n36) );
  AOI22_X1 U58 ( .A1(RST), .A2(n44), .B1(n36), .B2(n78), .ZN(n98) );
  XNOR2_X1 U60 ( .A(n40), .B(D[24]), .ZN(n38) );
  AOI22_X1 U61 ( .A1(RST), .A2(n42), .B1(n38), .B2(n58), .ZN(n97) );
  XNOR2_X1 U64 ( .A(n40), .B(D[8]), .ZN(n41) );
  AOI22_X1 U65 ( .A1(RST), .A2(n39), .B1(n41), .B2(n78), .ZN(n96) );
  XNOR2_X1 U67 ( .A(n35), .B(D[23]), .ZN(n43) );
  AOI22_X1 U68 ( .A1(RST), .A2(n37), .B1(n43), .B2(n58), .ZN(n95) );
  XNOR2_X1 U71 ( .A(n35), .B(D[9]), .ZN(n46) );
  AOI22_X1 U72 ( .A1(RST), .A2(n34), .B1(n46), .B2(n78), .ZN(n94) );
  XNOR2_X1 U74 ( .A(n30), .B(D[22]), .ZN(n48) );
  AOI22_X1 U75 ( .A1(RST), .A2(n32), .B1(n48), .B2(n58), .ZN(n93) );
  XNOR2_X1 U78 ( .A(n30), .B(D[10]), .ZN(n51) );
  AOI22_X1 U79 ( .A1(RST), .A2(n29), .B1(n51), .B2(n58), .ZN(n92) );
  XNOR2_X1 U81 ( .A(n25), .B(D[20]), .ZN(n53) );
  AOI22_X1 U82 ( .A1(RST), .A2(n27), .B1(n53), .B2(n58), .ZN(n91) );
  XNOR2_X1 U85 ( .A(n21), .B(D[11]), .ZN(n56) );
  AOI22_X1 U86 ( .A1(RST), .A2(n23), .B1(n56), .B2(n58), .ZN(n90) );
  XNOR2_X1 U88 ( .A(n18), .B(D[12]), .ZN(n61) );
  AOI22_X1 U89 ( .A1(RST), .A2(n20), .B1(n61), .B2(n58), .ZN(n89) );
  XNOR2_X1 U92 ( .A(n16), .B(D[19]), .ZN(n63) );
  AOI22_X1 U93 ( .A1(RST), .A2(n24), .B1(n63), .B2(n78), .ZN(n88) );
  XNOR2_X1 U95 ( .A(n16), .B(D[13]), .ZN(n66) );
  AOI22_X1 U96 ( .A1(RST), .A2(n15), .B1(n66), .B2(n78), .ZN(n87) );
  XNOR2_X1 U99 ( .A(n11), .B(D[18]), .ZN(n68) );
  AOI22_X1 U100 ( .A1(RST), .A2(n13), .B1(n68), .B2(n78), .ZN(n86) );
  XNOR2_X1 U102 ( .A(n11), .B(D[14]), .ZN(n71) );
  AOI22_X1 U103 ( .A1(RST), .A2(n10), .B1(n71), .B2(n78), .ZN(n85) );
  XNOR2_X1 U106 ( .A(n6), .B(D[17]), .ZN(n73) );
  AOI22_X1 U107 ( .A1(RST), .A2(n8), .B1(n73), .B2(n78), .ZN(n84) );
  XNOR2_X1 U109 ( .A(n6), .B(D[15]), .ZN(n76) );
  OAI21_X1 U110 ( .B1(RST), .B2(n76), .A(n4), .ZN(n83) );
  XNOR2_X1 U113 ( .A(n1), .B(D[21]), .ZN(n81) );
  AOI22_X1 U115 ( .A1(RST), .A2(n3), .B1(n81), .B2(n78), .ZN(n82) );
endmodule


module LBIST_complete ( CLK, RST, GO_NOGO, DUT_RESET, LFSR_OUT, DUT_OUT, 
        Golden_D, START, Test_en_i_s, TEST_NORMAL );
  output [32:0] LFSR_OUT;
  input [31:0] DUT_OUT;
  inout [31:0] Golden_D;
  input CLK, RST, START, TEST_NORMAL;
  output GO_NOGO, DUT_RESET, Test_en_i_s;
  wire   lfsr_reset, net1496, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2;
  wire   [31:0] seed;
  wire   [32:0] lfsr_out_1;
  tri   [31:0] Golden_D;
  assign LFSR_OUT[32] = 1'b0;
  assign LFSR_OUT[31] = 1'b0;
  assign GO_NOGO = 1'b1;

  lfsr_N32 stimuli ( .clk(CLK), .reset(lfsr_reset), .seed(seed), .q(lfsr_out_1) );
  phase_shifter_N32 PS ( .data_in(lfsr_out_1), .data_out({
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, LFSR_OUT[30:0]}) );
  LBIST_SEED_dimension32_SCAN_CHAIN_number190 BIST ( .CLK(CLK), .RESET(RST), 
        .START(START), .TEST_NORMAL(1'b0), .MISR_Pass_Fail(net1496), 
        .LFSR_reset(lfsr_reset), .DUT_reset(DUT_RESET), .seed(seed), 
        .TEST_en_i_s(Test_en_i_s) );
  MISR_NBIT32 MISR_map ( .CLK(CLK), .RST(RST), .D(DUT_OUT), .Golden_D(Golden_D) );
endmodule

