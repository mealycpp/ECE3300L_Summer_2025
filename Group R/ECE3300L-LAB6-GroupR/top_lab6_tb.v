`timescale 1ns / 1ps


module top_lab6_tb;

    reg clk = 0;
    reg btn0 = 0;                   // Reset_n (Active Low)
    reg [7:0] sw = 8'b00000000;     // All switches
    wire [7:0] led;
    wire [6:0] seg;
    wire [3:0] an;

    top_lab6 uut (
        .clk(clk),
        .btn0(btn0),
        .sw(sw),
        .led(led),
        .seg(seg),
        .an(an)
    );

    always #5 clk = ~clk;  // 100 MHz clock

    initial begin
        $display("TOP SYSTEM Testbench Start");

        // Reset pulse
        btn0 = 0; #50;
        btn0 = 1;

        // Set SW[4:0] = 5 (bit 5 of clock_divider, moderate speed)
        sw[4:0] = 5;

        // Set direction: SW7 = 1 (units up), SW8 = 0 (tens down)
        sw[7] = 1;  // Units UP
        sw[6] = 0;  // Tens DOWN

        // Set ALU op = ADD (SW6:5 = 00)
        sw[6] = 0;
        sw[5] = 0;

        // Wait a bit
        #500000;

        // Change ALU op = SUB (SW6:5 = 01)
        sw[6] = 0;
        sw[5] = 1;

        #500000;

        // Final output (use waveform viewer)
        $display("TOP SYSTEM Testbench Done");
        $finish;
    end


endmodule
