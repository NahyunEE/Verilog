`timescale 1ns/100ps
module tb_mul_ver2();
reg start, clk, rst_n;
reg [3:0] din_m, din_q;
wire [7:0] d_out;

mul4 mm( .din_m(din_m), .din_q(din_q), .d_out(d_out), .start(start), .clk(clk), .rst_n(rst_n));

initial begin 
	clk=1'b1;
	rst_n=1'b0;
end

always #2 clk = ~clk;

initial begin
#2 start =1'b1; rst_n=1'b1; din_m=4'b0001; din_q=4'd3;
#2 start =1'b1; rst_n=1'b1; din_m=4'd7; din_q=4'd1;
#2 start =1'b1; rst_n =1'b1; din_m=4'hA; din_q=4'h10;
end
endmodule