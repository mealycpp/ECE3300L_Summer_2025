`timescale 1ns/1ps
module lab4_top
(
    input  wire        CLK100MHZ,   // 100 MHz system clock (pin: "clk")
    input  wire        BTN_C,       // central push-button, active-high
    input  wire [15:0] SW,          // slide switches
    output wire [15:0] LED,         // on-board LEDs
    output wire [6:0]  Cnode,       // 7-segment cathodes (active-low)
    output wire        DP,          // decimal point (active-low, off here)
    output wire [7:0]  AN           // digit anodes (active-low)
);

    // Drive on-board LEDs
    assign LED = SW;        // Simple mirror

    // 7-segment driver instance
    seg7_driver u_seg7_driver
    (
        .clk   (CLK100MHZ),
        .rst_n (~BTN_C),                 // convert to *active-low* async reset
        .SW    ({16'h0000, SW}),         // upper 16 bits are zero
        .Cnode (Cnode),
        .dp    (DP),
        .AN    (AN)
    );

endmodule
