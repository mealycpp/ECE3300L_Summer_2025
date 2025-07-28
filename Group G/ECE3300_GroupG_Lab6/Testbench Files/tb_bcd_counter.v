`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:57:19 PM
// Design Name: 
// Module Name: tb_bcd_counter
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


module tb_bcd_counter();
    reg clk_div = 0;
    reg BTN0 = 1;
    reg dir_bit;
    wire [3:0] bcd_out;

    bcd_counter uut (.clk_div(clk_div), .BTN0(BTN0), .dir_bit(dir_bit), .bcd_out(bcd_out));

    always #5 clk_div = ~clk_div;

    initial begin
        BTN0 = 0; #10; BTN0 = 1;
        dir_bit = 1; // count up
        #200;
        dir_bit = 0; // count down
        #200;
        $stop;
    end
endmodule

