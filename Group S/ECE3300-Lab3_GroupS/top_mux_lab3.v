`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 05:40:38 PM
// Design Name: 
// Module Name: top_mux_lab3
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


module top_mux_lab3 (
input clk,
input rst,
input [15:0] SW,
input btnU, btnD, btnL, btnR,
output LED0
);
wire [3:0] sel; // select lines
// Toggle switches to control each bit of the select line using pushbuttons
toggle_switch t0 (.clk(clk), .rst(rst), .btn_raw(btnD), .state(sel[0])); 
toggle_switch t1 (.clk(clk), .rst(rst), .btn_raw(btnR), .state(sel[1]));
toggle_switch t2 (.clk(clk), .rst(rst), .btn_raw(btnL), .state(sel[2]));
toggle_switch t3 (.clk(clk), .rst(rst), .btn_raw(btnU), .state(sel[3]));
// 16x1 multiplexer: selects one of the 16 switches based on sel value
mux16x1 mux (.in(SW), .sel(sel), .out(LED0));
endmodule
