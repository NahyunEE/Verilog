module fsm2( 
input clk,
input reset_n,
input btn_start,
input btn_end,
input [7:0] sw,
input enable,
output [9:0] state,
output [3:0] fnd0,
output [3:0] fnd1,
output [3:0] fnd2
);


reg [7:0] sw_in1, sw_in2, sw_in3;

parameter S0 = 7'b000_0001,
	  S1 = 7'b000_0010,
	  S2 = 7'b000_0010,
	  S3 = 7'b000_0100,
	  S4 = 7'b000_1000,
	  S5 = 7'b001_0000,
	  S6 = 7'b010_0000,
	  S7 = 7'b100_0000;

reg [7:0] cst , nxt;
reg [3:0] fnd0_temp, fnd1_temp, fnd2_temp;
reg [7:0] state_temp;

always@(posedge clk or negedge reset_n) begin
if(!reset_n) 
	cst <= S0;
else
	cst <= (enable== 1'b1)? nxt : S0;
end

always@(cst) begin

case(cst)  S0: nxt <= (btn_start == 1'b1) ? S1: cst;
	   S1: nxt <=(sw != 8'b0000_0000)? S2 : cst;
	   S2: nxt <=(sw == 8'b0000_0000) ? S3: cst;
	   S3: nxt <=(sw != 8'b0000_0000) ?S4: cst;
	   S4: nxt <=(sw == 8'b0000_0000)? S5: cst;
 	   S5: nxt <=(sw != 8'b0000_0000)? S6: cst;
	   S6: nxt <=(sw == 8'b0000_0000) ? S7: cst;
	   S7: nxt <=(btn_end == 1'b1) ? S0: S7;
	   default nxt <= S0;

endcase

end

always@(*) begin
case (cst) S0: begin fnd0_temp <= 4'hA ; fnd1_temp <= 4'hA ; fnd2_temp <= 4'hA ; 
                     state_temp <= 8'b0000_0001; end
	   S1: begin fnd0_temp <= 4'hA ; fnd1_temp <= 4'hA ; fnd2_temp <= 4'hA ; 
                     state_temp <= 8'b0000_0010;  sw_in1 <= sw; end
	   S2:begin fnd0_temp <= sw_in1 ; fnd1_temp <= 4'hA ; fnd2_temp <= 4'hA ; 
                     state_temp <= 8'b0000_0100; end
	   S3:begin fnd0_temp <= sw_in1 ; fnd1_temp <= 4'hA ; fnd2_temp <= 4'hA ; 
                     state_temp <= 8'b0000_1000; sw_in2 <= sw; end
	   S4:begin fnd0_temp <= sw_in1 ; fnd1_temp <= sw_in2; fnd2_temp <= 4'hA ; 
                     state_temp <= 8'b0001_0000; end
	   S5:begin fnd0_temp <= sw_in1 ; fnd1_temp <= 4'hA ; fnd2_temp <= 4'hA ; 
                     state_temp <= 8'b0010_0000; sw_in3 <= sw; end
	   S6:begin fnd0_temp <= sw_in1 ; fnd1_temp <= sw_in2; fnd2_temp <= sw_in3 ; 
                     state_temp <= 8'b0100_0000; end
	   S7:begin fnd0_temp <= sw_in1 ; fnd1_temp <= sw_in2; fnd2_temp <= sw_in3 ; 
                     state_temp <= 8'b1000_0000; end
endcase
end

assign fnd0 = fnd0_temp;
assign fnd1 = fnd1_temp;
assign fnd2 = fnd2_temp;
assign state = { 1'b0, state_temp};


endmodule