
module mux8_1(a1, a2,a3,a4,a5,a6,a7,a8,s1,s2,s3,o);
	input wire a1, a2, a3, a4, a5, a6, a7, a8, s1, s2, s3;
	output reg o;
	always@(*) begin
		case({s3,s2,s1})
			3'b000: o <= a1;
			3'b001: o <= a2;
			3'b010: o <= a3;
			3'b011: o <= a4;
			3'b100: o <= a5;
			3'b101: o <= a6;
			3'b110: o <= a7;
			3'b111: o <= a8;
		endcase
	end
endmodule

