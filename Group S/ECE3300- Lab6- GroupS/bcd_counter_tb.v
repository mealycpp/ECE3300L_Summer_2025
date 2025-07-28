`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 04:01:49 AM
// Design Name: 
// Module Name: bcd_counter_tb
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


module tb_bcd_counter;

    reg clk_div = 0;
    reg BTN0 = 0;
    reg dir_bit;
    wire [3:0] BCD;

    bcd_counter dut (
        .clk_div(clk_div),
        .BTN0(BTN0),
        .dir_bit(dir_bit),
        .BCD(BCD)
    );
    
    always #5 clk_div = ~clk_div;
    
    initial begin
    #10 BTN0 = 1;
    dir_bit = 1;//count up
    #50
    #10 BTN0 = 0;//reset BCD
    #100 BTN0 = 1;//restart counting up
    #100
    dir_bit = 0;//count down
    #1_000_000
    $finish;
    end
endmodule
