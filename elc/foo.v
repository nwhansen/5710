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

module TIELO;
endmodule

