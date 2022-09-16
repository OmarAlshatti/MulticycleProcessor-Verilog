module IR(CLK,IR,MRD,IRWE);
input [1:0] CLK,IRWE;
input [31:0] MRD;
output reg signed [31:0] IR;
always @(posedge CLK)
begin
if(IRWE==1)begin
    IR <= MRD; end
end
endmodule
