module edge_detector( 
input clk,
input rst_n,
input  signal,
output edge_signal);

reg temp;
reg temp2;

always@(posedge clk or rst_n) begin

if(!rst_n) begin
	temp<= 1'b1;
	temp2 <= 1'b1;
end 
else begin
 	temp <= signal;
        temp2<= temp;
end

end


assign edge_signal = ( temp || temp2) ? 1'b0 : 1'b1 ;


endmodule

