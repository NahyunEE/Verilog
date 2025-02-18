module top( 
input clk,
input rst_n,
input mode_ctrl,
input [7:0] sw,
input btn_start,
input btn_end,
output [6:0] fnd0,
output [6:0] fnd1,
output [6:0] fnd2,
output [6:0] fnd_correct,
output [9:0] led
);

wire [7:0] edge_signal;
wire n_btn_start, n_btn_end;
wire btn_start_temp, btn_end_temp;

wire [3:0] fsm1_fnd0,fsm1_fnd1,fsm1_fnd2,fsm1_fnd3 ;
wire [3:0] fsm2_fnd0 ,fsm2_fnd1,fsm2_fnd2 ,fsm2_fnd3;

reg [3:0] fnd0_input , fnd1_input , fnd2_input ,fnd3_input;
reg[9:0] led_temp,led_fsm1 , led_fsm2;

wire [9:0] led_fsm1_temp, led_fsm2_temp;

//Switch Detection

edge_detector u_edge (.clk(clk) ,.rst_n(rst_n) ,.signal(sw) ,.edge_signal(edge_signal) );


//Debouncor Button

debouncor u_start( .clk(clk)  ,.reset_n(rst_n) ,.data_in(n_btn_start) ,.data_out(btn_start_temp) );
debouncor u_end( .clk(clk)  ,.reset_n(rst_n) ,.data_in(n_btn_end) ,.data_out(btn_end_temp) );

//fsm1
//
fsm u_fsm1 ( .clk(clk) ,.rst_n(rst_n) ,.sw(edge_signal) ,.btn_start(btn_start_temp) ,.btn_end(btn_end_temp) , .enable(mode_ctrl),
		.pswd0(fsm1_fnd0), .pswd1(fsm1_fnd1) ,.pswd2(fsm1_fnd2) ,.correct(fsm1_fnd3) ,.state(led_fsm1_temp) );

//fsm2
fsm2 u_fsm2 ( .clk(clk) ,.reset_n(rst_n) ,.sw(edge_signal) ,.btn_start(btn_start_temp) ,.btn_end(btn_end_temp) , .enable(mode_ctrl),
		.fnd0(fsm2_fnd0), .fnd1(fsm2_fnd1) ,.fnd2(fsm2_fnd2)  ,.state(led_fsm2_temp) );

//fnd
fnd u_fnd0 ( .number(fnd0_input) ,.fnd_on(fnd0));
fnd u_fnd1 ( .number(fnd1_input) ,.fnd_on(fnd1));
fnd u_fnd2 ( .number(fnd2_input) ,.fnd_on(fnd2));
fnd u_fnd3 ( .number(fnd3_input) ,.fnd_on(fnd3));

assign n_btn_start = !btn_start;
assign n_btn_end  =  !btn_end;
assign led = led_temp;


always@(posedge clk or negedge rst_n) begin
if(!rst_n) begin

end else begin
led_fsm1 <= led_fsm1_temp;
led_fsm2 <= led_fsm2_temp;

end

end


always@(*) begin 

	if(mode_ctrl) begin	
	fnd0_input <= fsm2_fnd0;
	fnd1_input <= fsm2_fnd1;
	fnd2_input <= fsm2_fnd2;
	fnd3_input <= 4'hA;
	led_temp <= led_fsm1;
	end else begin
	fnd0_input <= fsm1_fnd0;
	fnd1_input <= fsm1_fnd1;
	fnd2_input <= fsm1_fnd2;
	fnd3_input <= fsm1_fnd3;
	led_temp<= led_fsm2;
	end
	
end



endmodule





