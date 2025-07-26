`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module Name: top_lab6
// Description: Top-level module for Lab 6. Instantiates and connects all sub-modules:
//              - Clock divider
//              - Two BCD counters (units and tens)
//              - ALU
//              - 7-segment scanner
//////////////////////////////////////////////////////////////////////////////////

module top_lab6(
    input clk,          // 100MHz on-board clock
    input BTNO,         // Reset button (active-low)
    input [8:0] SW,     // 9 switches for control
    output [7:0] LED,   // 8 debug LEDs
    output [6:0] seg,   // 7-segment display cathodes
    output [2:0] an     // 7-segment display anodes
    );

    // Internal wires
    wire clk_div;
    wire [3:0] units_bcd;
    wire [3:0] tens_bcd;
    wire [7:0] alu_result;
    wire [3:0] ctrl_nibble;

    // Instantiate the clock divider
    // SW[4:0] control the speed [cite: 28]
    clock_divider clock_divider_inst (
        .clk(clk),
        .rst_n(BTNO),
        .sel(SW[4:0]),
        .clk_div(clk_div)
    );

    // Instantiate the BCD counter for the 'units' digit
    // SW[7] controls direction [cite: 8, 30]
    bcd_counter units_counter_inst (
        .clk(clk_div),
        .rst_n(BTNO),
        .dir(SW[7]),
        .bcd_out(units_bcd)
    );

    // Instantiate the BCD counter for the 'tens' digit
    // SW[8] controls direction [cite: 9, 30]
    bcd_counter tens_counter_inst (
        .clk(clk_div),
        .rst_n(BTNO),
        .dir(SW[8]),
        .bcd_out(tens_bcd)
    );

    // Instantiate the ALU
    // SW[6:5] control the operation (00=add, 01=sub) [cite: 7, 28]
    alu alu_inst (
        .A(units_bcd),
        .B(tens_bcd),
        .ctrl(SW[6:5]),
        .result(alu_result)
    );

    // The control nibble is just a direct wiring of the control switches
    control_decoder control_decoder_inst (
        .ctrl_in(SW[8:5]),
        .ctrl_out(ctrl_nibble)
    );

    // Instantiate the 7-segment display scanner
    seg7_scan seg7_scan_inst (
        .clk(clk),
        .rst_n(BTNO),
        .digit0(alu_result[3:0]),  // ANO displays low nibble of result [cite: 11]
        .digit1(alu_result[7:4]),  // AN1 displays high nibble of result [cite: 12]
        .digit2(ctrl_nibble),      // AN2 displays control nibble [cite: 13]
        .seg(seg),
        .an(an)
    );

    // Assign debug LEDs
    assign LED[3:0] = units_bcd; // LEDs [3:0] show units counter [cite: 15]
    assign LED[7:4] = tens_bcd; // LEDs [7:4] show tens counter [cite: 16]

endmodule