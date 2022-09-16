module Mux2(RFWA, RFDSel,rt,rd,IRWE);
/*
Mux2 M2(.RFWA(RFWA),.RFDSel(RFDSel),.rt(rt),.rd(rd));
*/
input [1:0] IRWE;
input [4:0] rt,rd;
input [1:0] RFDSel;
output reg [4:0] RFWA;
always @(*)
begin
 case(RFDSel)
 0: RFWA = rt;
 1: RFWA = rd;

 endcase
end
endmodule