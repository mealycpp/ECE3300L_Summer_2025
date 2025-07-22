`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 05:07:59 PM
// Design Name: 
// Module Name: top_lab5
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


module top_lab5(
    input CLK, 
    input  rst_n, // reset
    input  [4:0] SW, //controls the speed
    input BTN1, // controls the up/down direction
    output wire [4:0] LED, // mimics the SW
    output [6:0] SEG, // for the segments
    output DP, // decimal point
    output [7:0] AN //only have 2 displays showing
 
    );
    // put your instantiations below 
   
    wire [31:0] counter;
    wire clk_out;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire pulseOnes;
    wire [7:0] bits;
    
    assign LED = SW;
    assign bits[7:0] = {digit1[3:0], digit0[3:0]};
    // Takes in BTN1 from the xdc file, and makes sure it will toggle correctly
    // saves the clean button press into the wire below
    // also had to make .rst in the toggle !rst to work correctly since the cpu reset button is activeLOW
    // NOTE: had to put toggle-switch with the wire dir before the other instantiations to work
    wire dir;
    toggle_switch t0 (.clk(CLK), .rst(rst_n), .btn_raw(BTN1), .state(dir) );
    
    clock_divider clk1 ( .clock_in(CLK), .rst_n(rst_n), .counterIn(counter) );
    mux32x1 mux ( .sel(SW), .cnt(counter), .clk_out(clk_out) );
    
    bcd_up_down_counter units ( .clk_div(clk_out), .rst_n(rst_n), .dir(dir), .digit(digit0), .pulse(pulseOnes) );
    bcd_up_down_counter tens ( .clk_div(pulseOnes), .rst_n(rst_n), .dir(dir), .digit(digit1), .pulse() );
    
    seg7_scan display ( .CLK(CLK), .rst_n(rst_n), .bits(bits), .SEG(SEG), .AN(AN), .DP(DP) );
    
    
    
endmodule
