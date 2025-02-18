`timescale 1ns/1ps
module tb_debouncor();

reg clk;
reg reset_n;
reg data_in;
wire  data_out;



debouncor u_debounce( 
.clk(clk),
.reset_n(reset_n),
.data_in(data_in),
.data_out(data_out)

);

bouncor u_debounce( 
.clk(clk),
.reset_n(reset_n),
.data_in(data_in),
.data_out(data_out)

);


always #1 clk = ~clk;

initial begin
clk =0; reset_n = 0; data_in = 1'b1;

#1 reset_n = 1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;


#13 data_in = 1'b0;
#13 data_in = 1'b1;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;
#1 data_in = 1'b0;
#1 data_in = 1'b1;


#1030  data_in =1'b0;
#20 $stop;

end

endmodule
