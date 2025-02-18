
module tb_fulladder4();
wire [3:0] SUM;
wire C_OUT;
reg [3:0] A;
reg [3:0] B;
reg C_IN;
fulladder4 m(.sum(SUM),
.c_out(C_OUT),
.a(A),
.b(B),
.c_in(C_IN));
initial
begin
A=4'd0; B=4'd0; C_IN=1'b0;
#5 A=4'd3; B=4'd4;
#5 A=4'd2; B=4'd5;
#5 A=4'd9; B=4'd9;
#5 A=4'd10; B=4'd15;
#5 A=4'd10; B=4'd5; C_IN=1'b1;
end
endmodule
