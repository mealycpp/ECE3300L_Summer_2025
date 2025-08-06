`timescale 1ns / 1ps

module debounce_toggle_tb;

    reg clk_1kHz = 0;
    reg btn_raw;

    wire btn_toggle;

    debounce_toggle uut (
        .clk_1kHz(clk_1kHz),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );

    always #500_000 clk_1kHz = ~clk_1kHz; 

    initial begin
        $display("Starting debounce_toggle_tb...");
        btn_raw = 0;
        #2_000_000; 

        $display("Simulating first press...");
        #10_000; btn_raw = 1;
        #10_000; btn_raw = 0;
        #20_000; btn_raw = 1;
        #5_000_000; 
        btn_raw = 0;
        #5_000_000; 

        $display("Simulating second press...");
        #10_000; btn_raw = 1;
        #5_000_000; 
        btn_raw = 0;
        #5_000_000; 

        $display("Simulation finished.");
        $finish;
    end
    
    initial begin
        $dumpfile("debounce_toggle_tb.vcd");
        $dumpvars(0, debounce_toggle_tb);
    end

endmodule
