/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP2
// Date      : Sat Jan 15 11:48:32 2022
/////////////////////////////////////////////////////////////


module lfsr_N24 ( clk, reset, seed, q );
  input [24:0] seed;
  output [24:0] q;
  input clk, reset;
  wire   n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28;

  DFFRS_X1 r_reg_reg_0_ ( .D(q[1]), .CK(clk), .RN(n29), .SN(n30), .Q(q[0]) );
  DFFRS_X1 r_reg_reg_24_ ( .D(n79), .CK(clk), .RN(n77), .SN(n78), .Q(q[24]) );
  DFFRS_X1 r_reg_reg_23_ ( .D(q[24]), .CK(clk), .RN(n75), .SN(n76), .Q(q[23])
         );
  DFFRS_X1 r_reg_reg_22_ ( .D(q[23]), .CK(clk), .RN(n73), .SN(n74), .Q(q[22])
         );
  DFFRS_X1 r_reg_reg_21_ ( .D(q[22]), .CK(clk), .RN(n71), .SN(n72), .Q(q[21])
         );
  DFFRS_X1 r_reg_reg_20_ ( .D(q[21]), .CK(clk), .RN(n69), .SN(n70), .Q(q[20])
         );
  DFFRS_X1 r_reg_reg_19_ ( .D(q[20]), .CK(clk), .RN(n67), .SN(n68), .Q(q[19])
         );
  DFFRS_X1 r_reg_reg_18_ ( .D(q[19]), .CK(clk), .RN(n65), .SN(n66), .Q(q[18])
         );
  DFFRS_X1 r_reg_reg_17_ ( .D(q[18]), .CK(clk), .RN(n63), .SN(n64), .Q(q[17])
         );
  DFFRS_X1 r_reg_reg_16_ ( .D(q[17]), .CK(clk), .RN(n61), .SN(n62), .Q(q[16])
         );
  DFFRS_X1 r_reg_reg_15_ ( .D(q[16]), .CK(clk), .RN(n59), .SN(n60), .Q(q[15])
         );
  DFFRS_X1 r_reg_reg_14_ ( .D(q[15]), .CK(clk), .RN(n57), .SN(n58), .Q(q[14])
         );
  DFFRS_X1 r_reg_reg_13_ ( .D(q[14]), .CK(clk), .RN(n55), .SN(n56), .Q(q[13])
         );
  DFFRS_X1 r_reg_reg_12_ ( .D(q[13]), .CK(clk), .RN(n53), .SN(n54), .Q(q[12])
         );
  DFFRS_X1 r_reg_reg_11_ ( .D(q[12]), .CK(clk), .RN(n51), .SN(n52), .Q(q[11])
         );
  DFFRS_X1 r_reg_reg_10_ ( .D(q[11]), .CK(clk), .RN(n49), .SN(n50), .Q(q[10])
         );
  DFFRS_X1 r_reg_reg_9_ ( .D(q[10]), .CK(clk), .RN(n47), .SN(n48), .Q(q[9]) );
  DFFRS_X1 r_reg_reg_8_ ( .D(q[9]), .CK(clk), .RN(n45), .SN(n46), .Q(q[8]) );
  DFFRS_X1 r_reg_reg_7_ ( .D(q[8]), .CK(clk), .RN(n43), .SN(n44), .Q(q[7]) );
  DFFRS_X1 r_reg_reg_6_ ( .D(q[7]), .CK(clk), .RN(n41), .SN(n42), .Q(q[6]) );
  DFFRS_X1 r_reg_reg_5_ ( .D(q[6]), .CK(clk), .RN(n39), .SN(n40), .Q(q[5]) );
  DFFRS_X1 r_reg_reg_4_ ( .D(q[5]), .CK(clk), .RN(n37), .SN(n38), .Q(q[4]) );
  DFFRS_X1 r_reg_reg_3_ ( .D(q[4]), .CK(clk), .RN(n35), .SN(n36), .Q(q[3]) );
  DFFRS_X1 r_reg_reg_2_ ( .D(q[3]), .CK(clk), .RN(n33), .SN(n34), .Q(q[2]) );
  DFFRS_X1 r_reg_reg_1_ ( .D(q[2]), .CK(clk), .RN(n31), .SN(n32), .Q(q[1]) );
  NAND2_X1 U3 ( .A1(reset), .A2(seed[24]), .ZN(n78) );
  INV_X1 U4 ( .A(seed[24]), .ZN(n1) );
  NAND2_X1 U5 ( .A1(reset), .A2(n1), .ZN(n77) );
  NAND2_X1 U6 ( .A1(reset), .A2(seed[23]), .ZN(n76) );
  INV_X1 U7 ( .A(seed[23]), .ZN(n2) );
  NAND2_X1 U8 ( .A1(reset), .A2(n2), .ZN(n75) );
  NAND2_X1 U9 ( .A1(reset), .A2(seed[22]), .ZN(n74) );
  INV_X1 U10 ( .A(seed[22]), .ZN(n3) );
  NAND2_X1 U11 ( .A1(reset), .A2(n3), .ZN(n73) );
  NAND2_X1 U12 ( .A1(reset), .A2(seed[21]), .ZN(n72) );
  INV_X1 U13 ( .A(seed[21]), .ZN(n4) );
  NAND2_X1 U14 ( .A1(reset), .A2(n4), .ZN(n71) );
  NAND2_X1 U15 ( .A1(reset), .A2(seed[20]), .ZN(n70) );
  INV_X1 U16 ( .A(seed[20]), .ZN(n5) );
  NAND2_X1 U17 ( .A1(reset), .A2(n5), .ZN(n69) );
  NAND2_X1 U18 ( .A1(reset), .A2(seed[19]), .ZN(n68) );
  INV_X1 U19 ( .A(seed[19]), .ZN(n6) );
  NAND2_X1 U20 ( .A1(reset), .A2(n6), .ZN(n67) );
  NAND2_X1 U21 ( .A1(reset), .A2(seed[18]), .ZN(n66) );
  INV_X1 U22 ( .A(seed[18]), .ZN(n7) );
  NAND2_X1 U23 ( .A1(reset), .A2(n7), .ZN(n65) );
  NAND2_X1 U24 ( .A1(reset), .A2(seed[17]), .ZN(n64) );
  INV_X1 U25 ( .A(seed[17]), .ZN(n8) );
  NAND2_X1 U26 ( .A1(reset), .A2(n8), .ZN(n63) );
  NAND2_X1 U27 ( .A1(reset), .A2(seed[16]), .ZN(n62) );
  INV_X1 U28 ( .A(seed[16]), .ZN(n9) );
  NAND2_X1 U29 ( .A1(reset), .A2(n9), .ZN(n61) );
  NAND2_X1 U30 ( .A1(reset), .A2(seed[15]), .ZN(n60) );
  INV_X1 U31 ( .A(seed[15]), .ZN(n10) );
  NAND2_X1 U32 ( .A1(reset), .A2(n10), .ZN(n59) );
  NAND2_X1 U33 ( .A1(reset), .A2(seed[14]), .ZN(n58) );
  INV_X1 U34 ( .A(seed[14]), .ZN(n11) );
  NAND2_X1 U35 ( .A1(reset), .A2(n11), .ZN(n57) );
  NAND2_X1 U36 ( .A1(reset), .A2(seed[13]), .ZN(n56) );
  INV_X1 U37 ( .A(seed[13]), .ZN(n12) );
  NAND2_X1 U38 ( .A1(reset), .A2(n12), .ZN(n55) );
  NAND2_X1 U39 ( .A1(reset), .A2(seed[12]), .ZN(n54) );
  INV_X1 U40 ( .A(seed[12]), .ZN(n13) );
  NAND2_X1 U41 ( .A1(reset), .A2(n13), .ZN(n53) );
  NAND2_X1 U42 ( .A1(reset), .A2(seed[11]), .ZN(n52) );
  INV_X1 U43 ( .A(seed[11]), .ZN(n14) );
  NAND2_X1 U44 ( .A1(reset), .A2(n14), .ZN(n51) );
  NAND2_X1 U45 ( .A1(reset), .A2(seed[10]), .ZN(n50) );
  INV_X1 U46 ( .A(seed[10]), .ZN(n15) );
  NAND2_X1 U47 ( .A1(reset), .A2(n15), .ZN(n49) );
  NAND2_X1 U48 ( .A1(reset), .A2(seed[9]), .ZN(n48) );
  INV_X1 U49 ( .A(seed[9]), .ZN(n16) );
  NAND2_X1 U50 ( .A1(reset), .A2(n16), .ZN(n47) );
  NAND2_X1 U51 ( .A1(reset), .A2(seed[8]), .ZN(n46) );
  INV_X1 U52 ( .A(seed[8]), .ZN(n17) );
  NAND2_X1 U53 ( .A1(reset), .A2(n17), .ZN(n45) );
  NAND2_X1 U54 ( .A1(reset), .A2(seed[7]), .ZN(n44) );
  INV_X1 U55 ( .A(seed[7]), .ZN(n18) );
  NAND2_X1 U56 ( .A1(reset), .A2(n18), .ZN(n43) );
  NAND2_X1 U57 ( .A1(reset), .A2(seed[6]), .ZN(n42) );
  INV_X1 U58 ( .A(seed[6]), .ZN(n19) );
  NAND2_X1 U59 ( .A1(reset), .A2(n19), .ZN(n41) );
  NAND2_X1 U60 ( .A1(reset), .A2(seed[5]), .ZN(n40) );
  INV_X1 U61 ( .A(seed[5]), .ZN(n20) );
  NAND2_X1 U62 ( .A1(reset), .A2(n20), .ZN(n39) );
  NAND2_X1 U63 ( .A1(reset), .A2(seed[4]), .ZN(n38) );
  INV_X1 U64 ( .A(seed[4]), .ZN(n21) );
  NAND2_X1 U65 ( .A1(reset), .A2(n21), .ZN(n37) );
  NAND2_X1 U66 ( .A1(reset), .A2(seed[3]), .ZN(n36) );
  INV_X1 U67 ( .A(seed[3]), .ZN(n22) );
  NAND2_X1 U68 ( .A1(reset), .A2(n22), .ZN(n35) );
  NAND2_X1 U69 ( .A1(reset), .A2(seed[2]), .ZN(n34) );
  INV_X1 U70 ( .A(seed[2]), .ZN(n23) );
  NAND2_X1 U71 ( .A1(reset), .A2(n23), .ZN(n33) );
  NAND2_X1 U72 ( .A1(reset), .A2(seed[1]), .ZN(n32) );
  INV_X1 U73 ( .A(seed[1]), .ZN(n24) );
  NAND2_X1 U74 ( .A1(reset), .A2(n24), .ZN(n31) );
  NAND2_X1 U75 ( .A1(reset), .A2(seed[0]), .ZN(n30) );
  INV_X1 U76 ( .A(seed[0]), .ZN(n25) );
  NAND2_X1 U77 ( .A1(reset), .A2(n25), .ZN(n29) );
  XOR2_X1 U78 ( .A(q[2]), .B(q[7]), .Z(n27) );
  XNOR2_X1 U79 ( .A(q[0]), .B(q[24]), .ZN(n26) );
  XNOR2_X1 U80 ( .A(n27), .B(n26), .ZN(n28) );
  XOR2_X1 U81 ( .A(q[1]), .B(n28), .Z(n79) );
endmodule


module MISR ( CLK, RST, EN, D, Golden_D_out );
  input [15:0] D;
  output [15:0] Golden_D_out;
  input CLK, RST, EN;
  wire   n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44;

  DFF_X1 Golden_D_reg_8_ ( .D(n52), .CK(CLK), .Q(Golden_D_out[8]), .QN(n34) );
  DFF_X1 Golden_D_reg_0_ ( .D(n60), .CK(CLK), .Q(Golden_D_out[0]), .QN(n42) );
  DFF_X1 Golden_D_reg_1_ ( .D(n59), .CK(CLK), .Q(Golden_D_out[1]), .QN(n29) );
  DFF_X1 Golden_D_reg_2_ ( .D(n58), .CK(CLK), .Q(Golden_D_out[2]), .QN(n30) );
  DFF_X1 Golden_D_reg_3_ ( .D(n57), .CK(CLK), .Q(Golden_D_out[3]), .QN(n33) );
  DFF_X1 Golden_D_reg_4_ ( .D(n56), .CK(CLK), .Q(Golden_D_out[4]), .QN(n32) );
  DFF_X1 Golden_D_reg_11_ ( .D(n49), .CK(CLK), .Q(Golden_D_out[11]), .QN(n38)
         );
  DFF_X1 Golden_D_reg_5_ ( .D(n55), .CK(CLK), .Q(Golden_D_out[5]), .QN(n39) );
  DFF_X1 Golden_D_reg_6_ ( .D(n54), .CK(CLK), .Q(Golden_D_out[6]), .QN(n31) );
  DFF_X1 Golden_D_reg_7_ ( .D(n53), .CK(CLK), .Q(Golden_D_out[7]), .QN(n44) );
  DFF_X1 Golden_D_reg_9_ ( .D(n51), .CK(CLK), .Q(Golden_D_out[9]), .QN(n41) );
  DFF_X1 Golden_D_reg_10_ ( .D(n50), .CK(CLK), .Q(Golden_D_out[10]), .QN(n37)
         );
  DFF_X1 Golden_D_reg_12_ ( .D(n48), .CK(CLK), .Q(Golden_D_out[12]), .QN(n35)
         );
  DFF_X1 Golden_D_reg_13_ ( .D(n47), .CK(CLK), .Q(Golden_D_out[13]), .QN(n36)
         );
  DFF_X1 Golden_D_reg_14_ ( .D(n46), .CK(CLK), .Q(Golden_D_out[14]), .QN(n43)
         );
  DFF_X1 Golden_D_reg_15_ ( .D(n45), .CK(CLK), .Q(Golden_D_out[15]), .QN(n40)
         );
  OR2_X1 U3 ( .A1(RST), .A2(EN), .ZN(n26) );
  INV_X1 U4 ( .A(RST), .ZN(n1) );
  NAND2_X1 U5 ( .A1(EN), .A2(n1), .ZN(n28) );
  XNOR2_X1 U6 ( .A(Golden_D_out[15]), .B(D[0]), .ZN(n2) );
  OAI22_X1 U7 ( .A1(n28), .A2(n2), .B1(n42), .B2(n26), .ZN(n60) );
  XOR2_X1 U8 ( .A(Golden_D_out[14]), .B(Golden_D_out[0]), .Z(n25) );
  XNOR2_X1 U9 ( .A(n25), .B(D[1]), .ZN(n3) );
  OAI22_X1 U10 ( .A1(n28), .A2(n3), .B1(n26), .B2(n29), .ZN(n59) );
  AOI22_X1 U11 ( .A1(Golden_D_out[1]), .A2(Golden_D_out[13]), .B1(n36), .B2(
        n29), .ZN(n23) );
  XNOR2_X1 U12 ( .A(n23), .B(D[2]), .ZN(n4) );
  OAI22_X1 U13 ( .A1(n28), .A2(n4), .B1(n26), .B2(n30), .ZN(n58) );
  AOI22_X1 U14 ( .A1(Golden_D_out[2]), .A2(Golden_D_out[12]), .B1(n35), .B2(
        n30), .ZN(n21) );
  XNOR2_X1 U15 ( .A(n21), .B(D[3]), .ZN(n5) );
  OAI22_X1 U16 ( .A1(n28), .A2(n5), .B1(n26), .B2(n33), .ZN(n57) );
  AOI22_X1 U17 ( .A1(Golden_D_out[3]), .A2(Golden_D_out[10]), .B1(n37), .B2(
        n33), .ZN(n6) );
  XNOR2_X1 U18 ( .A(D[4]), .B(n6), .ZN(n7) );
  OAI22_X1 U19 ( .A1(n28), .A2(n7), .B1(n26), .B2(n32), .ZN(n56) );
  AOI22_X1 U20 ( .A1(Golden_D_out[4]), .A2(Golden_D_out[11]), .B1(n38), .B2(
        n32), .ZN(n8) );
  XNOR2_X1 U21 ( .A(D[5]), .B(n8), .ZN(n9) );
  OAI22_X1 U22 ( .A1(n28), .A2(n9), .B1(n26), .B2(n39), .ZN(n55) );
  XOR2_X1 U23 ( .A(Golden_D_out[9]), .B(Golden_D_out[5]), .Z(n15) );
  XNOR2_X1 U24 ( .A(n15), .B(D[6]), .ZN(n10) );
  OAI22_X1 U25 ( .A1(n28), .A2(n10), .B1(n26), .B2(n31), .ZN(n54) );
  AOI22_X1 U26 ( .A1(Golden_D_out[6]), .A2(Golden_D_out[8]), .B1(n34), .B2(n31), .ZN(n13) );
  XNOR2_X1 U27 ( .A(n13), .B(D[7]), .ZN(n11) );
  OAI22_X1 U28 ( .A1(n28), .A2(n11), .B1(n26), .B2(n44), .ZN(n53) );
  INV_X1 U29 ( .A(D[8]), .ZN(n12) );
  OAI22_X1 U30 ( .A1(n28), .A2(n12), .B1(n26), .B2(n34), .ZN(n52) );
  XNOR2_X1 U31 ( .A(n13), .B(D[9]), .ZN(n14) );
  OAI22_X1 U32 ( .A1(n28), .A2(n14), .B1(n26), .B2(n41), .ZN(n51) );
  XNOR2_X1 U33 ( .A(n15), .B(D[10]), .ZN(n16) );
  OAI22_X1 U34 ( .A1(n28), .A2(n16), .B1(n26), .B2(n37), .ZN(n50) );
  AOI22_X1 U35 ( .A1(Golden_D_out[10]), .A2(Golden_D_out[4]), .B1(n32), .B2(
        n37), .ZN(n17) );
  XNOR2_X1 U36 ( .A(D[11]), .B(n17), .ZN(n18) );
  OAI22_X1 U37 ( .A1(n28), .A2(n18), .B1(n26), .B2(n38), .ZN(n49) );
  AOI22_X1 U38 ( .A1(Golden_D_out[3]), .A2(Golden_D_out[11]), .B1(n38), .B2(
        n33), .ZN(n19) );
  XNOR2_X1 U39 ( .A(D[12]), .B(n19), .ZN(n20) );
  OAI22_X1 U40 ( .A1(n28), .A2(n20), .B1(n26), .B2(n35), .ZN(n48) );
  XNOR2_X1 U41 ( .A(n21), .B(D[13]), .ZN(n22) );
  OAI22_X1 U42 ( .A1(n28), .A2(n22), .B1(n26), .B2(n36), .ZN(n47) );
  XNOR2_X1 U43 ( .A(n23), .B(D[14]), .ZN(n24) );
  OAI22_X1 U44 ( .A1(n28), .A2(n24), .B1(n43), .B2(n26), .ZN(n46) );
  XNOR2_X1 U45 ( .A(n25), .B(D[15]), .ZN(n27) );
  OAI22_X1 U46 ( .A1(n28), .A2(n27), .B1(n26), .B2(n40), .ZN(n45) );
endmodule


module LBIST_complete ( CLK, RST, GO_NOGO, LFSR_OUT, DUT_OUT, START, 
        TEST_en_i_s, TEST_mode, LBIST_en );
  output [15:0] LFSR_OUT;
  input [15:0] DUT_OUT;
  input CLK, RST, START;
  output GO_NOGO, TEST_en_i_s, TEST_mode, LBIST_en;
  wire   lfsr_reset, misr_en, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9;
  wire   [24:0] seed;
  wire   [24:0] lfsr_out_s;
  wire   [15:0] Golden_D;

  lfsr_N24 stimuli ( .clk(CLK), .reset(lfsr_reset), .seed(seed), .q(lfsr_out_s) );
  phase_shifter PS ( .data_in(lfsr_out_s), .data_out({SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, LFSR_OUT}) );
  LBIST BIST ( .CLK(CLK), .RST(RST), .START(START), .MISR_value(Golden_D), 
        .TEST_en_i_s(TEST_en_i_s), .TEST_mode(TEST_mode), .LBIST_en(LBIST_en), 
        .GO_NOGO(GO_NOGO), .LFSR_reset(lfsr_reset), .MISR_en(misr_en), .seed(
        seed) );
  MISR MR ( .CLK(CLK), .RST(RST), .EN(misr_en), .D(DUT_OUT), .Golden_D_out(
        Golden_D) );
endmodule

