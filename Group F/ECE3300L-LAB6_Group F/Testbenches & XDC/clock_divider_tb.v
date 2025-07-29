`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:50:14 PM
// Design Name: 
// Module Name: clock_divider_tb
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


module clock_divider_tb(
    );
    
    reg clk;
    reg rst_n;
    wire [31:0] count;
    
    
    clock_divider uut (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );

    initial clk = 0;
    always #10 clk = ~clk; 

    initial begin
        rst_n = 0; #20;
        rst_n = 1; #20;
        #500;
        $finish;
    end
endmodule
