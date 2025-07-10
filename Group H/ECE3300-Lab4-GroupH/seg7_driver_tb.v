`timescale 1ns/1ps
module seg7_driver_tb;

    // Testbench signals
    reg  clk;
    reg  rst_n;
    reg  [31:0] SW;
    wire [6:0]  Cnode;
    wire        dp;
    wire [7:0]  AN;

    // DUT
    seg7_driver dut (
        .clk   (clk),
        .rst_n (rst_n),
        .SW    (SW),
        .Cnode (Cnode),
        .dp    (dp),
        .AN    (AN)
    );

    // Clock generation: 100 MHz
    initial clk = 0;
    always #5 clk = ~clk;   // 10 ns period

    // Stimulus
    integer i;
    initial begin
        rst_n = 0;
        SW    = 32'd0;
        #100 rst_n = 1;                 // release reset after 100 ns

        // Sweep 0-F on the lowest nibble
        for (i = 0; i < 16; i = i + 1) begin
            SW[3:0] = i[3:0];
            #20_000;                    // 20 μs per step
        end

        $stop;
    end

endmodule
