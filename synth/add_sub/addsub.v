module addsub (a, b, addnsub, result);
   parameter SIZE = 8;
   input  [SIZE-1:0] a;
   input  [SIZE-1:0] b;
   input  addnsub;
   output [SIZE:0] result;
   reg    [SIZE:0] result;

   always @(a or b or addnsub)
      begin
         if (addnsub)
	    result = a + b;
	  else
            result = a - b;
	end
endmodule
