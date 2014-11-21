
module controller ( clk, reset, op, zero, memread, memwrite, alusrca, memtoreg, 
        iord, pcen, regwrite, regdst, pcsource, alusrcb, aluop, irwrite );
  input [5:0] op;
  output [1:0] pcsource;
  output [1:0] alusrcb;
  output [1:0] aluop;
  output [3:0] irwrite;
  input clk, reset, zero;
  output memread, memwrite, alusrca, memtoreg, iord, pcen, regwrite, regdst;
  wire   n1, n3, n7, n20, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224;
  wire   [3:0] state;

  DFF2 state_reg_1_ ( .D(n20), .CLK(clk), .CLRB(n7), .QB(state[1]) );
  DFF2 state_reg_3_ ( .D(n3), .CLK(clk), .CLRB(n7), .QB(state[3]) );
  DFF2 state_reg_2_ ( .D(n1), .CLK(clk), .CLRB(n7), .QB(state[2]) );
  DFF2 state_reg_0_ ( .D(n102), .CLK(clk), .CLRB(n7), .Q(state[0]), .QB(n151)
         );
  TIEHI U120 ( .Y(n7) );
  NAND2X2 U121 ( .A(state[0]), .B(state[2]), .Y(n119) );
  NAND2X2 U122 ( .A(n193), .B(n117), .Y(n211) );
  INVX8 U123 ( .A(n119), .Y(n193) );
  NAND2X1 U124 ( .A(n216), .B(n168), .Y(iord) );
  INV1 U125 ( .A(memwrite), .Y(n168) );
  NAND2X1 U126 ( .A(n158), .B(n159), .Y(regwrite) );
  INV1 U127 ( .A(memtoreg), .Y(n159) );
  INV1 U128 ( .A(n192), .Y(n158) );
  INV1 U129 ( .A(n162), .Y(n192) );
  NAND2X1 U130 ( .A(n160), .B(n161), .Y(n162) );
  NAND2X1 U131 ( .A(n190), .B(n189), .Y(n160) );
  NAND2X1 U132 ( .A(n211), .B(n153), .Y(alusrcb[1]) );
  INV1 U133 ( .A(n214), .Y(n153) );
  BUFX4 U134 ( .A(pcsource[0]), .Y(aluop[0]) );
  NAND2X1 U135 ( .A(n183), .B(n169), .Y(alusrca) );
  INV1 U136 ( .A(n214), .Y(n169) );
  INV1 U137 ( .A(n165), .Y(n188) );
  NAND2X1 U138 ( .A(n163), .B(n164), .Y(n165) );
  INV1 U139 ( .A(n193), .Y(n179) );
  NAND2X1 U140 ( .A(zero), .B(pcsource[0]), .Y(n163) );
  NAND2X1 U141 ( .A(state[3]), .B(n171), .Y(n187) );
  INV1 U142 ( .A(state[1]), .Y(n171) );
  NAND2X1 U143 ( .A(n166), .B(n167), .Y(n186) );
  NAND2X1 U144 ( .A(n222), .B(n200), .Y(n201) );
  INV1 U145 ( .A(reset), .Y(n202) );
  NAND2X1 U146 ( .A(n106), .B(n103), .Y(n102) );
  NAND2X1 U147 ( .A(n105), .B(n104), .Y(n103) );
  INV1 U148 ( .A(n107), .Y(n106) );
  NAND2X1 U149 ( .A(n111), .B(n108), .Y(n107) );
  INV1 U150 ( .A(n109), .Y(n108) );
  NAND2X1 U151 ( .A(n210), .B(n110), .Y(n109) );
  INV1 U152 ( .A(n209), .Y(n110) );
  INV1 U153 ( .A(n152), .Y(n209) );
  NAND2X1 U154 ( .A(n150), .B(n151), .Y(n152) );
  NAND2X1 U155 ( .A(state[1]), .B(state[2]), .Y(n150) );
  NAND2X1 U156 ( .A(n113), .B(n112), .Y(n111) );
  INV1 U157 ( .A(n206), .Y(n113) );
  INV1 U158 ( .A(n147), .Y(n206) );
  NAND2X1 U159 ( .A(n145), .B(n146), .Y(n147) );
  INV1 U160 ( .A(n205), .Y(n146) );
  NAND2X1 U161 ( .A(op[2]), .B(n220), .Y(n145) );
  NAND2X1 U162 ( .A(n137), .B(n138), .Y(n139) );
  INV1 U163 ( .A(reset), .Y(n138) );
  NAND2X1 U164 ( .A(n217), .B(n216), .Y(n137) );
  NAND2X1 U165 ( .A(n193), .B(n185), .Y(n216) );
  INV1 U166 ( .A(n142), .Y(n217) );
  NAND2X1 U167 ( .A(n140), .B(n141), .Y(n142) );
  NAND2X1 U168 ( .A(n151), .B(n172), .Y(n198) );
  INV1 U169 ( .A(state[2]), .Y(n172) );
  NAND2X1 U170 ( .A(state[3]), .B(state[1]), .Y(n191) );
  NAND2X1 U171 ( .A(n215), .B(n214), .Y(n140) );
  INV1 U172 ( .A(n207), .Y(n214) );
  INV1 U173 ( .A(op[3]), .Y(n177) );
  INV1 U174 ( .A(n144), .Y(n219) );
  NAND2X1 U175 ( .A(n124), .B(n123), .Y(n144) );
  INV1 U176 ( .A(n125), .Y(n124) );
  NAND2X1 U177 ( .A(n126), .B(n213), .Y(n125) );
  INV1 U178 ( .A(n127), .Y(n126) );
  NAND2X1 U179 ( .A(n143), .B(n128), .Y(n127) );
  INV1 U180 ( .A(n220), .Y(n128) );
  NAND2X1 U181 ( .A(op[2]), .B(op[1]), .Y(n143) );
  NAND2X1 U182 ( .A(n132), .B(n133), .Y(n134) );
  INV1 U183 ( .A(reset), .Y(n133) );
  NAND2X1 U184 ( .A(n115), .B(n114), .Y(n132) );
  INV1 U185 ( .A(n129), .Y(n114) );
  NAND2X1 U186 ( .A(n130), .B(n136), .Y(n129) );
  INV1 U187 ( .A(irwrite[2]), .Y(n130) );
  INV1 U188 ( .A(n182), .Y(irwrite[2]) );
  NAND2X1 U189 ( .A(n197), .B(state[1]), .Y(n182) );
  NAND2X1 U190 ( .A(state[0]), .B(n174), .Y(n189) );
  INV1 U191 ( .A(state[2]), .Y(n174) );
  INV1 U192 ( .A(n116), .Y(n115) );
  NAND2X1 U193 ( .A(n222), .B(n135), .Y(n116) );
  NAND2X1 U194 ( .A(n221), .B(n220), .Y(n135) );
  NAND2X1 U195 ( .A(n148), .B(n149), .Y(n220) );
  INV1 U196 ( .A(op[5]), .Y(n149) );
  INV1 U197 ( .A(op[3]), .Y(n148) );
  INV1 U198 ( .A(n181), .Y(n117) );
  NAND2X1 U199 ( .A(n118), .B(n122), .Y(n181) );
  INV1 U200 ( .A(state[3]), .Y(n122) );
  INV1 U201 ( .A(state[1]), .Y(n118) );
  NAND2X1 U202 ( .A(n196), .B(n195), .Y(n222) );
  NAND2X1 U203 ( .A(n154), .B(n155), .Y(n205) );
  INV1 U204 ( .A(op[1]), .Y(n155) );
  INV1 U205 ( .A(n212), .Y(n154) );
  NAND2X1 U206 ( .A(n156), .B(n157), .Y(n212) );
  INV1 U207 ( .A(op[0]), .Y(n157) );
  INV1 U208 ( .A(op[4]), .Y(n156) );
  NAND2X1 U209 ( .A(n121), .B(n120), .Y(n207) );
  INV1 U210 ( .A(n184), .Y(n120) );
  NAND2X1 U211 ( .A(state[1]), .B(n170), .Y(n184) );
  INV1 U212 ( .A(state[3]), .Y(n170) );
  INV1 U213 ( .A(n190), .Y(n121) );
  NAND2X1 U214 ( .A(state[2]), .B(n173), .Y(n190) );
  INV1 U215 ( .A(state[0]), .Y(n173) );
  INV1 U216 ( .A(n191), .Y(n161) );
  INV1 U217 ( .A(pcsource[1]), .Y(n164) );
  INV1 U218 ( .A(n139), .Y(n218) );
  INV1 U219 ( .A(n134), .Y(n223) );
  INV1 U220 ( .A(n211), .Y(n123) );
  INV1 U221 ( .A(n207), .Y(n105) );
  INV1 U222 ( .A(aluop[1]), .Y(n141) );
  INV1 U223 ( .A(n224), .Y(n175) );
  INV1 U224 ( .A(irwrite[1]), .Y(n166) );
  INV1 U225 ( .A(n184), .Y(n185) );
  NAND2X1 U226 ( .A(n203), .B(n188), .Y(pcen) );
  NAND2X1 U227 ( .A(n203), .B(n216), .Y(memread) );
  INV1 U228 ( .A(n197), .Y(n180) );
  NAND2X1 U229 ( .A(n203), .B(n211), .Y(alusrcb[0]) );
  INV1 U230 ( .A(irwrite[3]), .Y(n167) );
  INV1 U231 ( .A(n197), .Y(n199) );
  INV1 U232 ( .A(n208), .Y(n104) );
  INV1 U233 ( .A(n215), .Y(n176) );
  INV1 U234 ( .A(n211), .Y(n112) );
  INV1 U235 ( .A(irwrite[3]), .Y(n136) );
  INV1 U236 ( .A(n194), .Y(n178) );
  INV1 U237 ( .A(n194), .Y(n204) );
  NOR2X1 U238 ( .A(n207), .B(n204), .Y(n196) );
  NOR2X1 U239 ( .A(n223), .B(n175), .Y(n1) );
  NOR2X1 U240 ( .A(op[5]), .B(n176), .Y(n208) );
  NOR2X1 U241 ( .A(n204), .B(n177), .Y(n215) );
  NOR2X1 U242 ( .A(n211), .B(n178), .Y(n221) );
  NOR2X1 U243 ( .A(n187), .B(n179), .Y(pcsource[1]) );
  NOR2X1 U244 ( .A(state[1]), .B(n180), .Y(irwrite[0]) );
  NOR2X1 U245 ( .A(n190), .B(n181), .Y(irwrite[3]) );
  NOR2X1 U246 ( .A(state[3]), .B(n189), .Y(n197) );
  NOR2X1 U247 ( .A(n191), .B(n198), .Y(aluop[1]) );
  NOR2X1 U248 ( .A(n190), .B(n187), .Y(pcsource[0]) );
  NOR2X1 U249 ( .A(aluop[1]), .B(pcsource[0]), .Y(n183) );
  NOR2X1 U250 ( .A(n184), .B(n198), .Y(irwrite[1]) );
  NOR2X1 U251 ( .A(n189), .B(n187), .Y(memwrite) );
  NOR2X1 U252 ( .A(n197), .B(n186), .Y(n203) );
  NOR2X1 U253 ( .A(n198), .B(n187), .Y(memtoreg) );
  NOR2X1 U254 ( .A(n191), .B(n189), .Y(regdst) );
  NOR2X1 U255 ( .A(op[2]), .B(n205), .Y(n194) );
  XOR2X1 U256 ( .A(op[5]), .B(op[3]), .Y(n195) );
  MUX2X1 U257 ( .B(n199), .A(n198), .S(state[1]), .Y(n200) );
  AOI22X1 U258 ( .A(n202), .B(n221), .C(n202), .D(n201), .Y(n20) );
  NOR2X1 U259 ( .A(reset), .B(state[3]), .Y(n210) );
  NOR2X1 U260 ( .A(n212), .B(reset), .Y(n213) );
  NOR2X1 U261 ( .A(n219), .B(n218), .Y(n3) );
  AOI22X1 U262 ( .A(n219), .B(op[2]), .C(n219), .D(op[1]), .Y(n224) );
endmodule

