`timescale 1ns / 1ps

module top_lab5_tb;

    // Inputs
    reg clk = 0;
    reg [4:0] SW = 5'd1;   // Initial slow speed
    reg [1:0] BTN = 2'b11; // BTN[0]=inactive (reset off), BTN[1]=1 (count up)

    // Outputs
    wire [7:0] AN;
    wire [6:0] SEG;
    wire [12:0] LED;

    // Instantiate the Unit Under Test (UUT)
    top_lab5 uut (
        .clk(clk),
        .SW(SW),
        .BTN(BTN),
        .AN(AN),
        .SEG(SEG),
        .LED(LED)
    );

    // Generate clock: 10ns period => 100MHz
    always #5 clk = ~clk;

    initial begin
        $display("Starting Simulation...");
        $monitor("Time=%0t | SW=%b | BTN=%b | digit1=%d, digit0=%d | LED[12:5]=%b", 
                  $time, SW, BTN, uut.digit1, uut.digit0, LED[12:5]);

        // Initial reset
        BTN[0] = 0; // Activate reset
        #100;
        BTN[0] = 1; // Release reset

        // Count up for some time
        BTN[1] = 1;
        #100000;

        // Change clock speed (simulate faster update)
        SW = 5'd2;
        #100000;

        // Count down
        BTN[1] = 0;
        #100000;

        // Increase speed again
        SW = 5'd11;
        #100000;

        // Final reset
        BTN[0] = 0;
        #100;
        BTN[0] = 1;

        $finish;
    end

endmodule
