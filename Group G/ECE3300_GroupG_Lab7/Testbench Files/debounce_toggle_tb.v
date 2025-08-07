`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 08:02:53 PM
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
    reg clk_1khz;
    reg btn_raw;
    wire btn_toggle;

    debounce_toggle uut (
        .CLK_1KHZ(clk_1khz),
        .BTN_RAW(btn_raw),
        .BTN_TOGGLE(btn_toggle)
    );

    initial begin
        clk_1khz = 0;
        forever #500 clk_1khz = ~clk_1khz; // 1 kHz
    end

    initial begin
        $display("Testing debounce_toggle");
        btn_raw = 0;
        #2000;

        // Simulate bouncing
        btn_raw = 1; #750;
        btn_raw = 0; #250;
        btn_raw = 1; #500;
        btn_raw = 1; #1000;
        btn_raw = 0; #1000;
        btn_raw = 1; #1500;

        $finish;
    end
endmodule