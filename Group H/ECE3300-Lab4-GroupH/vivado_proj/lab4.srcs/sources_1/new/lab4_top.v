`timescale 1ns/1ps
/******************************************************************************
 * ECE-3300L  •  Lab 4  •  Nexys-A7 Switch-to-7-Segment Demo
 * Top-level: • Mirrors SW[15:0] → LED[15:0]
 *           • Zero-extends the 16 switches to 32 bits for seg7_driver
 *           • Passes the on-board 100 MHz clock and a *low-active* reset
 ******************************************************************************/
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

    /* --------------------------------------------------------------------- */
    /* Drive on-board LEDs                                                  */
    /* --------------------------------------------------------------------- */
    assign LED = SW;        // Simple mirror

    /* --------------------------------------------------------------------- */
    /* 7-segment driver instance                                            */
    /* --------------------------------------------------------------------- */
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
