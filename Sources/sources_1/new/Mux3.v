module Mux3(MRD, ALUOut, MtoRFSel,RFWD);
/*
Mux3 M3(.DMRD(DMRD),.C(C),.MtoRFSel(MtoRFSel),.RFWD(RFWD));
*/
input [1:0] MtoRFSel;
input wire [31:0] MRD, ALUOut;
output reg [31:0] RFWD;
always @(*)
begin
 case(MtoRFSel)
 0: RFWD = ALUOut;
 1: RFWD = MRD;
 endcase
end
endmodule