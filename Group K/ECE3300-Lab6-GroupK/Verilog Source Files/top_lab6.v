`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dalton Hoang
// 
// Create Date: 07/26/2025 12:13:04 PM
// Design Name: 
// Module Name: top_lab6
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dalton Hoang
// 
// Create Date: 07/26/2025 12:13:04 PM
// Design Name: 
// Module Name: top_lab6
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Updated top module using actual Verilog module definitions
//////////////////////////////////////////////////////////////////////////////////

module top_lab6(
    input wire clk,
    input wire [8:0] SW,
    input wire BTN0,
    
    output wire [7:0] LED,
    output wire [7:0] AN,
    output wire [6:0] SEG
    );
    
    wire [3:0] ones;
    wire [3:0] tens; 
    wire [3:0] ctrl_nibble;
    wire [31:0] count;
    wire clk_div;
    wire [7:0] result;
    
    clk_divider u_clk_div(
        .clk(clk), 
        .reset_n(BTN0), 
        .sel(SW[4:0]), 
        .counter(count),
        .clk_div(clk_div) 
    );
    
    bcd_counter u_ones(
        .clk(clk_div),
        .dir(SW[7]), 
        .rst_n(BTN0), 
        .value(ones)
    );
    
    bcd_counter u_tens(
        .clk(clk_div), 
        .dir(SW[8]),
        .rst_n(BTN0), 
        .value(tens)
    );
    
    control_decoder u_ctrl_dec(
        .ctrl_in(SW[8:5]),
        .ctrl_out(ctrl_nibble)
    );
   
    alu u_alu(
        .A(ones), 
        .B(tens), 
        .ctrl(SW[6:5]), 
        .result(result)
    );
    
    seg7_scan u_display(
        .clk(clk),
        .rst_n(BTN0), 
        .lower_digit(result[3:0]), 
        .upper_digit(result[7:4]), 
        .ctrl_nibble(ctrl_nibble), 
        .seg(SEG), 
        .an(AN)
    );
    
    assign LED = result;
    assign AN[7:3] = 5'b11111;          
                
endmodule