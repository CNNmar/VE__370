`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 01:12:07 AM
// Design Name: 
// Module Name: ALUCtrl
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

module ALUCtrl(funct, ALUOp, ALUctrl);
    input  [5:0] funct;
    input  [1:0] ALUOp;
    output [3:0] ALUctrl;
    reg  [3:0] ALUctrl;
    always @ (funct or ALUOp) 
    begin
        case (ALUOp)
        2'b00: ALUctrl = 4'b0010;
        2'b01: ALUctrl = 4'b0110;
        2'b10: 
        begin
            case (funct)
            6'b100000: ALUctrl = 4'b0010;
            6'b100010: ALUctrl = 4'b0110;
            6'b100100: ALUctrl = 4'b0000;
            6'b100101: ALUctrl = 4'b0001;
            6'b101010: ALUctrl = 4'b0111;
            endcase
        end
        2'b11: ALUctrl = 4'b0000;
        endcase
    end
endmodule
// funct is the [5:0] of instruction
