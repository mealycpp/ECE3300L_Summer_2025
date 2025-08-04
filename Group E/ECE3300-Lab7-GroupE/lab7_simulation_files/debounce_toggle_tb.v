`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 12:56:07 PM
// Design Name: 
// Module Name: barrel_shifter16_tb
// Project Name: barrel_shifter16_tb
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

    reg clk = 0;
    reg btn_raw = 0;
    wire btn_toggle;

    debounce_toggle uut (
        .clk_1kHz(clk),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );

    always #500 clk = ~clk; // 1 kHz clock

    initial begin
        #2000;

        // Simulate noisy press
        btn_raw = 1; #100;
        btn_raw = 0; #100;
        btn_raw = 1; #200;
        btn_raw = 0; #100;
        btn_raw = 1; #1000;

        // Hold
        #5000;

        // Simulate noisy release
        btn_raw = 0; #100;
        btn_raw = 1; #100;
        btn_raw = 0; #200;
        btn_raw = 1; #100;
        btn_raw = 0; #1000;

        // Final clean toggle
        btn_raw = 1; #3000;
        btn_raw = 0; #3000;

        #1000;
        $finish;
    end
endmodule
