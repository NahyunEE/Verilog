module tb_fulladder16();
wire [15:0] SUM;
wire C_OUT;
reg [15:0] A;
reg [15:0] B;
reg C_IN;
fulladder16 m(.sum(SUM),
.c_out(C_OUT),
.a(A),
.b(B),
.c_in(C_IN));
initial
begin
A=16'd0; B=16'd0; C_IN=1'b0;
#5 A=16'd3; B=16'd4;
#5 A=16'd2; B=16'd5;
#5 A=16'd4; B=16'd5;
#5 A=16'd10; B=16'd15;
#5 A=16'd100; B=16'd575;
#5 A=16'd133; B=16'd463;
#5 A=16'd243; B=16'd574;
#5 A=16'd422; B=16'd5673;
#5 A=16'd1056; B=16'd1456;
#5 A=16'd1057; B=16'd7677; C_IN=1'b1;
end
endmodule
