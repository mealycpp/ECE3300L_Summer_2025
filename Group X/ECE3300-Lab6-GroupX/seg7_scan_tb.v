`timescale 1ns / 1ps

module seg7_scan_tb;
    // Inputs
    reg clk;
    reg rst_n;
    reg [3:0] onesPlace;
    reg [3:0] tensPlace;
    reg [3:0] digitCtrl;
    wire [6:0] SEG;
    wire [7:0] AN;

    seg7_scan uut (
        .clk(clk),
        .rst_n(rst_n),
        .onesPlace(onesPlace),
        .tensPlace(tensPlace),
        .digitCtrl(digitCtrl),
        .SEG(SEG),
        .AN(AN)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Apply reset and initial digit values (3, 5, A)
        rst_n     = 1'b0;
        onesPlace = 4'd3;   // display 3
        tensPlace = 4'd5;   // display 5
        digitCtrl = 4'hA;   // display A
        #20;                // hold reset
        rst_n     = 1'b1;
        
        #200_000;

        // Change to 1 2 3 and scan again
        onesPlace = 4'd1;   // display 1
        tensPlace = 4'd2;   // display 2
        digitCtrl = 4'd3;   // display 3
        #200_000;

        $finish;
    end
endmodule
