`timescale 1ns / 1ps

module top_lab6_tb;

    // Testbench signals
    reg CLK_tb;
    reg BTN0_tb;
    reg [8:0] SW_tb;
    wire [7:0] LED_tb;
    wire [7:0] AN_tb;
    wire [6:0] SEG_tb;

    // Instantiate the top module (DUT)
    top_lab6 uut (
        .CLK(CLK_tb),
        .BTN0(BTN0_tb),
        .SW(SW_tb),
        .LED(LED_tb),
        .AN(AN_tb),
        .SEG(SEG_tb)
    );

    // Clock generation: 100 MHz
    initial CLK_tb = 0;
    always #5 CLK_tb = ~CLK_tb; // 10ns period

    initial begin
        // Initialize
        BTN0_tb = 1;           // Inactive reset (BTN0 pulled high)
        SW_tb = 9'b000000000;  // All switches off

        // Reset sequence
        #20 BTN0_tb = 0;       // Active reset
        #40 BTN0_tb = 1;       // Release reset

        // Test case 1: Slow clock, count up both units and tens
        SW_tb[4:0] = 5'b10100; // Select a slower clk_div
        SW_tb[7] = 1;          // dir_bit for units BCD (count up)
        SW_tb[8] = 1;          // dir_bit for tens BCD (count up)
        SW_tb[6:5] = 2'b00;    // ALU control: A + B

        #2000;

        // Test case 2: Count down units, add mode
        SW_tb[7] = 0;          // dir_bit for units BCD (count down)
        SW_tb[8] = 1;          // tens keep counting up
        SW_tb[6:5] = 2'b00;    // ALU: A + B
        #2000;

        // Test case 3: ALU subtract mode
        SW_tb[6:5] = 2'b01;    // ALU: A - B
        #2000;

        // Test case 4: Switch to control nibble input
        SW_tb[8:5] = 4'b1010;  // Control nibble test input
        #2000;

        $finish;
    end
endmodule
