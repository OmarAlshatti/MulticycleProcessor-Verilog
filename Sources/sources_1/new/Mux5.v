module Mux5(ALUIn2Sel,B,extended,ALUIn2);
input [31:0] B,extended;
input [2:0] ALUIn2Sel;
output reg [31:0] ALUIn2;
always @(*)
begin
case(ALUIn2Sel)
0: ALUIn2 = B;
1: ALUIn2 = 1;
2: ALUIn2 = extended;
endcase 
end
endmodule