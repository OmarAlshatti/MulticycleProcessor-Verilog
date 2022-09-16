module DR(CLK,DR,MRD);
input CLK,MRD;
output reg [31:0] DR;
always @(posedge CLK)
begin
    DR <= MRD;
end
endmodule
