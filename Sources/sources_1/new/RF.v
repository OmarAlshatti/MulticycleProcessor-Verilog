`timescale 1ns / 1ps
/*
RF DUT(.RFRA1(RFRA1), .RFRA2(RFRA2), .CLK(CLK), .RFWA(RFWA), .RFWD(RFWD),.RFRD1(RFRD1),.RFRD2(RFRD2));
*/

module RF(RFRA1, RFRA2,RFWE,CLK,RFWA,RFWD,RFRD1,RFRD2);
input [1:0] RFWE,CLK;
input [31:0] RFWD;
output [31:0] RFRD1,RFRD2;
reg [31:0] RF [0:31];
input [4:0]  RFRA1, RFRA2,RFWA;        // Input Addresses
assign RFRD1 = RF[RFRA1] ;assign RFRD2 = RF[RFRA2] ;
 initial begin
     RF[0]<=0;
     RF[1]<=0;
     RF[2]<=0;
     RF[3]<=0;
     RF[4]<=0;
     RF[5]<=0;
     RF[6]<=0;
     RF[7]<= 0;
     RF[8]<= 0;
     RF[9]<=0;
     RF[10]<=0;
     RF[11]<=0;
     RF[12]<=0;
     RF[13]<=0;
     RF[14]<=0;
     RF[15]<=0;
     RF[16]<=0;
     RF[17]<=0;
     RF[18]<=0;
     RF[19]<=0;
     RF[20]<=0;
     RF[21]<=0;
     RF[22]<=0;
     RF[23]<=0;
     RF[24]<=0;
     RF[25]<=0;
     RF[26]<=0;
     RF[27]<=0;
     RF[28]<=0;
     RF[29]<=0;
     RF[30]<=0;
     RF[31]<=0;
 end
always @(posedge CLK) begin
		if (RFWE == 1)
			RF[RFWA] <= RFWD;
	end

endmodule
