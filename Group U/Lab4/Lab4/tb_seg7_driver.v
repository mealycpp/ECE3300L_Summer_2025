`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2025 08:01:41 PM
// Design Name: 
// Module Name: tb_seg7_driver
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

`timescale 1ns / 1ps

module tb_seg7_driver;

reg clk;
reg rst_n;
reg [15:0] SW;
wire [6:0] Cnode;
wire dp;
wire [7:0] AN;

seg7_driver tb (
    .clk(clk),
    .rst_n(rst_n),
    .SW(SW),
    .Cnode(Cnode),
    .dp(dp),
    .AN(AN)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst_n = 0;
    SW = 32'h12345678;
    #20 rst_n = 1;
end

endmodule