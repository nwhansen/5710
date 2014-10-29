//Verilog HDL for "Lib6710_08", "NAND2X1" "functional"


module NAND2X1 (Y, A, B);
   input A, B;
   output Y;
   assign Y = ~(A & B);
endmodule
