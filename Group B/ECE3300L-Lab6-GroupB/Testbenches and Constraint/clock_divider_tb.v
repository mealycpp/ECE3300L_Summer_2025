`timescale 1ns / 1ps
module clock_divider_tb;
    reg clk = 0;
    reg rst_n = 0;
    reg [4:0] sel = 5'd0;
    wire [31:0] count;
    wire clk_div;

    clock_divider uut (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .count(count),
        .clk_div(clk_div)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Starting clock_divider_tb");
        rst_n = 0; #20;
        rst_n = 1;

        sel = 0;
        repeat (10) begin
            #100 $display("sel = %0d, clk_div = %b, count = %h", sel, clk_div, count);
            sel = sel + 1;
        end
    end
endmodule
