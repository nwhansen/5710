//Verilog HDL for "Lib6710_08", "INVX1" "functional"


module INVX1 ( O, A );

  input A;
  output O;
  assign O = ~A;
endmodule
