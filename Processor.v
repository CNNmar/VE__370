`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 01:46:46 AM
// Design Name: 
// Module Name: processor
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


module processor(clock);
input clock;
wire [1:0] ALUOp;
wire [3:0] operation;
wire [4:0] WriteReg;
wire [31:0] pcValue;
wire [31:0] newPC;
wire [31:0] instruction32;
wire [31:0] Readdata;//right side of the cpu
wire [31:0] Readdata1;
wire [31:0] Readdata2;
wire [31:0] signExtended;
wire [31:0] WriteData; 
wire [31:0] ALUdown;
wire [31:0] ALUResult;

wire RegDst, Jump, Branch_Bne, Branch_Beq, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, zero;

Control ctrl(instruction32[31:26], RegDst, Branch_Beq, Branch_Bne, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Jump);
Counter ct(clock, newPC, pcValue);
JumpCtrl jpctrl(pcValue, instruction32[25:0], Jump, signExtended, Branch_Beq, Branch_Bne, zero, newPC);
Signextend sextend(instruction32[15:0], signExtended);
ALUCtrl actrl(instruction32[5:0], ALUOp, operation);
Mux5 m1(instruction32[20:16], instruction32[15:11], RegDst, WriteReg);
registerFile regfile(clock, RegWrite, instruction32[25:21], instruction32[20:16], WriteReg, WriteData, Readdata1, Readdata2);
Mux32 m2(Readdata2,signExtended,ALUSrc, ALUdown);
ALU a(operation, Readdata1, ALUdown, ALUResult, zero);
DataMem dtmem(ALUResult, Readdata2, Readdata, MemRead, MemWrite, clock);
Mux32 m3(ALUResult, Readdata, MemtoReg, WriteData);
InstructionMemory itmem(pcValue, instruction32);

always @ (negedge clock) begin
$display("input1 = %h, input2 = %h, ALUSrc = %h, Readdata2 = %h, Readreg2 = %h, RegWrite = %h, WriteReg = %h, WriteData = %h,MemtoReg = %h， Readdata = %h,ALUResult = %h ", Readdata1, ALUdown, ALUSrc, Readdata2, instruction32[20:16], RegWrite, WriteReg, WriteData, MemtoReg,Readdata,ALUResult);
end



endmodule
