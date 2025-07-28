`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:58:18 PM
// Design Name: 
// Module Name: tb_seg7_scan
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


module tb_seg7_scan();
    reg clk = 0;
    reg BTN0 = 1;
    reg [7:0] result = 8'h45;
    reg [3:0] ctrl_nibble = 4'hA;
    wire [2:0] AN;
    wire [6:0] SEG;

    seg7_scan uut (
        .clk(clk),
        .BTN0(BTN0),
        .result(result),
        .ctrl_nibble(ctrl_nibble),
        .AN(AN),
        .SEG(SEG)
    );

    always #5 clk = ~clk;

    initial begin
        BTN0 = 0; #10; BTN0 = 1;
        #500;
        result = 8'h1F;
        ctrl_nibble = 4'hF;
        #500;
        $stop;
    end
endmodule
