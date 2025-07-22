`timescale 1ns / 1ps

module clock_divider_tb();
    reg CLK = 0;
    wire [31:0] counter;
    
    clock_divider uut(
                      .clk(clk),
                      .counter(counter)
                      );
     
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 100MHz clock
    end

    initial begin
        $monitor("At time %t, cnt[31:0] = %h", $time, cnt);
        #1000;
        
        // Verify counter increments
        if (counter !== 1000/10) 
            $error("Counter mismatch! Expected %d, got %d", 1000/10, cnt);
        
        #50; 
        if (counter !== 0) 
            $error("Rollover failed!");
        
        $display("Clock divider test passed");
        $finish;
    end
endmodule
