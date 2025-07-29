`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andy Siu 
// 
// Create Date: 07/28/2025 06:46:34 PM
// Design Name: 
// Module Name: clk_divider_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module clk_divider_tb;

    reg clk;
    reg reset_n;
    reg [4:0] sel;

    wire clk_div;
    wire [31:0] counter;

    clk_divider uut (
        .clk(clk),
        .sel(sel),
        .reset_n(reset_n),
        .clk_div(clk_div),
        .counter(counter)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tclk\treset_n\tsel\tcounter\t\tclk_div");
        $monitor("%0t\t%b\t%b\t%0d\t%0d\t%b", $time, clk, reset_n, sel, counter, clk_div);

        reset_n = 0;
        sel = 5'd0;
        #20;

        // Release reset
        reset_n = 1;

        // Test for a few select sel values (to simulate different divisions)
        #100;
        sel = 5'd2;    // counter[2] toggles every 4 cycles
        #200;
        sel = 5'd4;    // counter[4] toggles every 16 cycles
        #200;
        sel = 5'd6;    // counter[6] toggles every 64 cycles
        #200;

        // Apply reset during operation
        reset_n = 0;
        #20;
        reset_n = 1;
        #100;

        $display("Test done.");
        $finish;
    end

endmodule