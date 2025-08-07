`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 03:51:59 PM
// Design Name: 
// Module Name: top_lab7
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

module top_lab7(
    input clk,
    input [15:0] SW,
    input BTNC, BTNU, BTND, BTNL, BTNR,
    output [6:0] SEG,
    output [7:0] AN,
    output [7:0] LED
);

    wire clk_1kHz, clk_demo;

    // Instantiate clock_divider_fixed
    clock_divider_fixed div_fixed_inst (
        .clk(clk),
        .clk_1kHz(clk_1kHz),
        .clk_demo(clk_demo)
    );

    // Synchronous reset from button center
    wire rst;
    assign rst = BTNC;

    // Debounce and toggle logic for direction and rotation
    wire state_dir, state_rot;
    wire toggle_dir, toggle_rot;

    debounce_toggle db_dir(
        .clk_1kHz(clk_1kHz),
        .rst(rst),
        .btn_raw(BTNL),
        .state(state_dir),
        .btn_toggle(toggle_dir)
    );
    
    debounce_toggle db_rot(
        .clk_1kHz(clk_1kHz),
        .rst(rst),
        .btn_raw(BTNR),
        .state(state_rot),
        .btn_toggle(toggle_rot)
    );

    wire state_inc, state_dec;
    wire toggle_inc, toggle_dec;

    // Use debounce_toggle for BTNU
    debounce_toggle db_inc(
        .clk_1kHz(clk_1kHz),
        .rst(BTNC),
        .btn_raw(BTNU),
        .state(state_inc),
        .btn_toggle(toggle_inc)
    );
    
    // Use debounce_toggle for BTND
    debounce_toggle db_dec(
        .clk_1kHz(clk_1kHz),
        .rst(BTNC),
        .btn_raw(BTND),
        .state(state_dec),
        .btn_toggle(toggle_dec)
    );
    
    // Shamt counter for BTNU
    wire [3:0] shamt;
    wire [1:0] shamt_counter_out;
    
    shamt_counter sc(
        .clk(clk_1kHz),
        .reset(BTNC),
        .inc(toggle_inc), // Use the one-cycle pulse from the debouncer to increment
        .shamt_high(shamt_counter_out)
    );
    
    // Assign the full 4-bit shamt
    assign shamt = {shamt_counter_out, state_dec}; // Example, adjust as needed

    // Barrel shifter
    wire [15:0] result;
    barrel_shifter16 bs(
        .data_in(SW),
        .shamt(shamt),
        .dir(state_dir),
        .rotate(state_rot),
        .data_out(result)
    );
    
    // 7-segment display scanner
    wire [3:0] AN_4digit;
    seg7_scan8 scan(
        .clk_1kHz(clk_1kHz),
        .hex(result),
        .SEG(SEG),
        .AN(AN_4digit)
    );
    
    // Connect AN outputs
    assign AN[3:0] = AN_4digit;
    assign AN[7:4] = 4'b1111; // Disable unused digits

    // LED assignments for debugging and status
    assign LED = {2'b00, state_rot, state_dir, shamt};

endmodule