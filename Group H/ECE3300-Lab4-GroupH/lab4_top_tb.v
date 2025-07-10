`timescale 1ns/1ps
module lab4_top_tb;

    reg  clk;
    reg  btn_c;
    reg  [15:0] sw;
    wire [15:0] led;
    wire [6:0]  Cnode;
    wire        dp;
    wire [7:0]  AN;

    lab4_top dut (
        .CLK100MHZ (clk),
        .BTN_C     (btn_c),
        .SW        (sw),
        .LED       (led),
        .Cnode     (Cnode),
        .DP        (dp),
        .AN        (AN)
    );

    initial clk = 0;
    always #5 clk = ~clk;          // 100 MHz

    initial begin
        btn_c = 1'b1;              // assert reset
        sw    = 16'h0000;
        #100
        btn_c = 1'b0;              // deassert reset

        /* Walk a 1 across the switches */
        repeat (16) begin
            sw = (sw == 16'h0000) ? 16'h0001 : (sw << 1);
            #10_000;
        end

        $stop;
    end

endmodule
