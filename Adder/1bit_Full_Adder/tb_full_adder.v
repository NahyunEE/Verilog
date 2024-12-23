`timescale 1ns/100ps

module tb_full_adder();
reg a,b,c_in;
wire c_out, sum;


full_adder full_adder( .a(a), .b(b), .c_in(c_in), .c_out(c_out),.sum(sum));

initial begin 

a = 1'd0; b=1'd0; c_in=1'b0;
#5 a=1'd1; b=1'd1; c_in =1'b1;

end

endmodule