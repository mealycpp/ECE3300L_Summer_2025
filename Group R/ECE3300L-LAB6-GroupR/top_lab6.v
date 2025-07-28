`timescale 1ns / 1ps

module top_lab6(
    input  clk,                   // 100MHz clock
    input  reset_n,                  // Active-low reset
    input  [8:0] sw,              // Switches SW0-SW7
    output [6:0] seg,            // LEDs
    output [2:0] an
    );
    
    wire clk_div_1hz;
    wire [3:0] units_bcd, tens_bcd;
    wire [7:0] alu_result;
    wire [3:0] ctrl_nibble_dis;

    // Instantiate Clock Divider
    clock_divider clk_div_inst(
        .clk(clk),
        .btn0(btn0),
        .clk_out(clk_div_1hz)
    );

    // BCD Counters
    bcd_counter units (
        .clk(clk),
        .btn0(btn0),
        .enable(clk_div_1hz),
        .units(units_bcd),
        .tens(tens_bcd)
    );

    
    // ALU
    alu alu_inst (
        .A(units_bcd),
        .B(tens_bcd),
        .ctrl(sw[6:5]),
        .result(alu_result)
    );

    // Control Decoder
    control_decoder ctrl_dec (
        .nibble(sw[8:5]),
        .ctrl_nibble(ctrl_nibble_dis)
    );

    // 7-Segment Scan
    seg7_scan display (
        .clk(clk),
        .btn0(btn0),
        .result(alu_result),
        .ctrl_nibble(ctrl_nibble_dis),
        .seg(seg),
        .an(an)
    );

  
endmodule
