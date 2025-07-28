`timescale 1ns / 1ps

module clock_divider_tb();
    reg clk = 0;
    reg rst_n;
    reg [4:0] sel;
    wire clk_div;
    wire [31:0] count;

    clock_divider uut (
        .clk(clk),
        .reset_n(rst_n),
        .sel(sel),
        .clk_div(clk_div),
        .counter(count)
    );

    always #5 clk = ~clk;  // 10 ns period

    initial begin
        rst_n = 0;
        sel = 0;
        
        #20;
        rst_n = 1;

        #100;

        sel = 1; #100;
        sel = 2; #100;
        sel = 3; #100;
        sel = 4; #100;
        sel = 5; #100;

        $finish;
    end
endmodule
