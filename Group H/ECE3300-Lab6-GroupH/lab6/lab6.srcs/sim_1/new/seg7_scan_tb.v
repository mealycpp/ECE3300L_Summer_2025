`timescale 1ns / 1ps

module seg7_scan_tb;

    reg clk;
    reg rst_n;
    reg [3:0] digit0, digit1, digit2;
    wire [6:0] seg;
    wire [2:0] an;

    seg7_scan dut (
        .clk(clk),
        .rst_n(rst_n),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2),
        .seg(seg),
        .an(an)
    );

    localparam CLK_PERIOD = 10;
    always begin
        clk = 0; #(CLK_PERIOD / 2);
        clk = 1; #(CLK_PERIOD / 2);
    end

    initial begin
        $display("Starting testbench for seg7_scan...");

        rst_n = 1'b0;
        digit0 = 4'h1;
        digit1 = 4'h2;
        digit2 = 4'h3;
        # (CLK_PERIOD * 2);

        rst_n = 1'b1;
        $display("Displaying '1 2 3'. Check waveforms for correct scanning.");

        #2000000;

        $display("Displaying 'A B C'. Check waveforms for updated scanning.");
        digit0 = 4'hA;
        digit1 = 4'hB;
        digit2 = 4'hC;

        #2000000;

        $display("Test complete.");
        $finish;
    end

    initial begin
        $monitor("Time = %0t ns | an = %b, seg = %b | digits = %h %h %h",
                 $time, an, seg, digit2, digit1, digit0);
    end

endmodule