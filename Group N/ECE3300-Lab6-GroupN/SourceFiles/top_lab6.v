`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California State Polytechnic University Pomona
// Engineer: Student Daniel and Student Kobe
// 
// Design Name: 
// Module Name: 
// Project Name:
// Target Devices: ARTIX - 7 Family
// Tool Versions: Vivado 2025.1
// Description: 
// 
// Dependencies: 
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: This has been designed by Daniel Mondragon and Student Kobe
//////////////////////////////////////////////////////////////////////////////////


module top_lab6(
    input CLK, 
    input rst_n, //BTN0 in the XDC file, the !rst_n input will make the button ACTIVE-LOW reset
    
    // SW[4:0] controls the speed (0 = slowest ... 31 = fastest)
    // SW[6:5] controls the ALU bits (00=add, 01=sub)
    //SW[8:7] controls the counter direction (1=up, 0=down)
    input [8:0] SW, 
    
    // LED[7:4] tens counter BCD for debug 
    // LED[3:0] is for units counder BCD for debug
    output [7:0] LED, 
    output [6:0] SEG, // for the segments
    output DP, // decimal point
    output [7:0] AN //only have 3 displays showing so AN [2:0], 1 bit for each display
    
    );
    wire clk_out;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire [7:0] finalResult;
    wire [3:0] ctrl_nibble;
    wire [11:0] bits;
    assign bits[11:0] = { ctrl_nibble[3:0], finalResult[7:0] };
    assign LED = {digit1[3:0], digit0[3:0]};
     
    clock_divider clk1 ( .clockIn(CLK), .sel(SW[4:0]), .rst_n(!rst_n), .clk_div(clk_out) );
    
    bcd_counter units ( .clk_div(clk_out), .rst_n(!rst_n), .dir_bit(SW[7]), .digit(digit0) );
    bcd_counter tens ( .clk_div(clk_out), .rst_n(!rst_n), .dir_bit(SW[8]), .digit(digit1) );
    
    alu addOrSubtract ( .A(digit0), .B(digit1), .ctrl(SW[6:5]), .result(finalResult) );
    
    control_decoder control ( .controlSW(SW[8:5]), .ctrl_nibble(ctrl_nibble) );
    
    seg7_scan display ( .CLK(CLK), .rst_n(!rst_n), .bits(bits), .SEG(SEG), .AN(AN), .DP(DP) );
    
    
endmodule
