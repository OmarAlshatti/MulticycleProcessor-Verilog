`timescale 1ns / 1ps

module RF_reg(RFRD1,RFRD2,A,B,CLK);
    input CLK;
    input [31:0] RFRD1,RFRD2;
    output reg [31:0] A,B;
	always @(posedge CLK)
	 begin
			A <= RFRD1;
			B <= RFRD2;
	end
endmodule
