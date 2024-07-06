module top( 
input clk,
input rst_n,
input [9:0] sw,
input btn_start,
input btn_end,
output [6:0] fnd0,
output [6:0] fnd1,
output [6:0] fnd2,
output [6:0] fnd_correct,
output [7:0] led
);

wire debounced_start;
wire debounced_end;
wire edge_start;
wire edge_end;

wire [3:0] fnd0_input , fnd1_input , fnd2_input , fnd3_input;

//debounce u_debounce_0( .clk(clk) ,.rst_n(rst_n) ,.signal(btn_start) ,.debounced_sig( debounced_start) );
//debounce u_debounce_1( .clk(clk) ,.rst_n(rst_n) ,.signal(btn_end) ,.debounced_sig( debounced_end) );


edge_detector u_edge_0( .clk(clk) ,.rst_n(rst_n) ,.signal(btn_start) ,.edge_signal(edge_start) );
edge_detector u_edge_1 ( .clk(clk) ,.rst_n(rst_n) ,.signal(btn_end) ,.edge_signal(edge_end) );



fsm u_fsm( 
.clk(clk) ,
.rst_n(rst_n) ,
.sw(sw) ,
.btn_start(edge_start) ,
.btn_end(edge_end) ,
.pswd0(fnd0_input) ,
.pswd1(fnd1_input),
.pswd2(fnd2_input),
.correct(fnd3_input) ,
.state(led)
);

fnd u_fnd0( .number(fnd0_input) ,.fnd_on(fnd0) );  //HEX2
fnd u_fnd1( .number(fnd1_input) ,.fnd_on(fnd1) );  //HEX1
fnd u_fnd2( .number(fnd2_input) ,.fnd_on(fnd2) );  //HEX0
fnd u_fnd3( .number(fnd3_input) ,.fnd_on(fnd_correct) );  //HEX3

endmodule





