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
    wire [7:0] alu_result;

    // Instantiate clock divider (slows 100 MHz clk)
    clock_divider u_div(
        .clk(CLK),
        .BTN0(!BTN0),
        .sel(SW[4:0]),
        .cnt(cnt),
        .clk_div(clk_div)
    );

    // Units BCD counter with direction control
    bcd_counter bcd_ones(
        .clk_div(clk_div),
        .BTN0(!BTN0),
        .dir_bit(SW[7]),
        .BCD(unit_bcd)
    );

    // Tens BCD counter with direction control
    bcd_counter bcd_tens(
        .clk_div(clk_div),
        .BTN0(!BTN0),
        .dir_bit(SW[8]),
        .BCD(tens_bcd)
    );

    // 4-bit ALU: add or subtract units and tens BCD
    alu alu1(
        .A(unit_bcd),
        .B(tens_bcd),
        .ctrl(SW[6:5]),
        .result(alu_result)
    );

    // Control nibble register for display
    control_decoder dec(
        .clk_div(clk_div),
        .BTN0(!BTN0),
        .SW(SW[8:5]),
        .ctrl_nibble(ctrl_nibble)
    );

    // Convert ALU 8-bit result to unsigned decimal digits for 7-seg display
    wire [7:0] abs_result;
    wire [3:0] alu_units;
    wire [3:0] alu_tens;

    assign abs_result = (alu_result[7]) ? (~alu_result + 1) : alu_result;

    assign alu_tens  = (abs_result / 10) % 10;
    assign alu_units = abs_result % 10;

    seg7_scan u_scan(
        .clk(CLK),
        .BTN0(!BTN0),
        .digit0(alu_units),    // units digit decimal
        .digit1(alu_tens),     // tens digit decimal
        .digit2(ctrl_nibble),  // control nibble hex
        .SEG(SEG),
        .AN(AN)
    );

    assign LED = {tens_bcd, unit_bcd};

endmodule
