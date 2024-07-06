`timescale 1ns/1ps

module tb_top();

reg clk;
reg rst_n;
reg  [9:0] sw;
reg  btn_start;
reg  btn_end;
wire  [6:0] fnd0;
wire  [6:0] fnd1;
wire  [6:0] fnd2;
wire  [6:0] fnd_correct;
wire [7:0] led;

top u_top( .clk(clk) ,
.rst_n(rst_n),
.sw(sw),
.btn_start(btn_start),
.btn_end(btn_end),
.fnd0(fnd0),
.fnd1(fnd1),
.fnd2(fnd2),
.fnd_correct(fnd_correct),
.led(led)
);



always #1 clk = ~clk ;

initial begin
clk = 0;
rst_n = 1'b0;
btn_start = 1'b1;
btn_end = 1'b1;
sw = 1'b00_0000_0000;

#10 rst_n = 1'b1;


//Correct Case
#10 btn_start = 1'b0;
#2 btn_start = 1'b1;
#10 sw = 10'b00_0000_0001;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0000_0100;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0010_0000;
#10 sw = 10'b00_0000_0000;
#10 btn_end = 1'b0;
#10 btn_end = 1'b1;


//Error in First Password
#10 btn_start = 1'b0;
#10 btn_start = 1'b1;
#10 sw = 10'b00_1000_0000;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0000_0010;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0010_0000;
#10 sw = 10'b00_0000_0000;
#10 btn_end = 1'b0;
#10 btn_end = 1'b1;


//Error in Second Password
#10 btn_start = 1'b0;
#10 btn_start = 1'b1;
#10 sw = 10'b00_0000_0001;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0010_0000;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0010_0000;
#10 sw = 10'b00_0000_0000;
#10 btn_end = 1'b0;
#10 btn_end = 1'b1;


//Error in Third Password
#10 btn_start = 1'b0;
#10 btn_start = 1'b1;
#10 sw = 10'b00_0000_0001;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0000_0100;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0010_0000;
#10 sw = 10'b00_0000_0000;
#10 btn_end = 1'b0;
#10 btn_end = 1'b1;

//Case of Noting Switched 
#10 btn_start = 1'b0;
#10 btn_start = 1'b1;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0000_0000;
#10 btn_end = 1'b0;
#10 btn_end = 1'b1;

//Early Push End Button
#10 btn_start = 1'b0;
#10 btn_start = 1'b1;
#10 sw = 10'b00_0000_0001;
#10 sw = 10'b00_0000_0000;
#10 btn_end = 1'b0;
#10 btn_end = 1'b1;

//Additional inputs in Switch
#10 btn_start = 1'b0;
#10 btn_start = 1'b1;
#10 sw = 10'b00_0000_0001;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0000_0100;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b00_0010_0000;
#10 sw = 10'b00_0000_0000;
#10 sw = 10'b01_0000_0000;
#10 sw = 10'b00_0000_0000;
#10 btn_end = 1'b0;
#10 btn_end = 1'b1;

#30 $stop;
end

endmodule