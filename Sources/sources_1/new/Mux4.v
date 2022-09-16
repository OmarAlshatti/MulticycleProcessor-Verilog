module mux4(ALUIn1Sel,A,PCOut,ALUIn1);
input [31:0] A,PCOut;
input [1:0] ALUIn1Sel;
output reg [31:0] ALUIn1;
always @(*)
begin
case(ALUIn1Sel)
0: ALUIn1 = PCOut;
1: ALUIn1 = A;
endcase 
end
endmodule