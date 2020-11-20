`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 01:48:50 AM
// Design Name: 
// Module Name: Signextend
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


module Signextend (in16, out32);
input [15:0] in16;
output [31:0] out32;
assign out32 = (in16[15] == 1'b1)?{16'b1, in16}:{16'b0, in16};
    
endmodule
