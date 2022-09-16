`timescale 1ns / 1ps

module ORgate(PCEn,PCWE,PCbranch);
input PCbranch,PCWE;
output reg [1:0] PCEn;
 always @(*)
    begin
    if(PCbranch || PCWE) PCEn =1;
    else
    PCEn = 0;
    end
endmodule
