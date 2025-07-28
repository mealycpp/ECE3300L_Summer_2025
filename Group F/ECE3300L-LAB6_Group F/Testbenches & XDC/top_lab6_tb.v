// top_lab6_tb.v
`timescale 1ns / 1ps

module top_lab6_tb;
    reg clk, reset, up, down;
    wire [6:0] seg;
    wire [3:0] an;

    top_lab6 uut (
        .clk(clk),
        .reset(reset),
        .up(up),
        .down(down),
        .seg(seg),
        .an(an)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1; up = 0; down = 0; #20;
        reset = 0; #10;
        // Test counting up
        up = 1; down = 0; #50;
        // Test counting down
        up = 0; down = 1; #50;
        // Both up and down inactive
        up = 0; down = 0; #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t seg=%b an=%b", $time, seg, an);
    end
endmodule
