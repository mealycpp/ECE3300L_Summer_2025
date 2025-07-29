`timescale 1ns / 1ps
module top_lab6_tb;

    reg CLK = 0;
    reg BTN0 = 0;
    reg [8:0] SW = 9'b000000000;

    wire [6:0] SEG;
    wire [7:0] AN;
    wire [7:0] LED;

    top_lab6 uut (
        .CLK(CLK),
        .SW(SW),
        .BTN0(BTN0),
        .SEG(SEG),
        .AN(AN),
        .LED(LED)
    );

    always #5 CLK = ~CLK;

    initial begin
        $display("Starting top_lab6_tb");
        $monitor("Time = %0t | LED = %b | SEG = %b | AN = %b", $time, LED, SEG, AN);
    
        // Initial reset
        BTN0 = 0; #20;
        BTN0 = 1;
    
        SW[4:0] = 5'd16;
    
        // Set ALU to ADD mode
        SW[6:5] = 2'b00;
    
        // Count up on both counters
        SW[7] = 1; // units
        SW[8] = 1; // tens
    
        // Simulate longer to see counting
        #50000;
    
        
    end

endmodule
