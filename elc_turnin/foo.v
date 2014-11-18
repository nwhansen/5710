module AOI22X1(A,B,C,D,Y);
	input	A,B,C,D;
	output	Y;
	nor(Y,_n1,_n2);
	and(_n2,A,B);
	and(_n1,C,D);
endmodule

module INV1(A,Y);
	input	A;
	output	Y;
	not(Y,A);
endmodule

module MUX2X1(A,B,S,Y);
	input	A,B,S;
	output	Y;
	mux(Y,S,A,B);
endmodule

module NAND2X1(A,B,Y);
	input	A,B;
	output	Y;
	nand(Y,A,B);
endmodule

module NOR2X1(A,B,Y);
	input	A,B;
	output	Y;
	nor(Y,A,B);
endmodule

module TIEHI(Y);
	output	Y;
endmodule

module TIELO(Y);
	output	Y;
endmodule

module TRI_NAND2(A,B,E,F,NE);
	input	A,B,E,NE;
	output	F;
	and(_n1,A,B);
	notif1(F,_n1,E);
endmodule

module XOR2X1(A,B,Y);
	input	A,B;
	output	Y;
	xor(Y,A,B);
endmodule

primitive mux(Y,S,A,B);
	output	Y;
	input	S,A,B;
	table	1 1 ? : 1;
		1 0 ? : 0;
		0 ? 1 : 1;
		0 ? 0 : 0;
		? 1 1 : 1;
		? 0 0 : 0;
	endtable
endprimitive

