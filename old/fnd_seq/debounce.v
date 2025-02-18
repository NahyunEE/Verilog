module debounce(
input clk,
input rst_n, 
input signal,
output debounced_sig
);

parameter DELAY = 20'hf4240,
	  DELAY_SIM = 20'd10;

reg [19:0] counter;
reg temp;
reg debounced;


always@(posedge clk or negedge rst_n) begin
 	
if(!rst_n) begin
  counter <= 20'h0;
  debounced <= 1'b1;
end else begin
	
	if(!signal)
		counter <= counter + 20'h1;
	else if(!signal && (counter == DELAY_SIM) ) begin
		counter <= counter + 20'h1;	
		debounced <= 1'b0;
	end else begin 
		counter <= 20'h0;	
		debounced <= 1'b1;
	end
end

end

assign debounced_sig = debounced;

endmodule
