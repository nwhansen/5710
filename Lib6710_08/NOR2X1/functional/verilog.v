//Verilog HDL for "Lib6710_08", "NOR2X1" "functional"


module NOR2X1 ( Y, A, B );
   input A, B;
   output Y;
   assign Y = ~(A | B);
endmodule
