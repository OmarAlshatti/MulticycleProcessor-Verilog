module ALU (ALUInSel, ALUIn1, ALUIn2, ALUOut, Zero,shamt,CLK,ALUOutSR);
    input CLK;
	input [3:0] ALUInSel;
	input [31:0] ALUIn1,ALUIn2;
	input [10:6] shamt;
	output reg [31:0] ALUOut,ALUOutSR;
	output [1:0]  Zero;
	assign Zero = (ALUOut == 0);
	always @(*)
	
	 begin

		case (ALUInSel)
			3'b010: ALUOut = ALUIn1 + ALUIn2;
			3'b110: ALUOut = ALUIn1 - ALUIn2;
			3'b000:  ALUOut = ALUIn1 << shamt;
			3'b001: ALUOut = ALUIn2 << ALUIn1;
			3'b111: ALUOut = ALUIn2 >>> ALUIn1;
		endcase
	end
	
	always @(posedge CLK)
	 begin
			ALUOutSR <= ALUOut;
	end

endmodule
        