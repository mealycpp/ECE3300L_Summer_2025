`timescale 1ns / 1ps
module bcd_counter_tb;
    reg clk = 0, rst_n = 0, dir = 1;
    wire [3:0] bcd;

    bcd_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .dir(dir),
        .bcd(bcd)
    );

    always #10 clk = ~clk;

    initial begin
        $display("Starting bcd_counter_tb");

        rst_n = 0; #20;
        rst_n = 1;
        dir = 1;
        $monitor("Time = %0t | dir = %b | bcd = %d", $time, dir, bcd);

        #200 dir = 0;
    end
endmodule
