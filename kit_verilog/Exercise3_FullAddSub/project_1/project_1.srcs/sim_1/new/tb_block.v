`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/23 16:41:02
// Design Name: 
// Module Name: tb_block
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


module tb_block();

reg sub;
reg [3:0] a,b;
wire [3:0] s;
wire cout;

block b0(sub, a,b,s,cout);

initial begin
 for({sub,a,b} = 9'h0; {sub,a,b} < 9'h1ff; {sub, a,b}= {sub,a,b} + 1 ) begin
 
 #10
 if(!sub && (a + b !== s))
    $display("Error: %b + %b = %b expected : %b" , a,b,s,a+b);
 else if (!sub && (a -  b !== s))
   $display("Error: %b - %b = %b expected : %b" , a,b,s,a-b);
  else if(!sub)
    $display("%b(%d) + %b(%d) = %b(%d) overflow: %b" , a,$signed(a) ,b, $signed(b), s , $signed(s), (a[3] && b[3] && ~s[3] || ~a[3] && ~b[3] && s[3]));
   else if(sub)
    $display("%b(%d) + %b(%d) = %b(%d) overflow: %b" , a,$signed(a) ,b, $signed(b), s , $signed(s), (a[3] && ~b[3] && ~s[3] || ~a[3] && b[3] && s[3]));
   
 
 end
end
    


endmodule
