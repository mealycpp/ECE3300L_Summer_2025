`timescale 1ns / 1ps
module seg7_scan_tb;
    reg clk = 0, rst_n = 0;
    reg [3:0] digit0 = 4'd5, digit1 = 4'd1, digit2 = 4'd15;
    wire [6:0] seg;
    wire [7:0] an;

    seg7_scan uut (
        .clk(clk),
        .rst_n(rst_n),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2),
        .an(an),
        .seg(seg)
    );

    
    always #5 clk = ~clk;

    initial begin
        $display("Starting seg7_scan_tb");
        rst_n = 0; #20;
        rst_n = 1;
    end

    // Monitor output values during simulation
    initial begin
        $monitor("Time = %0t | AN = %b | SEG = %b | digit0 = %1X | digit1 = %1X | digit2 = %1X",
                 $time, an, seg, digit0, digit1, digit2);
    end
endmodule
