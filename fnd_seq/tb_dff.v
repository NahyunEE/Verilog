
`timescale 1ns/1ps
module tb_dff();

reg clk;
reg reset_n;
reg enable;
reg data_in;

wire data_out;

dff u_dff( .clk(clk) ,.reset_n(reset_n) ,.data_in(data_in) ,.data_out(data_out) ,.enable(enable) );


always #1 clk = ~clk;
 
initial begin
clk = 1'b0;
reset_n = 1'b0;
data_in = 1;
enable= 1'b0;

#1 reset_n  = 1'b1;
#1 enable = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;

#10 $stop;

end


endmodule
