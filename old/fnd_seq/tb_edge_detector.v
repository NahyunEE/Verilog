module tb_edge_detector();

reg clk;
reg rst_n;
reg  signal;
wire  edge_signal;

always #1  clk = ~clk;

edge_detector u_edge_detector(
.clk(clk),
.rst_n(rst_n),
.signal(signal),
.edge_signal(edge_signal)
);


initial begin
rst_n <= 1'b0;
clk   <= 1'b0;
signal <= 1'b1;

#10 rst_n <= 1'b1;

#10 signal <= 1'b0;
#10 signal <= 1'b1;

#20 signal <= 1'b0;
#10 signal <= 1'b1;

#30 $stop;

end

endmodule