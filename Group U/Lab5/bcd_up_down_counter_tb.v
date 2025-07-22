`timescale 1ns / 1ps

module bcd_up_down_counter_tb();
    reg clk = 0;
    reg rst_n;
    reg dir;
    wire [3:0] lsb0, lsb1;

    bcd_up_down_counter tb (
        .clk(clk),
        .rst_n(rst_n),
        .dir(dir),
        .lsb0(lsb0),
        .lsb1(lsb1)
    );

    always #5 clk = ~clk; 

    initial begin
        rst_n = 0; dir = 1; #20;
        rst_n = 1; #100;

        dir = 0; #100;
        $finish;
    end
endmodule