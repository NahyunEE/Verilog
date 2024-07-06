module counter(
  input clk,
  input reset_n,
  input signal,
  output enable
    );

reg [19:0] counter;


parameter CLOCK = 20'hf4240,
	  SIM_CLOCK = 20'd50;



always @(posedge clk or negedge reset_n) begin
if(!reset_n) 
counter <= 20'b0;
else
counter <= ((counter<CLOCK )&& (signal == 1'b1))? counter + 1'b1 : 0;
end


assign enable = (counter == (CLOCK >> 1));

endmodule

  
