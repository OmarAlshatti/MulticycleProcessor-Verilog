`timescale 1ns / 1ps
/*
DM DUT(.Opcode(Opcode), .RFWE(RFWE), .RFDSel(RFDSel), .ALUInSel(ALUInSel), .Branch(Branch),. DMWE(DMWE),. MtoRFsel(MtoRFsel),.ALUOp(ALUOp));
*/

module control_unit(Opcode,RFWE,Branch,MWE,MtoRFSel,ALUOp,RST,CLK,IDSel,PCSel,ALUIn1Sel,ALUIn2Sel,IRWE,jump,RFDSel,PCWE);

input [5:0] Opcode;
input RST,CLK; 
reg [31:0] state, next;
output reg [1:0] jump, MtoRFSel,MWE,Branch,RFDSel,RFWE,IDSel,ALUIn1Sel,IRWE,PCWE;

output reg [2:0] ALUOp,PCSel,ALUIn2Sel;
always @(posedge CLK)
begin
if(RST)begin
state = 0; end
else begin
state = next; end

if(state ==0)begin IDSel <= 0; ALUIn1Sel<=0; ALUIn2Sel <=1;ALUOp<=0;PCSel<=0; IRWE <=1;PCWE<=1; MWE<=0; RFWE<=0; jump<=0; next <= 1; Branch <=0; end
else if (state==1) begin PCWE <=0;IRWE <=0; if(Opcode==2)begin jump<=1; next<=0; end else next <= 2; end
else if (state==2) begin ALUIn1Sel<=1;ALUIn2Sel<=2; ALUOp <=0; if(Opcode == 35)  next <= 3; else if(Opcode ==43) next <=5; else if (Opcode==0) next<=6; else if(Opcode==8) next <= 10; else if (Opcode==4)next <=8; else next<=9 ;end
else if (state==3) begin IDSel<=1; next <= 4; end
else if (state==4) begin RFDSel<=0;MtoRFSel<=1;RFWE<=1; next <= 0; end
else if(state==5) begin IDSel =1; MWE =1; next <=0; end
else if(state==6) begin ALUIn1Sel<=1; ALUIn2Sel <=0;ALUOp<=2; next <=7; end
else if(state==7) begin RFWE =1; RFDSel =1; MtoRFSel<=0; next <=0; end
else if(state==8) begin ALUIn1Sel<=1; ALUIn2Sel<=0;ALUOp<=1;PCSel<=1; Branch<=1; next <=0; end
else if(state==9) begin PCSel<=2;PCWE<=1;jump<=1; IRWE<=1; next<=0;end
else if(state==10) begin ALUIn1Sel<=1; ALUIn2Sel <=2;ALUOp<=0; next <=11; end
else if(state==11) begin RFWE =1; RFDSel =0; MtoRFSel<=0; next <=0; end
end

endmodule 