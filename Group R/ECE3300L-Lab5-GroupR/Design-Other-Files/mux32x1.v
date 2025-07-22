`timescale 1ns / 1ps

module mux32x1(
    input [4:0] Sel,        // 5-bit select line: selects one of the 32 bits
    input [31:0] cnt,       // 32-bit input signal (usually a counter)
    output clk_out          // Selected bit from cnt (used as divided clock)
);  

    // Output the bit of 'cnt' indexed by 'Sel'
    // This effectively lets you choose the division factor dynamically
    assign clk_out = cnt[Sel];

endmodule
