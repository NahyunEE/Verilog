module fsm(
input clk,
input rst_n,
input [9:0] sw,
input btn_start,
input btn_end,
output [3:0] pswd0,
output [3:0] pswd1,
output [3:0] pswd2,
output [3:0] correct,
output [7:0] state
);

parameter S0 = 8'b0000_0000,
	  S1 = 8'b0000_0001,
	  S2 = 8'b0000_0010,
	  S3 = 8'b0000_0100,
	  S4 = 8'b0000_1000,
	  S5 = 8'b0001_0000,
	  S6 = 8'b0010_0000,
	  S7 = 8'b0100_0000,
	  S8 = 8'b1000_0000;
reg [7:0] cst, nxt;

always@(posedge clk or negedge rst_n) begin

	if(!rst_n) begin
	cst <= S0;
	nxt <= S0;
 	end else 
	cst <= nxt;
end


reg [3:0] pswd0_temp, pswd1_temp, pswd2_temp ,correct_temp ;


always@( cst or nxt or btn_start or btn_end  or sw) begin
	
case(cst)	S0: begin
		if(!btn_start)
		nxt <= S1;
		else
		nxt <= S0;
		end

		S1: begin
			pswd0_temp <= 4'hA;
			pswd1_temp <= 4'hA;
			pswd2_temp <= 4'hA;
			correct_temp <= 4'hA;
			if(sw == 10'b00_0000_00001)
				nxt <= S2;
			else if( (sw != 10'b00_0000_00001) && (sw || 10'h0) )
				nxt <= S8;
			else if(!btn_end) begin
				pswd0_temp <= 4'h6;
				pswd1_temp <= 4'h2;
				pswd2_temp <= 4'h0;
				correct_temp <= 4'hB;//X in fnd
				nxt <= S0;		
			end else 
				nxt <= S1;
	        end


		S2: begin
			if(sw == 10'b00_0000_0000)
				nxt <= S3;
			else if(!btn_end) begin			
				pswd0_temp <= 4'h6;
				pswd1_temp <= 4'h2;
				pswd2_temp <= 4'h0;
				correct_temp <= 4'hB;//X in fnd
				nxt <= S0;	
			end else
				nxt <= S2;
		end
			
		
		S3: begin 
			if(sw==10'b00_0000_0100)
				nxt <= S4;
			else if((sw || 10'h0) && (sw != 10'b00_0000_0100) )
				nxt <= S8;
			else if(!btn_end) begin
				pswd0_temp <= 4'h6;
				pswd1_temp <= 4'h2;
				pswd2_temp <= 4'h0;
				correct_temp <= 4'hB;//X in fnd
				nxt <= S0;	
 			end else
				nxt <= S3;
		end


		S4: begin
			if(sw == 10'b00_0000_0000)
				nxt <= S5;
			else if(!btn_end) begin			
				pswd0_temp <= 4'h6;
				pswd1_temp <= 4'h2;
				pswd2_temp <= 4'h0;
				correct_temp <= 4'hB;//X in fnd
				nxt <= S0;	
			end else
				nxt <= S4;

		end



		S5:begin
			if(sw == 10'b00_0010_0000)
				nxt <= S6 ;
			else if ((sw || 10'b00_0000_0000) && (sw != 10'b00_0010_0000))
				nxt <= S8;
			else if(!btn_end) begin
				pswd0_temp <= 4'h6;
				pswd1_temp <= 4'h2;
				pswd2_temp <= 4'h0;
				correct_temp <= 4'hB;//X in fnd
				nxt <= S0;	
 			end else
				nxt <= S5;
		end

		S6:begin
			if(sw == 10'b00_0000_0000)
				nxt <= S7;
			else if(!btn_end) begin
				pswd0_temp <= 4'h6;
				pswd1_temp <= 4'h2;
				pswd2_temp <= 4'h0;
				correct_temp <= 4'hB;//X in fnd
				nxt <= S0;	
 			end else
				nxt <= S6;
		end


		S7: begin
			if(!btn_end) begin
				pswd0_temp <= 4'h6;
				pswd1_temp <= 4'h2;
				pswd2_temp <= 4'h0;
				correct_temp <= 4'h0;//O in fnd
				nxt <= S0;	
			end else if(sw || 10'b00_0000_0000)
				nxt <= S8;
			else
				nxt <= S7;

		end

		S8: begin
			if(!btn_end) begin
				pswd0_temp <= 4'h6;
				pswd1_temp <= 4'h2;
				pswd2_temp <= 4'h0;
				correct_temp <= 4'hB;//X in fnd
				nxt <= S0;	
			end else
				nxt <= S8;
		end

		default
		begin
			pswd0_temp <= 4'hA;
			pswd1_temp <= 4'hA;
			pswd2_temp <= 4'hA;
			correct_temp <= 4'hA;
			nxt <= S0;
		end
endcase

end


assign pswd0  = pswd0_temp;
assign pswd1  = pswd1_temp;
assign pswd2  = pswd2_temp;
assign correct = correct_temp;
assign state = cst;

		
		
			
endmodule