`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 04:28:57 AM
// Design Name: 
// Module Name: top_lab6
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


module top_lab6(
    input clk, rst_n,
    input [8:0] SW,
    output [7:0] AN,
    output [6:0] Cnode,
    output [7:0] LED
    );
    
    wire clk_out;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [7:0] result;
    wire [3:0] nibble;
    
    clock_divider div(.clk(clk), .rst_n(!rst_n), .SW(SW[4:0]), .clk_out(clk_out));
    bcd_counter onesPlace(.clk_div(clk_out), .rst_n(!rst_n), .dir_bit(SW[7]), .value(ones));
    bcd_counter tensPlace(.clk_div(clk_out), .rst_n(!rst_n), .dir_bit(SW[8]), .value(tens));
    alu alu(.units_BCD(ones), .tens_BCD(tens), .ctrl(SW[6:5]), .result(result));
    control_decoder dec(.SW5(SW[5]), .SW6(SW[6]), .SW7(SW[7]), .SW8(SW[8]), .nibble(nibble));
    seg7_scan translate_to_dislay(.clk(clk), .result(result), .input_nibble(nibble), .AN(AN), .Cnode(Cnode));
    
    assign LED = {tens, ones};
   
endmodule
