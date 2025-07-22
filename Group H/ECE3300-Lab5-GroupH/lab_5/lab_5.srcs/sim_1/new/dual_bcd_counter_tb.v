`timescale 1ns / 1ps

module dual_bcd_counter_tb;

    reg clk;
    reg rst_n;
    reg tick;
    reg dir;

    wire [3:0] units;
    wire [3:0] tens;

    dual_bcd_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .tick(tick),
        .dir(dir),
        .units(units),
        .tens(tens)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Starting dual_bcd_counter_tb...");
        $monitor("Time = %0t | rst_n=%b, tick=%b, dir=%b | tens=%d, units=%d", $time, rst_n, tick, dir, tens, units);

        rst_n = 0;
        tick = 0;
        dir = 1;
        #20;
        rst_n = 1;
        #10;

        $display("\nCounting up...");
        dir = 1;
        repeat (12) begin
            tick = 1; @(posedge clk);
            tick = 0; @(posedge clk);
        end
        #10;

        $display("\nCounting down...");
        dir = 0;
        repeat (4) begin
            tick = 1; @(posedge clk);
            tick = 0; @(posedge clk);
        end
        #10;

        $display("\nCounting up through full range to test rollover...");
        dir = 1;
        repeat (92) begin
            tick = 1; @(posedge clk);
            tick = 0; @(posedge clk);
        end
        #10;

        $display("Finished dual_bcd_counter_tb.");
        $stop;
    end

endmodule