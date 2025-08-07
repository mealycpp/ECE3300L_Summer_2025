`timescale 1ns / 1ps

module top_lab7_tb;

    // Inputs
    reg clk = 0;
    reg btnc = 0;
    reg [15:0] sw = 16'hA5A5;      // Set switches
    reg [4:1] btn = 4'b0000;       // Buttons

    // Outputs
    wire [6:0] seg;
    wire [7:0] an;
    wire [7:0] led;

    // Instantiate DUT
    top_lab7 uut (
        .clk(clk),
        .btnc(btnc),
        .sw(sw),
        .btn(btn),
        .seg(seg),
        .an(an),
        .led(led)
    );

    // 100MHz Clock (10ns period)
    always #5 clk = ~clk;

    initial begin
        $display("Time\t\tLED\t\tAN\t\tSEG");
        $monitor("%0t\t%b\t%b\t%b", $time, led, an, seg);

        // Wait for clock dividers to activate (>= 1ms)
        #2_000_000; // 2 ms

        // Toggle BTNU (dir)
        btn[1] = 1; #40_000; btn[1] = 0; #500_000;

        // Toggle BTND (rot)
        btn[4] = 1; #40_000; btn[4] = 0; #500_000;

        // Toggle BTNL (shamt[0])
        btn[2] = 1; #40_000; btn[2] = 0; #500_000;

        // Toggle BTNR (shamt[1])
        btn[3] = 1; #40_000; btn[3] = 0; #500_000;

        // Toggle BTNC (shamt_high increment)
        btnc = 1; #40_000; btnc = 0; #1_000_000;

        // Let display settle and scan
        #2_000_000;

        $finish;
    end
endmodule
