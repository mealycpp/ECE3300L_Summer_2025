`timescale 1ns / 1ps

module clock_divider_fixed_tb;

    reg clk_100MHz = 0;

    wire clk_1kHz;
    wire clk_2Hz;

    clock_divider_fixed uut (
        .clk(clk_100MHz),
        .clk_1kHz(clk_1kHz),
        .clk_2Hz(clk_2Hz)
    );

    always #5 clk_100MHz = ~clk_100MHz; 

    initial begin
        $display("Starting clock_divider_fixed_tb...");
        
        #260_000_000;
        
        $display("Simulation finished.");
        $finish;
    end

    initial begin
        $dumpfile("clock_divider_fixed_tb.vcd");
        $dumpvars(0, clock_divider_fixed_tb);
    end

endmodule
