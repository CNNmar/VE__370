`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 01:11:48 AM
// Design Name: 
// Module Name: ALU
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


module ALU(operation, a, b, result, zero);

input [31:0] a;
input [31:0] b;
input [3:0] operation;
output reg [31:0] result;
output zero;

always @(operation or a or b)

begin
    case (operation)
    
    4'b0010: result = a + b;
    4'b0110: result = a - b;
    4'b0000: result = a & b; 
    4'b0111: result = (a < b)? 1:0;
    4'b0001: result = a | b;
    default: result = 32'b0;
    endcase
end
    assign zero = (result == 32'b0);
endmodule
