`timescale 1ns / 1ps

module clock_divider_tb;

    reg clk;
    reg rst_n;
    reg [4:0] sel;
    wire clk_div;

    clock_divider dut (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .clk_div(clk_div)
    );

    localparam CLK_PERIOD = 10;
    always begin
        clk = 0; #(CLK_PERIOD / 2);
        clk = 1; #(CLK_PERIOD / 2);
    end

    initial begin
        $display("Starting testbench for clock_divider...");
        rst_n = 1'b1; 
        sel   = 5'd0; 


        #20;
        $display("Applying active-low reset...");
        rst_n = 1'b0;
        #20;

        rst_n = 1'b1;
        $display("Reset released. Testing sel = 2");
        sel = 5'd2;

        #200;

        $display("Testing sel = 4");
        sel = 5'd4;

        #1000;

        $display("Test complete.");
        $finish;
    end

    initial begin
        $monitor("Time = %0t ns, rst_n = %b, sel = %d, clk_div = %b", $time, rst_n, sel, clk_div);
    end

endmodule