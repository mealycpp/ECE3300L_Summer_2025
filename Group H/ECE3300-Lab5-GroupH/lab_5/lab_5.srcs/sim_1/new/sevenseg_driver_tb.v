`timescale 1ns / 1ps

module sevenseg_driver_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg [3:0] units;
    reg [3:0] tens;

    // Outputs
    wire [6:0] SEG;
    wire [1:0] AN;

    // Instantiate the Unit Under Test (UUT)
    sevenseg_driver uut (
        .clk(clk),
        .rst_n(rst_n),
        .units(units),
        .tens(tens),
        .SEG(SEG),
        .AN(AN)
    );

    // Clock generation (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        $display("Starting sevenseg_driver_tb...");
        $monitor("Time=%0t | units=%d, tens=%d | AN=%b, SEG=%b", $time, units, tens, AN, SEG);
        
        // 1. Test reset
        rst_n = 0;
        units = 4'dx;
        tens = 4'dx;
        #20;
        rst_n = 1;
        #10;
        
        // 2. Test with some values, e.g., 83
        $display("\nDisplaying the number 83");
        units = 4'd3;
        tens = 4'd8;
        // The scan controller toggles based on clk[15]
        // Period is 2 * 2^15 * 10ns = 655360 ns.
        // We need to run long enough to see it toggle.
        #700000;
        
        // 3. Test with another value, e.g., 57
        $display("\nDisplaying the number 57");
        units = 4'd7;
        tens = 4'd5;
        #700000;

        $display("Finished sevenseg_driver_tb.");
        $stop;
    end

endmodule