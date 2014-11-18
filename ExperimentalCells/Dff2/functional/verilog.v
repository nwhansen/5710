//Verilog HDL for "lab3", "Dff2" "functional"


module Dff2 ( Q, Qb, CLK, CLRb, D );

   // input ports
   input CLRb, CLK, D;
   
   // output ports
   output Q, Qb;

   // internal variables
   reg 	  Q, Qb;

   always @(posedge CLK or negedge CLRb)
     if(~CLRb) begin
	Q <= 1'b0;
	Qb <= 1'b1;
     end else begin
	Q <= D;
	Qb <= ~D;
     end
endmodule
