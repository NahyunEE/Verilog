module edge_detector( 
input clk,
input rst_n,
input  [7:0]signal,
output [7:0]edge_signal);

reg [7:0] temp;
reg [7:0] temp2;
reg [7:0] edge_temp;

always@(posedge clk or negedge rst_n) begin

if(!rst_n) begin
	temp<= 7'b0;
	
end 
else begin
 	temp <= signal;
        temp2<= temp;
end

end


always@(*) begin
	edge_temp <= ((temp>7'h0) && (temp2 == 7'h0))?temp : 7'b000_0000;
end

assign edge_signal = edge_temp;

endmodule

