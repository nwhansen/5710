//Verilog HDL for "Lib6710_08", "XOR2X1" "behavioral"


module XOR2X1 ( Y, A, B );

  input A;
  output Y;
  input B;

   assign Y = A ^ B;
   
endmodule
