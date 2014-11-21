
module controller ( clk, reset, op, zero, memread, memwrite, alusrca, memtoreg, 
        iord, pcen, regwrite, regdst, pcsource, alusrcb, aluop, irwrite );
  input [5:0] op;
  output [1:0] pcsource;
  output [1:0] alusrcb;
  output [1:0] aluop;
  output [3:0] irwrite;
  input clk, reset, zero;
  output memread, memwrite, alusrca, memtoreg, iord, pcen, regwrite, regdst;
  wire   n1, n3, n7, n20, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210;
  wire   [3:0] state;

  DFF2 state_reg_1_ ( .D(n20), .CLK(clk), .CLRB(n7), .QB(state[1]) );
  DFF2 state_reg_3_ ( .D(n3), .CLK(clk), .CLRB(n7), .QB(state[3]) );
  DFF2 state_reg_2_ ( .D(n1), .CLK(clk), .CLRB(n7), .QB(state[2]) );
  DFF2 state_reg_0_ ( .D(n192), .CLK(clk), .CLRB(n7), .Q(state[0]), .QB(n124)
         );
  TIEHI U120 ( .Y(n7) );
  NAND2X1 U121 ( .A(n200), .B(n143), .Y(iord) );
  INVX1 U122 ( .A(memwrite), .Y(n143) );
  NAND2X1 U123 ( .A(n133), .B(n134), .Y(regwrite) );
  INVX1 U124 ( .A(memtoreg), .Y(n134) );
  INVX1 U125 ( .A(n171), .Y(n133) );
  INVX1 U126 ( .A(n137), .Y(n171) );
  NAND2X1 U127 ( .A(n135), .B(n136), .Y(n137) );
  INVX1 U128 ( .A(n170), .Y(n136) );
  NAND2X1 U129 ( .A(n169), .B(n168), .Y(n135) );
  BUFX4 U130 ( .A(pcsource[0]), .Y(aluop[0]) );
  NAND2X1 U131 ( .A(n193), .B(n126), .Y(alusrcb[1]) );
  INVX1 U132 ( .A(n198), .Y(n126) );
  NAND2X1 U133 ( .A(n161), .B(n144), .Y(alusrca) );
  INVX1 U134 ( .A(n198), .Y(n144) );
  NAND2X1 U135 ( .A(n182), .B(n193), .Y(alusrcb[0]) );
  NAND2X1 U136 ( .A(n182), .B(n167), .Y(pcen) );
  INVX1 U137 ( .A(n140), .Y(n167) );
  NAND2X1 U138 ( .A(n138), .B(n139), .Y(n140) );
  INVX1 U139 ( .A(pcsource[1]), .Y(n139) );
  INVX1 U140 ( .A(n172), .Y(n156) );
  NAND2X1 U141 ( .A(zero), .B(pcsource[0]), .Y(n138) );
  NAND2X1 U142 ( .A(state[3]), .B(n146), .Y(n166) );
  INVX1 U143 ( .A(state[1]), .Y(n146) );
  NAND2X1 U144 ( .A(n182), .B(n200), .Y(memread) );
  NAND2X1 U145 ( .A(n141), .B(n142), .Y(n164) );
  INVX1 U146 ( .A(irwrite[3]), .Y(n142) );
  INVX1 U147 ( .A(irwrite[1]), .Y(n141) );
  INVX1 U148 ( .A(n111), .Y(n202) );
  NAND2X1 U149 ( .A(n109), .B(n110), .Y(n111) );
  INVX1 U150 ( .A(reset), .Y(n110) );
  NAND2X1 U151 ( .A(n201), .B(n200), .Y(n109) );
  NAND2X1 U152 ( .A(n172), .B(n163), .Y(n200) );
  INVX1 U153 ( .A(n162), .Y(n163) );
  INVX1 U154 ( .A(n114), .Y(n201) );
  NAND2X1 U155 ( .A(n112), .B(n113), .Y(n114) );
  INVX1 U156 ( .A(aluop[1]), .Y(n113) );
  NAND2X1 U157 ( .A(state[3]), .B(state[1]), .Y(n170) );
  NAND2X1 U158 ( .A(n199), .B(n198), .Y(n112) );
  NAND2X1 U159 ( .A(n191), .B(n190), .Y(n192) );
  INVX1 U160 ( .A(n120), .Y(n185) );
  NAND2X1 U161 ( .A(n118), .B(n119), .Y(n120) );
  INVX1 U162 ( .A(n184), .Y(n119) );
  NAND2X1 U163 ( .A(op[2]), .B(n204), .Y(n118) );
  INVX1 U164 ( .A(n199), .Y(n153) );
  INVX1 U165 ( .A(op[3]), .Y(n154) );
  INVX1 U166 ( .A(n125), .Y(n189) );
  NAND2X1 U167 ( .A(n123), .B(n124), .Y(n125) );
  NAND2X1 U168 ( .A(state[1]), .B(state[2]), .Y(n123) );
  INVX1 U169 ( .A(n210), .Y(n151) );
  INVX1 U170 ( .A(n117), .Y(n203) );
  NAND2X1 U171 ( .A(n115), .B(n116), .Y(n117) );
  INVX1 U172 ( .A(n197), .Y(n116) );
  NAND2X1 U173 ( .A(n196), .B(n195), .Y(n197) );
  NAND2X1 U174 ( .A(op[2]), .B(op[1]), .Y(n115) );
  INVX1 U175 ( .A(n105), .Y(n209) );
  NAND2X1 U176 ( .A(n103), .B(n104), .Y(n105) );
  INVX1 U177 ( .A(reset), .Y(n104) );
  NAND2X1 U178 ( .A(n208), .B(n207), .Y(n103) );
  INVX1 U179 ( .A(n206), .Y(n152) );
  INVX1 U180 ( .A(n108), .Y(n206) );
  NAND2X1 U181 ( .A(n106), .B(n107), .Y(n108) );
  INVX1 U182 ( .A(irwrite[3]), .Y(n107) );
  INVX1 U183 ( .A(n173), .Y(n159) );
  NAND2X1 U184 ( .A(n205), .B(n204), .Y(n106) );
  NAND2X1 U185 ( .A(n121), .B(n122), .Y(n204) );
  INVX1 U186 ( .A(op[5]), .Y(n122) );
  INVX1 U187 ( .A(op[3]), .Y(n121) );
  INVX1 U188 ( .A(n160), .Y(irwrite[2]) );
  NAND2X1 U189 ( .A(n165), .B(state[1]), .Y(n160) );
  NAND2X1 U190 ( .A(n127), .B(n128), .Y(n180) );
  INVX1 U191 ( .A(irwrite[0]), .Y(n128) );
  INVX1 U192 ( .A(n158), .Y(irwrite[0]) );
  NAND2X1 U193 ( .A(n177), .B(n165), .Y(n158) );
  NAND2X1 U194 ( .A(state[0]), .B(n150), .Y(n168) );
  INVX1 U195 ( .A(state[2]), .Y(n150) );
  INVX1 U196 ( .A(n179), .Y(n127) );
  INVX1 U197 ( .A(state[1]), .Y(n177) );
  NAND2X1 U198 ( .A(n147), .B(n148), .Y(n178) );
  INVX1 U199 ( .A(state[2]), .Y(n148) );
  INVX1 U200 ( .A(state[0]), .Y(n147) );
  NAND2X1 U201 ( .A(n176), .B(n175), .Y(n207) );
  INVX1 U202 ( .A(n198), .Y(n186) );
  NAND2X1 U203 ( .A(state[1]), .B(n145), .Y(n162) );
  INVX1 U204 ( .A(state[3]), .Y(n145) );
  NAND2X1 U205 ( .A(state[2]), .B(n149), .Y(n169) );
  INVX1 U206 ( .A(state[0]), .Y(n149) );
  INVX1 U207 ( .A(n174), .Y(n183) );
  INVX1 U208 ( .A(n174), .Y(n155) );
  NAND2X1 U209 ( .A(n129), .B(n130), .Y(n184) );
  INVX1 U210 ( .A(op[1]), .Y(n130) );
  INVX1 U211 ( .A(n194), .Y(n129) );
  NAND2X1 U212 ( .A(n131), .B(n132), .Y(n194) );
  INVX1 U213 ( .A(op[0]), .Y(n132) );
  INVX1 U214 ( .A(op[4]), .Y(n131) );
  NAND2X1 U215 ( .A(n173), .B(n172), .Y(n193) );
  INVX1 U216 ( .A(n157), .Y(n172) );
  NAND2X1 U217 ( .A(state[0]), .B(state[2]), .Y(n157) );
  INVX1 U218 ( .A(reset), .Y(n181) );
  NOR2X1 U219 ( .A(n209), .B(n151), .Y(n1) );
  NOR2X1 U220 ( .A(irwrite[2]), .B(n152), .Y(n208) );
  NOR2X1 U221 ( .A(op[5]), .B(n153), .Y(n187) );
  NOR2X1 U222 ( .A(n183), .B(n154), .Y(n199) );
  NOR2X1 U223 ( .A(n193), .B(n155), .Y(n205) );
  NOR2X1 U224 ( .A(n166), .B(n156), .Y(pcsource[1]) );
  NOR2X1 U225 ( .A(n169), .B(n159), .Y(irwrite[3]) );
  NOR2X1 U226 ( .A(state[3]), .B(n168), .Y(n165) );
  NOR2X1 U227 ( .A(state[3]), .B(state[1]), .Y(n173) );
  NOR2X1 U228 ( .A(n170), .B(n178), .Y(aluop[1]) );
  NOR2X1 U229 ( .A(n169), .B(n166), .Y(pcsource[0]) );
  NOR2X1 U230 ( .A(n169), .B(n162), .Y(n198) );
  NOR2X1 U231 ( .A(aluop[1]), .B(pcsource[0]), .Y(n161) );
  NOR2X1 U232 ( .A(n162), .B(n178), .Y(irwrite[1]) );
  NOR2X1 U233 ( .A(n168), .B(n166), .Y(memwrite) );
  NOR2X1 U234 ( .A(n165), .B(n164), .Y(n182) );
  NOR2X1 U235 ( .A(n178), .B(n166), .Y(memtoreg) );
  NOR2X1 U236 ( .A(n170), .B(n168), .Y(regdst) );
  NOR2X1 U237 ( .A(op[2]), .B(n184), .Y(n174) );
  NOR2X1 U238 ( .A(n183), .B(n186), .Y(n176) );
  XOR2X1 U239 ( .A(op[5]), .B(op[3]), .Y(n175) );
  AOI22X1 U240 ( .A(n207), .B(n178), .C(n207), .D(n177), .Y(n179) );
  AOI22X1 U241 ( .A(n181), .B(n205), .C(n181), .D(n180), .Y(n20) );
  NOR2X1 U242 ( .A(reset), .B(state[3]), .Y(n191) );
  OAI22X1 U243 ( .A(n187), .B(n186), .C(n185), .D(n193), .Y(n188) );
  NOR2X1 U244 ( .A(n189), .B(n188), .Y(n190) );
  NOR2X1 U245 ( .A(n193), .B(n204), .Y(n196) );
  NOR2X1 U246 ( .A(n194), .B(reset), .Y(n195) );
  NOR2X1 U247 ( .A(n203), .B(n202), .Y(n3) );
  AOI22X1 U248 ( .A(n203), .B(op[2]), .C(n203), .D(op[1]), .Y(n210) );
endmodule

