module debounce(
    S_AXI_ACLK,
    S_AXI_ARESETN,
    push,
    led_on,
    intr_src
);
    
input 	S_AXI_ACLK;
input	S_AXI_ARESETN;
input	push;
output [3:0] led_on;
output	intr_src;

reg [3:0] cnt_push;
reg [3:0] temp;
reg [3:0] temp1;

reg intr_temp;

always @(posedge S_AXI_ACLK) begin
    if (S_AXI_ARESETN == 1'b0) begin
        temp <= 1'b0;
	temp1 <= 1'b0;
	cnt_push <= 4'h0;
    end
    else begin
        temp <= push;
	temp1 <= temp;                   
    end
end



assign intr_src = ( temp && !temp1 )? 1'b1: 1'b0 ;
assign led_on = cnt_push;

endmodule

