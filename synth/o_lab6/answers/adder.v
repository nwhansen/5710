module adder(a,b,s,c);
	input wire [3:0] a;
	input wire [3:0] b;
	
	output wire c;
	output wire [3:0] s;
	
	assign {c,s} = a + b;
endmodule

