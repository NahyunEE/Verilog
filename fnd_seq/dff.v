module dff(
input clk,
input reset_n,
input data_in,
input enable,
output reg data_out);

reg data_out_temp;
always@(posedge clk) begin

if(!reset_n) 
   data_out <= 0;
else  	
   data_out <= data_out_temp;

end


always@(*)
data_out_temp <= (enable==1'b1)? data_in : 1'b0;

endmodule