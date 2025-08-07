module top_lab7(
    input wire CLK,
    input wire [15:0] SW,
    input wire BTNC, BTNU, BTND, BTNL, BTNR,
    output wire [7:0] LED,
    output wire [6:0] SEG,
    output wire [7:0] AN
);
    wire clk_1kHz, clk_demo;
    clock_divider_fixed clkdiv(.clk_in(CLK), .clk_1kHz(clk_1kHz), .clk_demo(clk_demo));

    wire dir_tog, rot_tog, sham0_tog, sham1_tog;
    debounce_toggle d_dir(.clk_1kHz(clk_1kHz), .btn_raw(BTNU), .btn_toggle(dir_tog));
    debounce_toggle d_rot(.clk_1kHz(clk_1kHz), .btn_raw(BTND), .btn_toggle(rot_tog));
    debounce_toggle d_s0 (.clk_1kHz(clk_1kHz), .btn_raw(BTNL), .btn_toggle(sham0_tog));
    debounce_toggle d_s1 (.clk_1kHz(clk_1kHz), .btn_raw(BTNR), .btn_toggle(sham1_tog));

    wire [1:0] shamt_32;
    wire btnC_tog;
    debounce_toggle d_rst(.clk_1kHz(clk_1kHz), .btn_raw(BTNC), .btn_toggle(btnC_tog));

    reg btnC_prev = 0;
    wire btnC_edge = btnC_tog & ~btnC_prev;

    always @(posedge clk_demo) begin
        btnC_prev <= btnC_tog;
    end

    shamt_counter shctr(.clk(clk_demo), .rst(1'b0), .inc(btnC_edge), .shamt_bits(shamt_32));

    wire [3:0] shamt = {shamt_32, sham1_tog, sham0_tog};
    wire [15:0] barrel_out;
    wire [15:0] result_word;
    assign result_word = barrel_out;

    barrel_shifter16 shifter(
        .data_in(SW),
        .shamt(shamt),
        .dir(dir_tog),
        .rotate(rot_tog),
        .data_out(barrel_out)
    );

    assign LED = {shamt, rot_tog, dir_tog};

    wire [3:0] hex0 = result_word[3:0];
    wire [3:0] hex1 = result_word[7:4];
    wire [3:0] hex2 = result_word[11:8];
    wire [3:0] hex3 = result_word[15:12];

    wire [6:0] seg0, seg1, seg2, seg3;
    hex_to_7seg h0(.hex(hex0), .seg(seg0));
    hex_to_7seg h1(.hex(hex1), .seg(seg1));
    hex_to_7seg h2(.hex(hex2), .seg(seg2));
    hex_to_7seg h3(.hex(hex3), .seg(seg3));

    seg7_scan8 scanner(
        .clk_1kHz(clk_1kHz),
        .rst_n(1'b1),
        .seg0(seg0),
        .seg1(seg1),
        .seg2(seg2),
        .seg3(seg3),
        .seg(SEG),
        .an(AN)
    );
endmodule