`timescale 1ns / 1ps
module top_lab6 (
    input wire CLK,
    input wire BTN0,
    input wire [8:0] SW,
    output wire [6:0] SEG,
    output wire [7:0] AN,
    output wire [7:0] LED
);
    // Internal signals
    wire [31:0] tick_bits;
    wire clk_div;
    wire [3:0] count_a;
    wire [3:0] count_b;
    wire [3:0] ctrl_nibble;
    wire [7:0] alu_output;

    // Clock divider instance
    clock_divider clk_div_inst (
        .base_clk(CLK),
        .reset_n(BTN0),
        .sel(SW[4:0]),      // connect selector input
        .clk_div(clk_div),  // get selected divided clock bit
        .tick_bits(tick_bits) // optional, for inspection
    );
    
    // Control decoder (passing in 2-bit OP code, padded to 4)
    control_decoder ctrl_decoder_inst (
        .control_switches(SW[8:5]),
        .ctrl_nibble(ctrl_nibble)
    );

    // Two BCD counters
    bcd_counter counter_a (
        .clk_div(clk_div),
        .reset_n(BTN0),
        .count_up(SW[7]),
        .bcd_out(count_a)
    );

    bcd_counter counter_b (
        .clk_div(clk_div),
        .reset_n(BTN0),
        .count_up(SW[8]),  // counting down
        .bcd_out(count_b)
    );

    // ALU for basic arithmetic on two BCD digits
    alu alu_inst (
        .A_val(count_a),
        .B_val(count_b),
        .control_bits(SW[6:5]),
        .result_out(alu_output)
    );

    // 7-Segment display scanning module
    seg7_scan display_inst (
        .clk_fast(CLK),
        .rst_n(BTN0),
        .lower_digit(alu_output[3:0]),
        .upper_digit(alu_output[7:4]),
        .ctrl_nibble(ctrl_nibble),
        .seg_pins(SEG),
        .dp(),
        .anodes(AN)
    );
    // Display ALU result on LEDs
    assign LED = alu_output;
    assign AN[7:3] = 5'b11111;             // Disable unused digits (only 3 active).

endmodule
