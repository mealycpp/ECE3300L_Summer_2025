`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 02:56:41 PM
// Design Name: 
// Module Name: seg7_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module seg7_tb;

reg [9:0] SW;
reg rst_n, clk;
wire [31:0] bits;
wire [6:0] Cnode;
wire dp;
wire [7:0] AN;

seg7_select uut (
.clk(clk),
.rst_n(rst_n),
.SW(SW),
.Cnode(Cnode),
.dp(dp),
.AN(AN),
.bits(bits)
);

initial begin 
clk = 0; 
forever #2 clk = ~clk; //toggles ever 10s 20ns period
end

initial begin 
rst_n = 1;
SW = 0;

#1; // waits 4 ns
rst_n = 0; //deasert reset
if (rst_n == 0) begin
#1;
$display("Reset test pass");
end

#1;
//SW = 32'hDEAD_BEEF; // common hex random tests for a - f
SW=10'h0EF; #1; $display("Bits set as %h, expected 0000_00EF", bits);
SW=10'h1BE; #1; $display("Bits set as %h, expected 0000_BE00", bits);
SW=10'h2AD; #1; $display("Bits set as %h, expected 00AD_0000", bits);
SW=10'h3DE; #1; $display("Bits set as %h, expected DE00_0000", bits); 

//SW = 32'h0123_4567; // tests 1-7
SW=10'h067; #1; $display("Bits set as %h, expected 0000_0067", bits);
SW=10'h145; #1; $display("Bits set as %h, expected 0000_4500", bits);
SW=10'h223; #1; $display("Bits set as %h, expected 0023_0000", bits);
SW=10'h301; #1; $display("Bits set as %h, expected 0100_0000", bits);
 
//SW = 32'hFFFF_FFFF; // all fs and max nibble test
SW=10'h0FF; #1; $display("Bits set as %h, expected 0000_00FF", bits);
SW=10'h1FF; #1; $display("Bits set as %h, expected 0000_FF00", bits);
SW=10'h2FF; #1; $display("Bits set as %h, expected 00FF_0000", bits);
SW=10'h3FF; #1; $display("Bits set as %h, expected FF00_0000", bits);

//SW = 32'h0000_0000; // all 0 test
SW=10'h000; #1; $display("Bits set as %h, expected 0000_0000", bits);
SW=10'h100; #1; $display("Bits set as %h, expected 0000_0000", bits);
SW=10'h200; #1; $display("Bits set as %h, expected 0000_0000", bits);
SW=10'h300; #1; $display("Bits set as %h, expected 0000_0000", bits);

#1; //wait
$finish;
end
endmodule