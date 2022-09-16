`timescale 1ns / 1ps


module zero_and(Branch, Zero,PCbranch);
    input [1:0] Branch, Zero;
    output reg [1:0] PCbranch;
    always @(*)
    begin
    if(Zero && Branch) PCbranch =1;
    else
    PCbranch = 0;
    end
endmodule
