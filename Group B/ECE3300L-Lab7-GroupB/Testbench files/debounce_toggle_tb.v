`timescale 1ns / 1ps

module debounce_toggle_tb;
    reg clk_1kHz = 0;
    reg btn_raw = 0;
    wire btn_toggle;


    debounce_toggle uut (
        .clk_1kHz(clk_1kHz),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );

    
    always #500 clk_1kHz = ~clk_1kHz;

    // Display transitions 
    initial begin
        $display("Testing debounce_toggle");
        $monitor("time=%0t btn_raw=%b btn_toggle=%b", $time, btn_raw, btn_toggle);

        #1000;

        // First press with bouncing
        $display("\n-- First press with glitches --");
        btn_raw = 1; #100;  
        btn_raw = 0; #50;
        btn_raw = 1; #30;   
        btn_raw = 0; #20;
        btn_raw = 1; #10000; 
        btn_raw = 0; #1000;  
        
        $display("\nEnd of debounce test. btn_toggle should change only twice.");
        #1000;
        $finish;
    end
endmodule



