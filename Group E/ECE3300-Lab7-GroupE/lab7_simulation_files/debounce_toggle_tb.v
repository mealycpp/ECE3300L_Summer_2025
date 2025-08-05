`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 11:31:27 AM
// Design Name: 
// Module Name: debounce_toggle_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module debounce_toggle_tb;

    reg  clk = 0;        
    reg  btn_raw = 0;
    wire btn_toggle;

    always #5_000 clk = ~clk;

    debounce_toggle dut (
        .clk_1kHz  (clk),
        .btn_raw   (btn_raw),
        .btn_toggle(btn_toggle)
    );

    task bounce_press;
        begin
            btn_raw = 1; #500;     
            btn_raw = 0; #400;
            btn_raw = 1; #800;
            btn_raw = 0; #600;
            btn_raw = 1;           // settle high
        end
    endtask

    task bounce_release;
        begin
            btn_raw = 0; #500;
            btn_raw = 1; #400;
            btn_raw = 0; #800;
            btn_raw = 1; #600;
            btn_raw = 0;           // settle low
        end
    endtask

    initial begin
        // Wait ~20 us to see some clock edges in the first 1 ms window
        #20_000;

        // Noisy press then hold ~100 us (≈10 samples at 100 kHz)
        bounce_press();
        #100_000;

        // Noisy release then hold ~100 us
        bounce_release();
        #100_000;

        // Clean press and release (longer holds)
        btn_raw = 1; #200_000;
        btn_raw = 0; #200_000;

        // Brief glitch (< one sample) that should be ignored
        btn_raw = 1; #200; btn_raw = 0; #100_000;

        // Final valid press
        btn_raw = 1; #200_000;
        btn_raw = 0; #200_000;

        #50_000;
        $finish;
    end
endmodule



