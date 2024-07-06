`timescale 1ns/100ps

module tb_mul4();
reg [3:0] A,B;
wire [7:0] R;

mul4 mm(.a(A), .b(B), .p(R));
integer i,j;
initial begin

for(i=0;i<8;i=i+1) begin
	A=i;
	for(j=0; j<8; j=j+1) begin
	B=j;
 	#2 $display (" %d * %d = %d", A,B,R);
				end
		end
#10 $stop;
end

endmodule
