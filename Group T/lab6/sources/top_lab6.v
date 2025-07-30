`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 10:28:27 PM
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

module top_lab6 (
    input clk,                  
    input [8:0] SW,             
    input BTN0,                 
    output [7:0] LED,           
    output [6:0] SEG,           
    output [2:0] AN  
);

    wire clk_out;
    wire [3:0] ctrl_nibble;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [7:0] result;
    wire [1:0] addsubop = SW[6:5];
    
    clock_divider div (
    .clk(clk),
    .rst_n(BTN0),
    .sel(SW[4:0]),
    .clk_out(clk_out)
    );
    
    bcd_count ones_digit (
    .clk_div(clk_out),
    .rst_n(BTN0),
    .dir(SW[7]),
    .bcd(ones)
    );

    bcd_count tens_digit (
    .clk_div(clk_out),
    .rst_n(BTN0),
    .dir(SW[8]),
    .bcd(tens)
    );
    
    alu addsub(
    .units(ones),
    .tens(tens),
    .operation_select(addsubop),
    .result(result)
    );
    
    control_decoder ctrl (
    .SW(SW[8:5]),
    .ctrl_nibble(ctrl_nibble)
    );
    
    seven_seg_scan disp (
    .clk(clk),
    .ctrl_nibble(ctrl_nibble),
    .result(result),
    .AN(AN),
    .SEG(SEG)
    );

    assign LED[3:0] = ones[3:0];
    assign LED[7:4] = tens[3:0];

endmodule