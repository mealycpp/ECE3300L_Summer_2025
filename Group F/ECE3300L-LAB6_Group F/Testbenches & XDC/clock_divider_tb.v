// clock_divider_tb.v
`timescale 1ns / 1ps

module clock_divider_tb;
    reg clk, reset;
    wire clk_out;

    clock_divider uut (
        .clk(clk),
        .reset(reset),
        .clk_out(clk_out)
    );

    initial clk = 0;
    always #2 clk = ~clk; // Fast clock for sim

    initial begin
        reset = 1; #10;
        reset = 0; #10;
        #200; // Wait for clock_out toggles
        $finish;
    end

    initial begin
        $monitor("Time=%0t clk=%b clk_out=%b", $time, clk, clk_out);
    end
endmodule
