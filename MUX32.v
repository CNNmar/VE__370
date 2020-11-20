`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 01:45:28 AM
// Design Name: 
// Module Name: Mux32
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


module Mux32(in1, in2, control, out);
input [31:0] in1;
input [31:0] in2;
input control;
output [31:0] out;
assign out = (control == 1'b0) ? in1 : in2;
endmodule
