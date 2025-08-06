`timescale 1ns / 1ps

module debounce_tick_tb;

    reg clk_1kHz = 0;
    reg btn_raw;

    wire tick;

    debounce_tick uut (
        .clk_1kHz(clk_1kHz),
        .btn_raw(btn_raw),
        .tick(tick)
    );

    always #500_000 clk_1kHz = ~clk_1kHz;

    initial begin
        $display("Starting debounce_tick_tb...");
        btn_raw = 0;
        #2_000_000; 

        $display("Simulating noisy button press...");
        #10_000; btn_raw = 1; 
        #10_000; btn_raw = 0; 
        #20_000; btn_raw = 1; 
        #1_000_000; 
        
        $display("Button press is now stable high.");
        #5_000_000; 

        $display("Simulating button release...");
        btn_raw = 0;
        #10_000_000; 

        $display("Simulation finished.");
        $finish;
    end
    
    initial begin
        $dumpfile("debounce_tick_tb.vcd");
        $dumpvars(0, debounce_tick_tb);
    end

endmodule