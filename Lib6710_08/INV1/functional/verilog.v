//Verilog HDL for "Lib6710_08", "INVX1" "functional"


module INV1( Y, A );

  input A;
  output Y;
  assign Y = ~A;
endmodule
