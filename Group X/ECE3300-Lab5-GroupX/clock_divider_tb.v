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
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;

        #200;
        $finish;
    end
endmodule
    