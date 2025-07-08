`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 01:23:22 PM
// Design Name: 
// Module Name: seg7_driver_tb
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

module seg7_driver_tb();

reg clk, rst_n;
reg [15:0] SW;
wire [6:0] Cnode;
wire dp;
wire [7:0] AN;
seg7_driver test (
                .clk(clk),
                .SW(SW),
                .rst_n(rst_n),
                .Cnode(Cnode),
                .dp(dp),
                .AN(AN)
                 );

always begin
 #5 clk = ~clk;
end
initial begin
SW = 32'h0000_A867;
clk = 0;
rst_n = 0;        // assert
#20 rst_n = 1;    // release
#10_000_000 $finish;
 end 
endmodule
