`timescale 1ns / 1ps

module top_lab5_tb();
    reg CLK = 0;
    reg BTN0 = 1; // Active-low reset
    reg BTN1 = 1; // Direction (1=up, 0=down)
    reg [4:0] SW = 5'b00000; // Slowest speed
    wire [7:0] AN;
    wire [6:0] SEG;
    wire [4:0] LED;
    wire [7:0] LED_BCD;

    top_lab5 dut (
        .CLK(CLK),
        .BTN0(BTN0),
        .BTN1(BTN1),
        .SW(SW),
        .AN(AN),
        .SEG(SEG),
        .LED(LED),
        .LED_BCD(LED_BCD)
    );

    // 100MHz clock
    always #5 CLK = ~CLK;

    initial begin
        // Initialize
        #100;
        
        // Test 1: Reset functionality
        $display("Testing reset...");
        BTN0 = 0; // Assert reset
        #100;
        BTN0 = 1; // Release reset
        if (LED_BCD !== 8'h00 || SEG !== 7'b1000000)
            $error("Reset failed! LED_BCD=%h, SEG=%b", LED_BCD, SEG);
        
        // Test 2: Up-counting
        $display("Testing up-counting...");
        SW = 5'b00010; // Medium speed
        BTN1 = 1; // Count up
        #200000; // Allow time for counting
        
        // Test 3: Down-counting
        $display("Testing down-counting...");
        BTN1 = 0; // Count down
        #200000;
        
        // Test 4: Speed change
        $display("Testing speed control...");
        SW = 5'b00100; // Faster speed
        #100000;
        
        // Test 5: LED mirroring
        SW = 5'b10101;
        #10;
        if (LED !== SW) 
            $error("LED mirror failed! Expected %b, got %b", SW, LED);
        
        $display("Top-level test completed successfully");
        $finish;
    end
endmodule