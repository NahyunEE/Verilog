`timescale 1ns/1ps

module tb_counter();

reg clk;
reg reset_n;
reg signal;
wire enable;

counter u_counter( .clk(clk) ,.reset_n(reset_n) ,.enable(enable) ,.signal(1'b1) );


always #1 clk = ~clk;

initial begin 
clk = 1'b0;
reset_n = 1'b0;
signal = 1'b0;


#2 reset_n = 1'b1;
#2 signal = 1'b1;



#1000020 signal = 1'b0;
#20  $stop;
end


endmodule
