`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2025 08:09:13 PM
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

module seg7_driver_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg [15:0] SW;

    wire [6:0] Cnode;
    wire dp;
    wire [15:0] LED;
    wire [7:0] AN;

    seg7_driver uut (
        .clk(clk),
        .rst_n(rst_n),
        .SW(SW),
        .Cnode(Cnode),
        .dp(dp),
        .LED(LED),
        .AN(AN)
    );

    initial clk = 0;
    always #5 clk = ~clk;  

    initial begin
        // Initialize inputs
        rst_n = 0;
        SW = 16'hD598; // Example value

        // Apply reset
        #100;
        rst_n = 1;

        #1_000_000;

        $finish;
    end

endmodule



