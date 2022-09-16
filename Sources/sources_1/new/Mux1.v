
module Mux1(IDSel,PCOut,ALUOut,Adr);
/*
Mux1 M1(.RFRD2(RFRD2),.ALUInSel(ALUInSel),.extended(extended),.B(B));
*/
input [1:0] IDSel;
input [31:0] PCOut, ALUOut;
output reg [31:0] Adr;
always @(*)
begin
 case(IDSel)
 0: Adr = PCOut;
 1: Adr = ALUOut+20;
 endcase
end
endmodule