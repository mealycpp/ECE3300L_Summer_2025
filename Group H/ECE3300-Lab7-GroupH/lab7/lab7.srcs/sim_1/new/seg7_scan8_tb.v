`timescale 1ns / 1ps

module seg7_scan8_tb;

    reg clk = 0;
    reg [55:0] hex_seg_flat;

    wire [7:0] an;
    wire [6:0] seg;

    seg7_scan8 uut (
        .clk(clk),
        .hex_seg_flat(hex_seg_flat),
        .an(an),
        .seg(seg)
    );
    
    always #500_000 clk = ~clk; 

    initial begin
        $display("Starting seg7_scan8_tb...");
        
        hex_seg_flat = {
            7'b0000000, // Digit 7: 8
            7'b0001111, // Digit 6: 7
            7'b0100000, // Digit 5: 6
            7'b0100100, // Digit 4: 5
            7'b1001100, // Digit 3: 4
            7'b0000110, // Digit 2: 3
            7'b0010010, // Digit 1: 2
            7'b1001111  // Digit 0: 1
        };

        #10_000_000;

        $display("Simulation finished.");
        $finish;
    end
    
    initial begin
        $dumpfile("seg7_scan8_tb.vcd");
        $dumpvars(0, seg7_scan8_tb);
    end

endmodule
