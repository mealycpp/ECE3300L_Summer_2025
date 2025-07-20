`timescale 1ns / 1ps

module seg7_scan_tb();
    reg CLK = 0;
    reg [3:0] digit0 = 0, digit1 = 0;
    wire [7:0] AN;
    wire [6:0] SEG;
    integer i; 

    seg7_scan dut (
        .CLK(CLK),
        .digit0(digit0),
        .digit1(digit1),
        .AN(AN),
        .SEG(SEG)
    );

    // 100MHz clock
    always #5 CLK = ~CLK;

    initial begin
        #100;
        
        // Test Case 1: Display '0' and '1'
        digit0 = 0;
        digit1 = 1;
        #20000; // Wait for 2 refresh cycles
        
        // Verify digit0 
        wait(AN == 8'b11111110);
        if (SEG !== 7'b1000000) 
            $error("Digit0 error: Expected 7'b1000000 (0), got %b", SEG);
        
        // Verify digit1 
        wait(AN == 8'b11111101);
        if (SEG !== 7'b1111001) 
            $error("Digit1 error: Expected 7'b1111001 (1), got %b", SEG);
        
        $display("Testing all digits...");
        for (i = 0; i < 10; i = i + 1) begin
            digit0 = i;
            digit1 = 9 - i;
            #20000; // Wait 2 refresh cycles
            $display("Set: %d and %d | SEG output: %b", i, 9-i, SEG);
        end
        
        $display("7-segment test completed successfully");
        $finish;
    end
endmodule