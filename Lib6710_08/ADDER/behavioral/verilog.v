//Verilog HDL for "Lib6710_08", "ADDER" "behavioral"


module ADDER (Cout, S, A, B, Cin);
  input A;
  output S;
  input Cin;
  output Cout;
  input B;
 
  assign S = A ^ B ^ Cin;
  assign Cout = (A & B) | (A & Cin) | (B & Cin);  
endmodule
