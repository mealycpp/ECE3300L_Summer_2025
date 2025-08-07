`timescale 1ns / 1ps

module seg7_scan8_tb;

    reg clk = 0;
    reg rst = 1;
    reg [15:0] data = 16'h1234;
    wire [6:0] seg;
    wire [7:0] an;

    // Instantiate the DUT
    seg7_scan8 dut (
        .clk(clk),
        .rst(rst),
        .data(data),
        .seg(seg),
        .an(an)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin

        // Release reset after 20ns
        #20 rst = 0;

        // Let it scan through a few cycles
        #200;

        $display("Test done.");
        $finish;
    end
endmodule
