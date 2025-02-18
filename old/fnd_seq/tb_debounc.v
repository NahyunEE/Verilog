`timescale 1ns/1ns

module tb_debounce();

reg clk;
reg rst_n;
reg signal;
wire debounced_sig;

debounce u_debounde(
.clk(clk),
.rst_n(rst_n),
.signal(signal),
.debounced_sig(debounced_sig)
);

always #1 clk = ~clk;

initial begin
rst_n <= 1'b0;
clk   <= 1'b0;
signal <= 1'b1;

#10 rst_n <= 1'b1;

#10 signal <= 1'b0;
#20 signal <= 1'b1;

#20 signal <= 1'b0;
#40 signal <= 1'b1;

#40 signal <=1'b0;

#30 $stop;

end

endmodule