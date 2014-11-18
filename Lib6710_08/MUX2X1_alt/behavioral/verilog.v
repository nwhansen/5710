//Verilog HDL for "Lib6710_08", "MUX2X1" "behavioral"


module MUX2X1_alt( Y, A, B, S );

  input A;
  input S;
  output reg Y;
  input B;

  always@(A, B, S)
  begin
    case(S)
      1'b0: Y = A;
      1'b1: Y = B;
    endcase
  end
    
endmodule
