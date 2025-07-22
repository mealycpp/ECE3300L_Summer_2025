`timescale 1ns / 1ps

module tick_generator_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg [4:0] sw;

    // Outputs
    wire tick;

    // Instantiate the Unit Under Test (UUT)
    tick_generator uut (
        .clk(clk),
        .rst_n(rst_n),
        .sw(sw),
        .tick(tick)
    );

    // Clock generation (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        $display("Starting tick_generator_tb...");
        $monitor("Time = %0t | rst_n = %b | sw = %d | tick = %b", $time, rst_n, sw, tick);

        // 1. Test reset
        rst_n = 0;
        sw = 5'd0;
        #20;
        rst_n = 1;
        #10;

        // 2. Test with sw = 30 (tap = 1), tick should occur every 4 clock cycles
        $display("\nTesting with sw = 30 (tick every 4 clocks)");
        sw = 5'd30;
        #100;

        // 3. Test with sw = 29 (tap = 2), tick should occur every 8 clock cycles
        $display("\nTesting with sw = 29 (tick every 8 clocks)");
        sw = 5'd29;
        #200;
        
        // 4. Test reset again
        $display("\nTesting reset during operation");
        rst_n = 0;
        #20;
        rst_n = 1;
        #50;

        $display("Finished tick_generator_tb.");
        $stop;
    end

endmodule