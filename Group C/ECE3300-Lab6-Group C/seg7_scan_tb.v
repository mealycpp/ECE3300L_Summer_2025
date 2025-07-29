`timescale 1ns / 1ps

module seg7_scan_tb;

    reg clk_tb;
    reg BTN0_tb;
    reg [3:0] digit0_tb, digit1_tb, digit2_tb;
    wire [6:0] SEG_tb;
    wire [7:0] AN_tb;

    seg7_scan uut (
        .clk(clk_tb),
        .BTN0(BTN0_tb),
        .digit0(digit0_tb),
        .digit1(digit1_tb),
        .digit2(digit2_tb),
        .SEG(SEG_tb),
        .AN(AN_tb)
    );

    always #5 clk_tb = ~clk_tb; // 100 MHz clock simulated with 10 ns period

    initial begin
        // Init
        clk_tb = 0;
        BTN0_tb = 0;
        digit0_tb = 4'd0;
        digit1_tb = 4'd0;
        digit2_tb = 4'd0;

        // Simulate reset
        #20 BTN0_tb = 1;

        // Assign values
        digit0_tb = 4'd3;
        digit1_tb = 4'd1;
        digit2_tb = 4'd4; // Should show 4-1-3 across active digits

        // Let it run
        #1000;

        $finish;
    end

endmodule
