`timescale 1ns / 1ps
/*
DM DUT(.CLK(CLK), .DMWE(DMWE), .DMA(DMA), .DMRD(DMRD), .DMWD(DMWD));
*/

module DM(CLK,MWE,MRA,MRD,MWD,IRWE,IR);
input CLK;
input [1:0] MWE,IRWE;
input [8:0] MRA;
input [31:0] MWD;
output reg [31:0] MRD,IR;
reg[31:0] MEM[0:511];
initial begin
    $readmemh("New Text Document.mem",MEM);
    MEM[20] = 17;
    MEM[21] = 31;
    MEM[22] = -5;
    MEM[23] = -2;
    MEM[24] = 250;
end
always @(posedge CLK)
begin
if(MWE) MEM[MRA] <= MWD;
end

always  @(posedge CLK)
begin
MRD <= MEM[MRA];
end

always @(*)
begin
if(IRWE==1)
    IR <= MRD; 
    
end
endmodule

