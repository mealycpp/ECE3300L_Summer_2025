`timescale 1ns / 1ps

module seg7_scan_tb();

    // ------------------------------
    // Inputs to the seg7_scan module
    // ------------------------------
    reg CLK;           // System clock
    reg rst_n;         // Active-low reset
    reg [7:0] out;     // 8-bit input: [7:4] = tens, [3:0] = units

    // ------------------------------
    // Outputs from the seg7_scan module
    // ------------------------------
    wire [1:0] AN;     // Anode control signals
    wire [6:0] SEG;    // 7-segment output (a-g)

    // ------------------------------
    // Instantiate the DUT (Device Under Test)
    // ------------------------------
    seg7_scan seg7_scan_tb (
        .AN(AN),
        .SEG(SEG),
        .out(out),
        .CLK(CLK),
        .rst_n(rst_n)
    );

    // ------------------------------
    // Clock generation: 10ns period → 100 MHz
    // ------------------------------
    initial CLK = 0;
    always #5 CLK = ~CLK;

    // ------------------------------
    // Stimulus block
    // ------------------------------
    initial begin
        rst_n = 0;       // Hold in reset
        out = 8'h00;     // Initial display: "00"

        #20 rst_n = 1;   // Release reset

        // Display "12"
        #100 out = 8'h12;  // [7:4]=1, [3:0]=2

        // Display "45"
        #100 out = 8'h45;  // [7:4]=4, [3:0]=5

        // Display "99"
        #100 out = 8'h99;  // [7:4]=9, [3:0]=9

        #200 $stop;      // End simulation
    end

endmodule
