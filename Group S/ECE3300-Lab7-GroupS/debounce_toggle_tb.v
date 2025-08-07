`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 07:28:44 PM
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
    
    reg CLK_1KHZ;
    reg BTN;
    
    wire BTN_TOGGLE;
    
    debounce_toggle dut(
        .CLK_1KHZ(CLK_1KHZ),
        .BTN(BTN),
        .BTN_TOGGLE(BTN_TOGGLE)
    );
    
    always #5 CLK_1KHZ = ~CLK_1KHZ;
    initial begin
        CLK_1KHZ = 0;
        BTN = 0;
        
        #50
        BTN = 1;    //normal press
        #100
        BTN = 0;
        #500
        
        
        BTN = 1;    //bounce
        #10
        BTN = 0;
        #10
        BTN = 1;
        #10
        BTN = 0;
        #10
        
        $finish;
    end
endmodule
