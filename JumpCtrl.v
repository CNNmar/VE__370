`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 01:27:43 AM
// Design Name: 
// Module Name: JumpCtrl
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


module JumpCtrl(pc, instruction26, jump, extended, branch_beq, branch_bne, zero, newpc);
input [31:0] pc;
input [25:0] instruction26;
input jump;
input [31:0] extended;
input branch_beq;
input branch_bne;
input zero;
output reg [31:0] newpc;

reg [31:0] normalpc;
reg [31:0] jumpaddress;
reg [31:0] branchaddress;
reg [31:0] Notjumppc;

always @(pc or instruction26 or jump or extended or branch_beq or branch_bne or zero)
begin
    normalpc = pc + 4;
    jumpaddress = {normalpc[31:28], instruction26[25:0], 2'b00};
    branchaddress = {extended[29:0], 2'b00} + pc + 4;
    if (branch_bne == 0 && branch_beq == 0)
        Notjumppc = normalpc;
    if (branch_bne == 1 && branch_beq == 0)
        if (zero == 1'b0)
            Notjumppc = branchaddress;
        else
            Notjumppc = normalpc;
    if (branch_bne == 0 && branch_beq == 1)
        if (zero == 1'b0)
            Notjumppc = normalpc;
        else
            Notjumppc = branchaddress;
    assign newpc = (jump == 1'b1) ? jumpaddress : Notjumppc;
end
endmodule
