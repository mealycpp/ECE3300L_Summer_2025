module top_lab6(
    input  wire clk,               // 100 MHz
    input  wire [8:0] SW,          // SW[8:0]
    input  wire BTN0,              // Reset, active-low
    output wire [7:0] LED,         // Debug LEDs
    output wire [7:0] AN,          // Digit enable
    output wire [6:0] SEG          // 7-segment
);

    wire clk_div;
    wire [3:0] units_bcd, tens_bcd;
    wire [7:0] alu_result;
    wire [3:0] ctrl_nibble;

    // Clock Divider
    clock_divider u_clkdiv (
        .clk(clk),
        .sel(SW[4:0]),
        .clk_div(clk_div)
    );

    // Units Counter
    bcd_counter u_units (
        .clk(clk_div),
        .reset_n(BTN0),
        .dir(SW[7]),
        .q(units_bcd)
    );

    // Tens Counter
    bcd_counter u_tens (
        .clk(clk_div),
        .reset_n(BTN0),
        .dir(SW[8]),
        .q(tens_bcd)
    );

    // ALU
    alu u_alu (
        .A(units_bcd),
        .B(tens_bcd),
        .ctrl(SW[6:5]),
        .result(alu_result)
    );

    // Control Decoder
    control_decoder u_ctrl (
        .nibble({SW[8], SW[7], SW[6], SW[5]}),
        .ctrl_nibble(ctrl_nibble)
    );

    // 7-seg Scanner
    seg7_scan u_seg7 (
        .clk(clk),
        .result(alu_result),
        .ctrl_nibble(ctrl_nibble),
        .AN(AN),
        .SEG(SEG)
    );

    // Debug LEDs
    assign LED[3:0] = units_bcd;
    assign LED[7:4] = tens_bcd;
    assign AN[7:3] = 5'b11111; 

endmodule
