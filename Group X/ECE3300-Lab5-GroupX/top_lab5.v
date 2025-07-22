`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 04:50:15 PM
// Design Name: 
// Module Name: asdf
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
    input wire clk,
    input wire [4:0] SW,
    input wire rst, // reset 
    input wire btnU, // dir
    output wire [4:0] LED_SW,
    output wire [7:0] LED_BCD,
    output wire [6:0] seg,
    output wire [7:0] an
);
    wire rst_n = ~rst;
    wire dir;

    wire [31:0] cnt;
    wire clk_out;

    wire [3:0] units, tens; 
    
    assign LED_SW = SW; 
    assign LED_BCD = {tens, units};

    toggle_switch dir_toggle ( 
        .clk(clk),		
        .btn_raw(btnU),
        .state(dir)
    ); 

    clock_divider u_clkdiv ( 
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt)
    );

    mux32x1 u_mux (
        .cnt(cnt),
        .sel(SW),
        .clk_out(clk_out)
    );

    bcd_up_down_counter u_counter (
        .clk(clk_out),
        .rst_n(rst_n),
        .dir(dir),
        .digit0(units),
        .digit1(tens)
    );

    seg7_scan u_seg (
        .clk(clk),
        .rst_n(rst_n),
        .digit0(units),
        .digit1(tens),
        .seg(seg),
        .an(an)
    );

endmodule

