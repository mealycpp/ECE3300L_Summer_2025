`timescale 1ns / 1ps

module bcd_up_down_counter_tb();
    // Clock and control signals
    reg clk = 0;
    reg rst_n = 1;
    reg dir = 1;  // 1=up, 0=down
    wire [3:0] units, tens;
    
    // Instantiate counter
    bcd_up_down_counter dut (
        .clk_div(clk),
        .rst_n(rst_n),
        .dir(dir),
        .digit0(units),
        .digit1(tens)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        $display("Starting BCD Counter Test");
        
        // Test 1: Reset check
        rst_n = 0; #20;
        if (units != 0 || tens != 0) $error("Reset failed!");
        rst_n = 1;
        
        // Test 2: Count up to 15
        dir = 1;
        repeat(15) @(posedge clk);
        if ({tens,units} != 8'h15) $error("Up-count failed at 15");
        
        // Test 3: Count down to 5
        dir = 0;
        repeat(10) @(posedge clk);
        if ({tens,units} != 8'h05) $error("Down-count failed at 5");
        
        // Test 4: Rollover up (99->00)
        dir = 1;
        dut.digit0 = 9;
        dut.digit1 = 9;
        @(posedge clk);
        if ({tens,units} != 8'h00) $error("99->00 rollover failed");
        
        // Test 5: Rollover down (00->99)
        dir = 0;
        dut.digit0 = 0;
        dut.digit1 = 0;
        @(posedge clk);
        if ({tens,units} != 8'h99) $error("00->99 rollover failed");
        
        $display("All basic tests passed!");
        $finish;
    end
endmodule