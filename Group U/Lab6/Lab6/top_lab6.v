module top_lab6(
    input CLK,
    input BTN0,
    input [8:0] SW,
    output [7:0] LED,
    output [7:0] AN,
    output [6:0] SEG
);
    wire clk_div;
    wire [31:0] cnt;
    wire [3:0] unit_bcd, tens_bcd, ctrl_nibble;
    wire [7:0] logic_result;

    // Instantiate clock divider
    clock_divider u_div(
        .clk(CLK),
        .BTN0(!BTN0),
        .sel(SW[4:0]),
        .cnt(cnt),
        .clk_div(clk_div)
    );

    // BCD counters
    bcd_counter u_unit(
        .clk(clk_div),
        .rst_n(BTN0),
        .dir(SW[7]),
        .bcd(unit_bcd)
    );

    bcd_counter u_tens(
        .clk(clk_div),
        .rst_n(BTN0),
        .dir(SW[8]),
        .bcd(tens_bcd)
    );

    // ALU
    alu u_alu(
        .A(unit_bcd),
        .B(tens_bcd),
        .ctrl(SW[6:5]),
        .result(logic_result)
    );

    // Control Decoder
    control_decoder u_ctrl(
        .nibble({SW[8], SW[7], SW[6], SW[5]}),
        .ctrl_nibble(ctrl_nibble)
    );

    // 7-segment scanner
    seg7_scan u_scan(
        .clk(CLK),
        .result(logic_result),
        .ctrl_nibble(ctrl_nibble),
        .SEG(SEG),
        .AN(AN)
    );

    assign LED[3:0] = unit_bcd;
    assign LED[7:4] = tens_bcd;

endmodule
