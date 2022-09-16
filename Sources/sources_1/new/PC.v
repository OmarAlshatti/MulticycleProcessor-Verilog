`timescale 1ns / 1ps

/*
DM DUT(.CLK(CLK), .RST(RST), .DMA(DMA), .PCin(PCin), .PCout(PCout));
*/

module PC(CLK,RST,ALUOut,PCOut,PCEn,Jaddr,jump);
input CLK,RST;
input [1:0] PCEn,jump;
input [31:0]ALUOut;
input [25:0] Jaddr;


output reg signed [31:0] PCOut;
always @(posedge  CLK)
begin
if(RST) PCOut <=0;
else if(jump) PCOut <= {PCOut[31:26],Jaddr};
else if(PCEn)
PCOut <= ALUOut;
end
endmodule
