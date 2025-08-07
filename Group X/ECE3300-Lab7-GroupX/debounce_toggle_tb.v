`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 07:46:22 PM
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
    wire toggle;

    debounce_toggle uut (
        .clk_1khz(clk_1khz),
        .btn_raw(btn_raw),
        .toggle(toggle)
    );

    initial begin
        clk_1khz = 0;
        forever #500 clk_1khz = ~clk_1khz;
    end

    initial begin
        btn_raw = 0;
        #2000;
        btn_raw = 1;
        #10 btn_raw = 0;
        #10 btn_raw = 1;
        #1000 btn_raw = 0;
        #1000;
        $finish;
    end
endmodule

