
module counter ( clk, limit, set, value );
  input [3:0] limit;
  output [3:0] value;
  input clk, set;
  wire   n13, n15, n17, n18, n19, n21, n28, n32, n34, n37, n38, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [3:0] storedlimit;

  YSDFLIPFLOPASYNCRESET storedlimit_reg_3_ ( .D(n19), .CLK(clk), .CLR(n18), 
        .Q(storedlimit[3]), .QB(n62) );
  YSDFLIPFLOPASYNCRESET storedlimit_reg_2_ ( .D(n17), .CLK(clk), .CLR(n18), 
        .Q(storedlimit[2]), .QB(n60) );
  YSDFLIPFLOPASYNCRESET storedlimit_reg_1_ ( .D(n15), .CLK(clk), .CLR(n18), 
        .Q(storedlimit[1]) );
  YSDFLIPFLOPASYNCRESET storedlimit_reg_0_ ( .D(n13), .CLK(clk), .CLR(n18), 
        .Q(storedlimit[0]) );
  YSDFLIPFLOPASYNCRESET running_reg ( .D(n21), .CLK(clk), .CLR(n18), .QB(n28)
         );
  YSDFLIPFLOPASYNCRESET value_reg_0_ ( .D(n32), .CLK(clk), .CLR(n18), .Q(
        value[0]), .QB(n38) );
  YSDFLIPFLOPASYNCRESET value_reg_1_ ( .D(n58), .CLK(clk), .CLR(n18), .Q(
        value[1]), .QB(n37) );
  YSDFLIPFLOPASYNCRESET value_reg_2_ ( .D(n57), .CLK(clk), .CLR(n18), .Q(
        value[2]), .QB(n61) );
  YSDFLIPFLOPASYNCRESET value_reg_3_ ( .D(n59), .CLK(clk), .CLR(n18), .Q(
        value[3]), .QB(n34) );
  TIEHI U53 ( .Y(n18) );
  NAND2X1 U54 ( .A(n79), .B(n38), .Y(n63) );
  NAND2X1 U55 ( .A(n63), .B(n66), .Y(n64) );
  INV1 U56 ( .A(n64), .Y(n32) );
  NAND2X1 U57 ( .A(n38), .B(n81), .Y(n65) );
  NAND2X1 U58 ( .A(n65), .B(n21), .Y(n66) );
  INV1 U59 ( .A(n66), .Y(n80) );
  NAND2X1 U60 ( .A(n73), .B(n81), .Y(n75) );
  NAND2X1 U61 ( .A(value[0]), .B(n21), .Y(n67) );
  INV1 U62 ( .A(n67), .Y(n73) );
  INV1 U63 ( .A(set), .Y(n81) );
  AOI22X1 U64 ( .A(value[2]), .B(n60), .C(n62), .D(value[3]), .Y(n71) );
  AOI22X1 U65 ( .A(n37), .B(storedlimit[1]), .C(storedlimit[2]), .D(n61), .Y(
        n69) );
  AOI22X1 U66 ( .A(storedlimit[0]), .B(storedlimit[1]), .C(storedlimit[0]), 
        .D(n37), .Y(n68) );
  AOI22X1 U67 ( .A(n69), .B(value[0]), .C(n69), .D(n68), .Y(n70) );
  AOI22X1 U68 ( .A(n34), .B(storedlimit[3]), .C(n71), .D(n70), .Y(n72) );
  AOI22X1 U69 ( .A(n81), .B(n28), .C(n81), .D(n72), .Y(n21) );
  NOR2X1 U70 ( .A(n37), .B(n75), .Y(n77) );
  AOI22X1 U71 ( .A(value[2]), .B(n77), .C(n81), .D(value[3]), .Y(n74) );
  INV1 U72 ( .A(n74), .Y(n59) );
  INV1 U73 ( .A(n21), .Y(n79) );
  MUX2X1 U74 ( .B(n80), .A(n75), .S(n37), .Y(n76) );
  INV1 U75 ( .A(n76), .Y(n58) );
  AOI22X1 U76 ( .A(n80), .B(set), .C(n80), .D(value[1]), .Y(n78) );
  MUX2X1 U77 ( .B(n78), .A(n77), .S(n61), .Y(n57) );
  MUX2X1 U78 ( .B(limit[0]), .A(storedlimit[0]), .S(n81), .Y(n13) );
  MUX2X1 U79 ( .B(limit[1]), .A(storedlimit[1]), .S(n81), .Y(n15) );
  MUX2X1 U80 ( .B(limit[2]), .A(storedlimit[2]), .S(n81), .Y(n17) );
  MUX2X1 U81 ( .B(limit[3]), .A(storedlimit[3]), .S(n81), .Y(n19) );
endmodule

