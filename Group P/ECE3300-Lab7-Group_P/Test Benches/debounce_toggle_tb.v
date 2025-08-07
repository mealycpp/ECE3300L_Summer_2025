`timescale 1ns / 1ps

module debounce_toggle_tb;

    reg clk = 0;
    reg btn_raw = 0;
    wire btn_toggle;

    // Instantiate the DUT
    debounce_toggle dut (
        .clk(clk),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );

    // Generate a simple clock (10ns period)
    always #5 clk = ~clk;

    initial begin

        // Initial low
        #20;

        // Simulate bouncing press
        btn_raw = 1; #10;
        btn_raw = 0; #10;
        btn_raw = 1; #10;
        btn_raw = 0; #10;
        btn_raw = 1; #40; // Stable high for >= 4 clk cycles

        // Hold high briefly
        #40;

        // Simulate bouncing release
        btn_raw = 0; #10;
        btn_raw = 1; #10;
        btn_raw = 0; #40; // Stable low

        #50;
        $finish;
    end
endmodule
