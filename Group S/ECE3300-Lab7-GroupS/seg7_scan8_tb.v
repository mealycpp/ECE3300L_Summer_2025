`timescale 1ns / 1ps

module seg7_scan8_tb;

    reg CLK_1KHZ = 0;
    reg [6:0] SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6, SEG7;
    wire [7:0] AN;
    wire [6:0] SEG;

    seg7_scan8 dut (
        .CLK_1KHZ(CLK_1KHZ),
        .SEG0(SEG0),
        .SEG1(SEG1),
        .SEG2(SEG2),
        .SEG3(SEG3),
        .SEG4(SEG4),
        .SEG5(SEG5),
        .SEG6(SEG6),
        .SEG7(SEG7),
        .AN(AN),
        .SEG(SEG)
    );

    always #5 CLK_1KHZ = ~CLK_1KHZ;

    initial begin
        SEG0 = 7'b0000001; // 0
        SEG1 = 7'b1001111; // 1
        SEG2 = 7'b0010010; // 2
        SEG3 = 7'b0000110; // 3
        SEG4 = 7'b1001100; // 4
        SEG5 = 7'b0100100; // 5
        SEG6 = 7'b0100000; // 6
        SEG7 = 7'b0001111; // 7
        
        #1_000_000;
        $finish;
    end

endmodule
