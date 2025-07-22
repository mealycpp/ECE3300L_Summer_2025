`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 03:32:23 PM
// Design Name: 
// Module Name: top_lab5
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

module top_lab5(
    input clk,
    input rst_n,
    input [4:0] SW,
    input sel,
    output [7:0] AN,
    output [6:0] SEG,
    output [4:0] LED,
    output dp
    );
    
    wire [31:0] count;
    wire clk_out;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [7:0] bits;
    wire dir;
    wire rollover;
    assign LED = SW;
    assign bits[7:0] = {tens[3:0],ones[3:0]};
      
        toggle_switch dir_toggle (.clk(clk), .rst(rst_n), .btn_raw(sel), .state(dir));
        
        clock_divider clock (.clk(clk), .rst_n(rst_n), .count(count));
        
        mux32x1 mux32 (.sel(SW), .count(count), .clk_out(clk_out));    
        
        bcd_up_down_counter one (.clk_div(clk_out), .dir(dir), .rst_n(rst_n), .digit(ones), .rollover(rollover));
        bcd_up_down_counter ten (.clk_div(rollover), .dir(dir), .rst_n(rst_n), .digit(tens));        
        
        
        seg7_driver seg7_driver (.clk(clk), .rst_n(rst_n), .bits(bits), .Cnode(SEG), .AN(AN), .dp(dp));
    
endmodule

