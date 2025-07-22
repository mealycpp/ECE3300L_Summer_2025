`timescale 1ns / 1ps

module mux32x1_tb;

    // --------------------------
    // Testbench signals
    // --------------------------
    reg [4:0] Sel_tb;         // Select line to choose which bit of cnt_tb
    reg [31:0] cnt_tb;        // 32-bit input to be bit-selected
    wire clk_out_tb;          // Output from the mux

    // --------------------------
    // Instantiate the Device Under Test (DUT)
    // --------------------------
    mux32x1 uut (
        .Sel(Sel_tb),
        .cnt(cnt_tb),
        .clk_out(clk_out_tb)
    );

    // --------------------------
    // Stimulus
    // --------------------------
    initial begin
        // Initialize select and counter value
        Sel_tb = 5'd0;
        cnt_tb = 32'hABCDEFAB;  // Known pattern for visibility

        // Sweep through all 32 bit positions (0 to 31)
        repeat (32) begin
            #10 Sel_tb = Sel_tb + 1;
        end

        $stop;  // End simulation
    end

endmodule
