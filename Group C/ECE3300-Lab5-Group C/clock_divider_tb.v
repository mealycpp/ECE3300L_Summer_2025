`timescale 1ns / 1ps

module clock_divider_tb();
    reg CLK;
    wire [31:0] cnt;

    clock_divider dut(.CLK(CLK), .cnt(cnt));

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 100MHz clock
    end

    initial begin
        $monitor("At time %t, cnt[31:0] = %h", $time, cnt);
        #1000;
        
        // Verify counter increments
        if (cnt !== 1000/10) 
            $error("Counter mismatch! Expected %d, got %d", 1000/10, cnt);
        
        #3400000000; 
        if (cnt !== 0) 
            $error("Rollover failed!");
        
        $display("Clock divider test passed");
        $finish;
    end
endmodule