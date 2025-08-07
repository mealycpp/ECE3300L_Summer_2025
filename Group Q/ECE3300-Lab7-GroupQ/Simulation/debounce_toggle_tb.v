`timescale 1ns/1ps
module debounce_toggle_tb;

    reg clk;        // ~1 kHz clock (simulated faster here)
    reg btn_raw;    // noisy button input
    wire btn_toggle;

    // DUT
    debounce_toggle uut (
        .clk(clk),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );

    // Clock generator (period = 10 ns -> 100 MHz for sim)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Waveform dump
        $dumpfile("debounce_toggle_tb.vcd");
        $dumpvars(0, debounce_toggle_tb);

        // Initial state
        btn_raw = 0;
        #100;

        // Simulate bouncing press
        btn_raw = 1; #20;
        btn_raw = 0; #10;
        btn_raw = 1; #10;
        btn_raw = 0; #10;
        btn_raw = 1; #100;  // stable press

        // Hold high, then release with bounce
        #200;
        btn_raw = 0; #20;
        btn_raw = 1; #10;
        btn_raw = 0; #10;
        btn_raw = 1; #10;
        btn_raw = 0; #100; // stable release

        #200 $stop;
    end
endmodule