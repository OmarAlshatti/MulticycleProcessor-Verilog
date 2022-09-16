`timescale 1ns / 1ps

module A1_tb();
reg CLK,RST;

top_module t1(CLK,RST);
initial begin
CLK = 1'b0; 
#10;
 RST = 1'b1;
 #10;
RST =1'b0;
#100;
end
always #10 CLK = ~CLK;
endmodule
