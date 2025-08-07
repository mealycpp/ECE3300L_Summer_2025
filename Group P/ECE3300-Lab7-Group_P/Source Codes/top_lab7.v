module top_lab7(
    input wire clk,                                                                 // clk
    input wire btnc,                                                                // center button
    input wire [15:0] sw,                                                           // switches
    input wire [4:1] btn,                                                           // control buttons
    output wire [6:0] seg,                                                          // segments
    output wire [7:0] an,                                                           // displays
    output wire [7:0] led                                                           // leds
);
    wire rst = 1'b0;                                                                // disable global reset entirely

    wire clk1k, clk2;                                                               // Clock divider wires
    
    // Instantiate clock divider
    clock_divider_fixed div(
        .clk(clk),                                                                  // 100 MHz clock
        .rst(rst),                                                                  // global reset
        .clk_1kHz(clk1k),                                                           // 1 kHz clock for debouncing and scanning
        .clk_2Hz(clk2)                                                              // 2 Hz clock
    );

    wire dir, rot;                                                                  // Direction and rotate signals
    wire [1:0] shamt_low;                                                           // Lower 2 bits of shift amount from buttons
    wire [1:0] shamt_high;                                                          // Upper 2 bits of shift amount from counter
    wire btnc_toggle;                                                               // Toggle signal from BTNC press

    debounce_toggle d_dir (.clk(clk1k), .btn_raw(btn[1]), .btn_toggle(dir));        // BTNU (Up)
    debounce_toggle d_rot (.clk(clk1k), .btn_raw(btn[4]), .btn_toggle(rot));        // BTND (Down)
    debounce_toggle d_s0 (.clk(clk1k), .btn_raw(btn[2]), .btn_toggle(shamt_low[0]));// BTNL (Left)
    debounce_toggle d_s1 (.clk(clk1k), .btn_raw(btn[3]), .btn_toggle(shamt_low[1]));// BTNR (Right)
    debounce_toggle d_btnc(.clk(clk1k), .btn_raw(btnc), .btn_toggle(btnc_toggle));  // BTNC toggle for incrementing counter

    shamt_counter counter(
        .clk(clk1k),                                                                // clock input
        .rst(rst),                                                                  // reset
        .btnc(btnc_toggle),                                                         // center button toggles to increment counter
        .shamt_high(shamt_high)                                                     // 2-bit output
    );

    wire [3:0] shamt = {shamt_high, shamt_low};

    wire [15:0] barrel_out;
    barrel_shifter16 shifter(
        .data_in(sw),                                                               // 16-bit input from switches
        .shamt(shamt),                                                              // 4-bit shift amount
        .dir(dir),                                                                  // shift direction
        .rotate(rot),                                                               // 1 = rotate, 0 = logical shift
        .data_out(barrel_out)                                                       // 16-bit output
    );

    // Instantiate 8-digit 7-segment scanner to display result
    seg7_scan8 scanner(
        .clk(clk1k),                                                                // clk
        .rst(rst),                                                                  // rst
        .data(barrel_out),                                                          // 16-bit data to display
        .seg(seg),                                                                  // segment outputs
        .an(an)                                                                     // anode control outputs
    );

    // Show control status on LEDs: {shamt[3:0], dir, rot}
    assign led = {shamt, dir, rot};
endmodule