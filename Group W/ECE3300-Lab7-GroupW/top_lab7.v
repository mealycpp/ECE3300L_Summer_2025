`timescale 1ns / 1ps

module top_lab7(
        input wire clk,               // 100 MHz system clock            /
        input wire [15:0] SW,         // Slide switches for input word
        input wire [4:0] BTN,         // BTN[4] = BTNC, BTN[3:0] = BTNU, BTND, BTNL, BTNR
        output wire [7:0] LED,        // Optional debug LEDs
        output wire [6:0] SEG,        // 7-segment segments
        output wire DP,
        output wire [7:0] AN          // Digit enables
    );
        
        wire rst_n;
        wire clk_rst;
        assign DP = 1;
        wire clk_1kHz, clk_2Hz;
            clock_divider_fixed clkdiv (
                .clk(clk),
                .rst_n(clk_rst),
                .clk_out(clk_1kHz)
            );

        // Debounced Button Toggles
        wire dir, rot;
        wire [1:0] shamtl;
        wire [1:0] shamtm;
        wire btnc_toggle;

                debounce_toggle db_dir (.clk(clk_1kHz), .btn_raw(BTN[0]), .btn_toggle(dir));      // BTNL
                debounce_toggle db_rot (.clk(clk_1kHz), .btn_raw(BTN[1]), .btn_toggle(rot));      // BTNR
                debounce_toggle db_shamt0 (.clk(clk_1kHz), .btn_raw(BTN[2]), .btn_toggle(shamtl[0])); // BTND
                debounce_toggle db_shamt1 (.clk(clk_1kHz), .btn_raw(BTN[3]), .btn_toggle(shamtl[1])); // BTNU
                
        
    //SHAMT Counter (MSBs)
        wire btnc_raw = BTN[4];
        assign rst_n = ~btnc_raw;
        assign clk_rst = 1; // reset disable for now
                shamt_counter shamt_ctrl (
                    .clk(clk_1kHz),            // 1 kHz clock
                    .btn_raw(btnc_raw),        // Raw BTNC input
                    .shamt(shamtm)     // One-cycle pulse for SHAMT increment
        );

               

        wire [3:0] shamt = {shamtm, shamtl};  // Combine MSBs and LSBs

    // Barrel Shifter
        wire [15:0] barrel_out;
            barrel_shifter16 shifter (
                .data_in(SW[15:0]),
                .shamt(shamt),
                .dir(dir),
                .rotate(rot),
                .data_out(barrel_out)
            );

    // Segment Scanner
        wire [3:0] ones, tens, hundreds, thousands;
        assign ones = barrel_out[3:0];
        assign tens = barrel_out[7:4];
        assign hundreds = barrel_out[11:8];
        assign thousands = barrel_out[15:12];
            seg7_scan8 scanner (
                .clk(clk),
                .rst_n(rst_n),
                .onesPlace(ones),
                .tensPlace(tens),
                .hundredsPlace(hundreds),
                .thousandsPlace(thousands),
                .SEG(SEG),
                .AN(AN)
            );

    

    // 💡 Optional Debug LEDs
    assign LED[7] = dir;
    assign LED[6] = rot;
    assign LED[5:2] = shamt;
    assign LED[1:0] = 2'b00;  // Unused or reserved
endmodule
