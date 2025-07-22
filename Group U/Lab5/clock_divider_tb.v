`timescale 1ns / 1ps

module clock_divider_tb();
    reg clk = 0;
    reg rst_n;
    wire [31:0] cnt;

    clock_divider tb (
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt)
    );

    always #5 clk = ~clk;  // 10 ns period

    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;
        #500;
        $finish;
    end
endmodule
