module debouncor(
input clk,
input reset_n,
input data_in,
output data_out

);

wire data_ff1;
wire data_ff2;
wire data_out_1;
wire data_out_2;
wire enable_ff3;



dff_0 u_dff_1 ( .clk(clk)  ,.reset_n(reset_n) ,.enable(1'b1) ,.data_in(data_in) ,.data_out(data_ff1) );
dff_0 u_dff_2 ( .clk(clk)  ,.reset_n(reset_n) ,.enable(1'b1) ,.data_in(data_ff1) ,.data_out(data_ff2) );
dff_0 u_dff_3 ( .clk(clk)  ,.reset_n(reset_n) ,.enable(enable_ff3) ,.data_in(data_out_1) ,.data_out(data_out_2) );

counter u_counter_enable( .clk(clk) ,.reset_n(reset_n) ,.enable(enable_ff3) ,.signal(data_in));



assign data_out_1 = !(data_ff1 ^ data_ff2);
assign data_out = data_out_2;
endmodule