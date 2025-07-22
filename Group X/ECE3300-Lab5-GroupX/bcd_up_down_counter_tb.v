`timescale 1ns / 1ps

module bcd_up_down_counter_tb;
    reg clk;
    reg rst_n;
    reg dir;           
    wire [3:0] digit0;
    wire [3:0] digit1;

    bcd_up_down_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .dir(dir),
        .digit0(digit0),
        .digit1(digit1)
        );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        rst_n = 0;
        dir   = 1;
        #20;
        rst_n = 1;

        #200;
        dir = 0;
        #200;
        dir = 1;
        #200;
        $finish;
    end
endmodule