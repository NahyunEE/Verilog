module mul4(
din_q,
din_m,
d_out,
clk,
rst_n, start);
input clk,rst_n;
input start;
input[3:0] din_q,din_m;
output reg [7:0] d_out;

reg[3:0] m0,m1,m2,m3;
reg [3:0] s1,s2,s3;
//,s3




always@(posedge clk) begin

if(rst_n) begin
if(start) begin

 	m0<={4{din_q[0]}} & din_m[3:0];
 	m1<={4{din_q[1]}}& din_m[3:0];
 	m2<={4{din_q[2]}}& din_m[3:0];
 	m3<={4{din_q[3]}}& din_m[3:0];

	s1 <= m0+ (m1<<1);
	s2 <= s1+ (m2<<2);
	d_out<= s2+ (m3 <<3);
end
end
end

//always@(s3) begin
//d_out

//assign d_out=s3;


endmodule
