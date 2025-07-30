`timescale 1ns / 1ps

module seg7_scan_tb;

    reg clk_test;
    reg [7:0] result;
    reg [3:0] ctrl_nibble;
    wire [6:0] SEG;
    wire [7:0] AN;

    seg7_scan dut_instance (
        .clk(clk_test),
        .result(result),
        .ctrl_nibble(ctrl_nibble),
        .SEG(SEG),
        .AN(AN)
    );

    initial begin
        clk_test = 0;
        forever #5 clk_test = ~clk_test;
    end

    initial begin
        result = 8'h45; ctrl_nibble = 4'b1010;
        #200;
        result = 8'h99; ctrl_nibble = 4'b0101;
        #200;
        $stop;
    end

endmodule
