`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 01:24:36 AM
// Design Name: 
// Module Name: DataMem
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


module DataMem(address, writedata, readdata, memread, memwrite, clock);
input memread;
input memwrite;
input clock;
input [31:0] address;
input [31:0] writedata;
output [31:0] readdata;
wire [31:0] resultaddress;
parameter size = 256;
reg [31:0] mem[0 : size-1];
integer i;
assign resultaddress = address >> 2;
initial begin
    for (i = 0; i < size; i = i + 1)
        mem[i]=32'b0;
end
always @(negedge clock)
begin
    if (memwrite == 1'b1)
        mem[resultaddress] = writedata;
end
assign readdata = (memread == 1'b1) ? mem[resultaddress]: 32'b0;
endmodule
