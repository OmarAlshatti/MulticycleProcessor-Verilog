module Mux6(ALUOut,ALUOutR,Jaddr,PCSel,ALUOutSR);
input [31:0] ALUOut,Jaddr,PCSel,ALUOutSR;
output reg [31:0] ALUOutR;
always @(*)
begin
case(PCSel)
0: ALUOutR = ALUOut;
1: ALUOutR = ALUOutSR;
2: ALUOutR = {ALUOutR[31:26],Jaddr};
endcase 
end
endmodule