`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:33:44 AM
// Design Name: 
// Module Name: top_lab6
// Project Name: top_lab6
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
    input clk,
    input rst_n,
    input [8:0] SW,     
    output [6:0] seg,
    output [7:0] an,
    output [7:0] LED    
);

    wire [31:0] cnt;
    wire clk_div;
    wire [3:0] units, tens, ctrl_nibble;
    wire [7:0] result;

    clock_divider U0 (.clk(clk), .rst_n(rst_n), .cnt(cnt));
    mux32x1 U1 (.cnt(cnt), .sel(SW[4:0]), .clk_out(clk_div));

    bcd_counter U2 (.clk(clk_div), .rst_n(rst_n), .dir(SW[7]), .BCD(units));
    bcd_counter U3 (.clk(clk_div), .rst_n(rst_n), .dir(SW[8]), .BCD(tens));

    alu U4 (.A(units), .B(tens), .ctrl(SW[6:5]), .result(result));

    control_decoder U5 (.ctrl_in(SW[8:5]), .ctrl_out(ctrl_nibble));

    wire [7:0] abs_result;
    wire [3:0] alu_units;
    wire [3:0] alu_tens;

    assign abs_result = (alu_result[7]) ? (~alu_result + 1) : alu_result;

    assign alu_tens  = (abs_result / 10) % 10;
    assign alu_units = abs_result % 10;
    
    seg7_scan U6 (
        .clk(clk), .rst_n(rst_n),
        .digit0(result[3:0]),
        .digit1(result[7:4]),
        .digit2(ctrl_nibble),
        .seg(seg), .an(an)
    );

    assign LED = {tens_bcd, unit_bcd};
endmodule
