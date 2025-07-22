`timescale 1ns / 1ps

module seg7_scan_tb;

    // Inputs
    reg clk;
    reg [3:0] digit0;
    reg [3:0] digit1;

    // Outputs
    wire [7:0] AN;
    wire [6:0] SEG;

    // Instantiate the Unit Under Test (UUT)
    seg7_scan uut (
        .clk(clk),
        .digit1(digit1),
        .digit0(digit0),
        .AN(AN),
        .SEG(SEG)
    );

    // Clock generation: 100 MHz => 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize digits
        digit0 = 4'd7;  // Display '7'
        digit1 = 4'd6;  // Display '6'

        // Run simulation for some time
        #200000; // 200 us total time
        $finish;
    end

endmodule
