`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/23 16:34:08
// Design Name: 
// Module Name: block
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module block(
input sub, 
input [3:0] a,
b,
output[3:0] s,
output cout
    );

wire [3:0] s;
wire [3:0] bin;
wire [3:0] c;

assign bin = {b[3]^sub, b[2]^sub, b[1]^sub , b[0]^sub};

full_adder u0[3:0](.a(a), .b(b), .cin({c[3],c[2],c[1]}), .cout({cout, c[3], c[2], c[1]}), .s(s));




endmodule


module full_adder( 
input a, 
input b, 
input cin, 
output cout, 
output s);

wire s1,s2,c1;


xor( s1, a, b);
and(c1 , a,b);
xor(s,s1,c1);
and(s2,s1,cin);
xor(cout, s2,c1);

endmodule




