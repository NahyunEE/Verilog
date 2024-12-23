`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/23 14:48:10
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
  a,
   b,
   y
    );
 input [3:0]  a;
  input [3:0]   b;
  output [3:0]   y;

wire a;
wire b;
wire y;

assign y =  ~ (a | b);
   

endmodule
