`timescale 1ns / 1ps

module clock_divider_tb;

    reg clk;
    reg [4:0] sel;
    wire clk_div;
    wire [31:0] cnt;

    clock_divider dut_instance (
        .clk(clk),
        .BTN0(1'b1),
        .sel(sel),
        .clk_div(clk_div),
        .cnt(cnt)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        sel = 5'd0;
        #100;
        sel = 5'd10;
        #100;
        sel = 5'd20;
        #100;
        $stop;
    end

endmodule
