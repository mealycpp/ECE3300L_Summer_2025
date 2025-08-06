`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 08:44:57 PM
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

module debounce_toggle_tb();

    reg  CLK_1KHZ = 0;        
    reg  BTN_RAW = 0;
    wire btn_toggle;

    always #5_000 CLK_1KHZ = ~CLK_1KHZ;

    debounce_toggle dut (
        .CLK_1KHZ  (CLK_1KHZ),
        .BTN_RAW   (BTN_RAW),
        .BTN_TOGGLE(btn_toggle)
    );

    initial begin
        #20_000;

        BTN_RAW = 1; #500;     
        BTN_RAW = 0; #400;
        BTN_RAW = 1; #800;
        BTN_RAW = 0; #600;
        BTN_RAW = 1;        
        #100_000;

        BTN_RAW = 0; #500;
        BTN_RAW = 1; #400;
        BTN_RAW = 0; #800;
        BTN_RAW = 1; #600;
        BTN_RAW = 0;            
        #100_000;

        BTN_RAW = 1; #200_000;
        BTN_RAW = 0; #200_000;

        BTN_RAW = 1; #200; 
        BTN_RAW = 0; #100_000;

        BTN_RAW = 1; #200_000;
        BTN_RAW = 0; #200_000;

        #50_000;
        $finish;
    end
endmodule