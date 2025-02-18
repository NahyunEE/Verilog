module mul4( mulplier, mulcand,start, clk, a,counter,st);

input [3:0] mulplier;
input [3:0] mulcand;
output [7:0] a;
input start;
input clk;
output reg [1:0]counter;
input st;

//middle term
reg [4:0] A; //A register
reg [4:0] Q; // Q register
reg [4:0] M; //M register;
reg state;
reg [4:0] C;
reg [4:0] D;
reg [7:0] result;
//reg [1:0] counter;

assign state = st;
always@(posedge clk)
begin
//state<=1'b0;
	case(state)
		0: begin
		 	if( start ==1'b1) begin
			A<=5'b00000;
			Q<={1'b0, mulplier};
			M<={1'b0, mulcand};
			state<=1'b1;
			counter<=0;
  			//result <=8'b00000000;
			end
		else
		state <= 1'b0;
		end
	
		1: begin
			if( Q[0] == 0)
			begin
			C <= A >>1;
  			A<= {1'b0, C};
			
			Q<= 1'b1 + (Q>>1);
			D<= 
			counter<= counter +1;
			end
 			else if( Q[0] ==1)
			begin
                         


			//A =(A+{1'b0+M)};
			A<=1'b0+((A+(1'b0+M)>>1));
			Q<=1'b1+(Q>>1);
			counter<=counter+1;
			end
			else if(counter == 3 )
			begin
			result [7:4] <=A[3:0];
			result [3:0] <=Q[3:0];
			//A<=5'b00000;
			//Q<=5'b00000;
			//state<=1'b0;
			end
			
		end
	endcase
end

assign a = result;
endmodule


		
		
		
		

		
		


