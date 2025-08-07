`timescale 1ns / 1ps

module seg7_scan8_tb;

    reg clk = 0;
    reg [55:0] hex_seg_flat;
    wire [7:0] an;
    wire [6:0] seg;

    // Instantiate DUT
    seg7_scan8 uut (
        .clk(clk),
        .hex_seg_flat(hex_seg_flat),
        .an(an),
        .seg(seg)
    );

    // Clock generation (simulate a slow clk so we can observe each digit easily)
    always #10 clk = ~clk;  // 50MHz simulated clock

    initial begin
        // Set up hex_seg_flat with distinct segment codes per digit
        // Segment format: 7 bits per digit (LSB first)
        // Let's say:
        // Digit 0: 7'b0000001 (segments a)
        // Digit 1: 7'b0000010 (segments b)
        // Digit 2: 7'b0000100 (segments c)
        // ...
        hex_seg_flat = {
            7'b1000000, // Digit 7
            7'b0100000, // Digit 6
            7'b0010000, // Digit 5
            7'b0001000, // Digit 4
            7'b0000100, // Digit 3
            7'b0000010, // Digit 2
            7'b0000001, // Digit 1
            7'b1111110  // Digit 0 (all except g)
        };

        $display("Time\tScanIndex\tAN\t\tSEG");
        $monitor("%4dns\t   %0d\t\t%b\t%b", $time, uut.scan_index, an, seg);

        // Let the scanner run for a few full cycles
        #200;  // Enough time for multiple cycles

        $display("Test completed.");
        $finish;
    end

endmodule
