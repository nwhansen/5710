//Verilog HDL for "Lib6710_08", "AOI22X1" "behavioral"


module AOI22X1 ( Y, A, B, C, D );

  input A;
  input C;
  output Y;
  input D;
  input B;
   assign Y = !((A&B)|(C&D));
   
endmodule
