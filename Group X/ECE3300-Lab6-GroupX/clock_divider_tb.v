`timescale 1ns / 1ps

module clock_divider_tb;
    reg clk;
    reg rst_n;
    wire [31:0] cnt;

    clock_divider uut (
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Assert reset
        rst_n = 1'b0;
        #20;

        // Deassert reset and let counter run
        rst_n = 1'b1;
        repeat (10) @(posedge clk);

        // Re-assert reset to check clearing
        rst_n = 1'b0;
        #10;
        rst_n = 1'b1;

        // Run a few more cycles
        repeat (5) @(posedge clk);

        $finish;
    end
endmodule
