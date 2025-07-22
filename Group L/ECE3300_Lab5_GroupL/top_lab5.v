`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 06:23:57 PM
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
    input [4:0] sw,
    input btn0, // This is the reset    
    input btn1,    
    output [6:0] seg,
    output [7:0] an,
    output [12:0] led
);
    wire [31:0] count;
    wire clk_div;
    wire [3:0] units, tens;

    assign led[4:0] = sw;
    assign led[8:5] = units;
    assign led[12:9] = tens;

    clock_divider CD (
        .clk(clk),
        .rst(btn0),     
        .count(count)
    );

    mux32x1 MUX (
        .count(count),
        .sel(sw),
        .clk_out(clk_div)
    );

    bcd_up_down_counter COUNTER (
        .clk(clk_div),
        .rst_n(btn0),    
        .dir(btn1),      
        .units(units),
        .tens(tens)
    );

    seg7_scan DISPLAY (
        .clk(clk),
        .digit0(units),
        .digit1(tens),
        .seg(seg),
        .an(an)
    );
endmodule