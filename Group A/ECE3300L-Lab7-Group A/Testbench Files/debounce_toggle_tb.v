`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 08:09:23 AM
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


module debounce_toggle_tb(

    );
    
    reg btn_raw;
    reg clk;
    wire btn_toggle;
    
    debounce_toggle debounceToggleTB (btn_raw, clk, btn_toggle);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        btn_raw = 1;
        #5 btn_raw = 0;
        #5 btn_raw = 1;
        #10 btn_raw = 0;
        #5 btn_raw = 1;
        #15 btn_raw = 0;
        #5 btn_raw = 1;
        #5 btn_raw = 0;
        #5 btn_raw = 1;
        #10 btn_raw = 0;
        #5 btn_raw = 1;
        #15 btn_raw = 1;
        #5 btn_raw = 0;
        #20 btn_raw = 1;
        #5 btn_raw = 0;
        #20 btn_raw = 1;
    end
    
endmodule
