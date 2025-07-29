`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 05:42:41 PM
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
    input [8:0] SW,
    input clk,
    input btn0,
    output [6:0] SEG,
    output [7:0] LED,
    output [7:0] AN
    );
    
    wire clk_div;
    wire [3:0] ones_digit, tens_digit, ctrl_nibble;
    wire rollover_ones, rollover_tens;
    wire [7:0] result;
    
    //instantiates clock_divder which contains both the clock divison and mux
    clock_divider clock(.clk(clk), .rst(btn0), .speed_sel(SW[4:0]), .clk_out(clk_div));

    //instatiates bcd_counter which are single digit binary coded decimal counters for each digit
    bcd_counter ones_counter(.clk(clk_div), .btn0(btn0), .dir(SW[7]), .digit(ones_digit), .rollover(rollover_ones));
    bcd_counter tens_counter(.clk(clk_div), .btn0(btn0), .dir(SW[8]), .digit(tens_digit), .rollover(rollover_tens));

    //instantiates the arithmetic logic unit which handles addition and subtraction 
    //control as well as result mapping and underflow (0 to 18)
    alu alu_unit(.a(tens_digit), .b(ones_digit), .control(SW[6:5]), .result(result));
    
    //instantiates control_decoder to display the control settings on the left most 7-segment display
    control_decoder ctrl_dec(.ctrl_in({SW[8], SW[7], SW[6], SW[5]}), .ctrl_out(ctrl_nibble));
    
    //instantiates seg7_scan display the result of the ALU operation on the 7-segment displays
    seg7_scan scan_inst(.clk(clk), .rst(btn0), .bits(result), .control(ctrl_nibble), .SEG(SEG), .AN(AN));
    
    //binds the value of the LEDs to each value imported to the ALU for debugging
    assign LED = {tens_digit[3:0], ones_digit[3:0]};
    
endmodule
