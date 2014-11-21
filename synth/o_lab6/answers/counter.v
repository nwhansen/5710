module counter(clk, limit, set, value);
	input wire clk;
//	input wire clr;
	input wire set;
	input wire [3:0] limit;
		
	output reg [3:0] value;
	reg [3:0] storedlimit;
	reg running;
	
	always @(posedge clk) begin
		if(set) begin
			storedlimit <= limit;
			running <= 1;
			value <= 0;
		end else if(running) begin
			if(value < storedlimit)
				value <= value + 1;
			else running <= 0;
		end
	end
endmodule

