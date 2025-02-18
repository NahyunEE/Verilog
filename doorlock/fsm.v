module fsm(
input clk,
input rst_n,
input [7:0] sw,
input btn_start,
input btn_end,
input enable,
output [3:0] pswd0,
output [3:0] pswd1,
output [3:0] pswd2,
output [3:0] correct,
output [7:0] state
);

parameter S_IDLE  = 8'b0000_0000,
	  S_WAIT = 8'b0000_0001,
	  S_FIRST = 8'b0000_0010,
	  S_SECOND= 8'b0000_0100,
	  S_THIRD = 8'b0000_1000,
	  S_FAIL = 8'b0001_0000,
	  S_X = 8'b0010_0000,
	  S_OK = 8'b0100_0000,
   	  S_START_M = 8'b0000_0011,
          S_SECOND_M = 8'b0000_0111,
	  S_FIRST_M = 8'b0000_1111;
     
	  
reg [6:0] cst, nxt;
reg [3:0] pswd0_temp, pswd1_temp, pswd2_temp, correct_temp;
reg [7:0] state_temp;
wire reset;
always@(posedge clk or negedge rst_n) begin

	if(!rst_n) begin
	cst <= S_IDLE;	
 	end else 
	cst <= (enable == 1'b0) ? nxt: S_IDLE;
end



always@( *) begin

case(cst)	
		S_IDLE   : nxt <= (btn_start == 1'b1)? S_WAIT : state;
		S_WAIT   : nxt <= (sw[0] == 1'b1)? S_FIRST : 
				 ((sw&(8'b1111_1110))!=8'h000)? S_FAIL :
				 (btn_end==1'b1)? S_X : cst;
		S_FIRST  : nxt <= (sw[2] == 1'b1)? S_SECOND : 
							  ((sw&(8'b1111_1011))!=10'h000)? S_FAIL : 
							  (btn_end==1'b1)? S_X : cst;
		S_SECOND : nxt <= (sw[6] == 1'b1)? S_THIRD : 
							  ((sw&(8'b1011_1111))!=10'h000)? S_FAIL : 
							  (btn_end==1'b1)? S_X : cst;
		S_THIRD  : nxt <= (btn_end == 1'b1)? S_OK : 
							  ((sw&(10'b11_1111_1111))!=10'h000)? S_FAIL : 
							  (btn_end==1'b1)? S_X : cst;
		S_OK     : nxt <= (!reset)? S_IDLE : cst;
		S_FAIL   : nxt <= (btn_end == 1'b1)? S_X : cst;
		S_X      : nxt <= (!reset)? S_IDLE : cst;
		default  : nxt <= S_IDLE;

endcase

end

always@( cst ) begin
case(cst) S_IDLE: begin pswd0_temp <= 4'hA ; pswd1_temp <= 4'hA ; pswd2_temp <= 4'hA ; 
                        correct_temp <= 4'hA ; state_temp <= 8'b0000_0001; end
          S_WAIT: begin pswd0_temp <= 4'hA ; pswd1_temp <= 4'hA ; pswd2_temp <=4'hA ; 
                        correct_temp <= 4'hA ; state_temp <= 8'b0000_0010; end
          S_FIRST: begin pswd0_temp <= 4'hA ; pswd1_temp <= 4'hA ; pswd2_temp <= 4'hA ; 
                        correct_temp <= 4'hA ; state_temp <= 8'b0000_0100; end
          S_SECOND: begin pswd0_temp <= 4'hA ; pswd1_temp <= 4'hA ; pswd2_temp <= 4'hA ; 
                          correct_temp <= 4'hA ; state_temp <= 8'b0000_1000; end
          S_THIRD: begin pswd0_temp <= 4'hA ; pswd1_temp <= 4'hA ; pswd2_temp <= 4'hA ; 
                        correct_temp <= 4'hA ; state_temp <= 8'b0001_0000; end
	  S_FAIL: begin pswd0_temp <= 4'hA ; pswd1_temp <= 4'hA ; pswd2_temp = 4'hA ; 
                        correct_temp <= 4'hA ; state_temp <= 8'b0010_0000; end
	  S_X: begin pswd0_temp <= 4'h6 ; pswd1_temp <= 4'h2 ; pswd2_temp <= 4'h0 ; 
                        correct_temp <= 4'hB ; state_temp <= 8'b0100_0000; end
          S_OK: begin pswd0_temp <= 4'h6; pswd1_temp <= 4'h2 ; pswd2_temp <= 4'h0 ; 
                        correct_temp <= 4'h0 ; state_temp <= 8'b1000_0000; end
	  default begin pswd0_temp <= 4'hA ; pswd1_temp <= 4'hA ; pswd2_temp <= 4'hA ; 
                        correct_temp <= 4'hA ; state_temp <= 8'b0000_0001; end
          
 endcase
 end     

assign pswd0 = pswd0_temp;
assign pswd1 = pswd1_temp;
assign pswd2 = pswd2_temp;
assign correct = correct_temp;
assign state = state_temp;
assign reset = rst_n;

endmodule