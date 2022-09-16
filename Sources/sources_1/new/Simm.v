`timescale 1ns / 1ps
/*
DM DUT(.unextended(unextended), .DMWE(DMWE), .extended(extended));
*/

module Simm(unextended,extended);
input signed [15:0] unextended;
output reg [31:0] extended;
always @(*)
begin
extended = { {16{unextended[15]}}, unextended};
end
endmodule