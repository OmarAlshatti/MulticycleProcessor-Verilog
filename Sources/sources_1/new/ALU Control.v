`timescale 1ns / 1ps
/*
ALUCtrl DUT(.ALUInsel(ALUInsel), .ALUOp(ALUOp), .Funct(Funct));
*/

module ALUCtrl(ALUInSel,ALUOp,Funct);
input [5:0] Funct;
input [2:0] ALUOp;
output reg [31:0] ALUInSel;
always @(ALUInSel,ALUOp,Funct)
begin
if(ALUOp==0) ALUInSel <=2;
else if(ALUOp==1) ALUInSel <=6;
else
case(Funct)
32: ALUInSel = 2;
34: ALUInSel = 6;
0: ALUInSel = 0;
4: ALUInSel =1;
7: ALUInSel = 7;
endcase 
end
endmodule 