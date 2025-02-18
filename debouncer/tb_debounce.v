`timescale 1ns/100ps
module tb_debounce();
reg S_AXI_ACLK;
reg S_AXI_ARESETN;
reg  push;
wire [3:0]led_on;
wire intr_src;



debounce u_deb( .S_AXI_ACLK(S_AXI_ACLK), .S_AXI_ARESETN(S_AXI_ARESETN) ,.push(push) ,.led_on(led_on) ,.intr_src(intr_src) );

always #1 S_AXI_ACLK = ~S_AXI_ACLK;

initial begin
S_AXI_ACLK =0;
S_AXI_ARESETN = 0;
push =0;

#1 S_AXI_ARESETN = 1;

#1 push =1;
#1 push =0;
#1 push =1;
#1 push =0;
#1 push =1;
#1 push =0;
#1 push =1;
#1 push =0;
#1 push =1;
#1 push =0;
#1 push =1;
#1 push =0;
#1 push =1;
#1 push =0;
#1 push =1;
#1 push =0;
#1 push =1;
#20 push =1;
#20 $stop;

end

endmodule