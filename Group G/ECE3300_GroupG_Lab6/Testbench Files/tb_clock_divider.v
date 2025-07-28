`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:57:42 PM
// Design Name: 
// Module Name: tb_clock_divider
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



module tb_clock_divider();
    reg clk = 0;
    reg [4:0] SW = 5'd3;
    wire clk_div;

    clock_divider uut (.clk(clk), .SW(SW), .clk_div(clk_div));

    always #5 clk = ~clk; // 100MHz simulation clock

    initial begin
        SW = 5'd0; #100;
        SW = 5'd4; #100;
        $stop;
    end
endmodule