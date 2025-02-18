`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/23 15:56:23
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
input [3:0] binary_in,
output [3:0] binary_out,
output [3:0] grey_out,
input [3:0] grey_in
  );
  
 
 assign grey_out[0] = binary_in[0] ^ binary_in[1];
 assign grey_out[1] = binary_in[1] ^ binary_in[2];
 assign grey_out[2] = binary_in[2] ^ binary_in[3];
 assign grey_out[3] = binary_in[3];

 assign binary_out[0] = grey_in[0] ^ binary_out[1];
 assign binary_out[1] = grey_in[1] ^ binary_out[2];
 assign binary_out[2] = grey_in[2] ^ binary_out[3]; 
 assign binary_out[3] = grey_in[3];
 
  
    
endmodule
