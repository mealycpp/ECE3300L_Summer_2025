`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Kevin Tang and Jared Mocling
// 
// Create Date: 07/02/2025 04:31:20 PM
// Design Name: Lab 3: 16x1 Multiplexer Using Nested 2x1 MUXes with Debounced Toggle Select Control
// Module Name: top_mux_lab3
// Project Name:  ECE 3300 Lab 3
// Target Devices: NEXYS A7-100T FPGA
// Tool Versions: Vivado 2025.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_mux_lab3 (
    input clk,
    input rst,
    input [15:0] SW,
    input btnU, btnD, btnL, btnR,
    output LED0
);
    wire [3:0] sel;
    
    toggle_switch t0 (.clk(clk), .rst(rst), .btn_raw(btnD), .state(sel[0]));
    toggle_switch t1 (.clk(clk), .rst(rst), .btn_raw(btnR), .state(sel[1]));
    toggle_switch t2 (.clk(clk), .rst(rst), .btn_raw(btnL), .state(sel[2]));
    toggle_switch t3 (.clk(clk), .rst(rst), .btn_raw(btnU), .state(sel[3]));
    
    mux16x1 mux (.in(SW), .sel(sel), .out(LED0));
endmodule



