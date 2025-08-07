`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/04/2025 12:07:47 AM
// Design Name: 
// Module Name: top_lab7
// Project Name: top_lab7
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


module top_lab7(
    input wire clk,                  
    input wire [15:0] SW,         
    input wire [4:0] BTN,               // 4 = shift, 3 = shamnt1, 2 = shamnt0, 1 = shift/cycle, 0 = direction
    output wire [7:0] LED,        
    output wire [6:0] SEG,       
    output wire DP,
    output wire [7:0] AN         
    );
    // Debug LEDs
    assign LED[1:0] = 2'b00;
    assign LED[5:2] = shamnt;
    assign LED[6] = rot;
    assign LED[7] = dir;
    
    wire rst_n;
    wire clk_rst;
    assign DP = 1;
    wire clk_1kHz, clk_2Hz;
        clk_divider clkdiv (
            .clk(clk),
            .rst_n(clk_rst),
            .clk_out(clk_1kHz)
        );

    // Buttons Debounced
    wire dir, rot;
    wire [1:0] shamnt0;
    wire [1:0] shamnt1;
    wire btnc_toggle;

            debounce_toggle dir_db (.clk(clk_1kHz), .btn_input(BTN[0]), .btn_toggle(dir));      // BTND
            debounce_toggle rot_db (.clk(clk_1kHz), .btn_input(BTN[1]), .btn_toggle(rot));      // BTNU
            debounce_toggle shamnt0_db (.clk(clk_1kHz), .btn_input(BTN[2]), .btn_toggle(shamnt1[0])); // BTNL
            debounce_toggle shamnt1_db (.clk(clk_1kHz), .btn_input(BTN[3]), .btn_toggle(shamnt1[1])); // BTNR
                
     // Barrel Shifter
        wire [15:0] barrel_out;
            barrel_shifter16 bshift (
                .data_in(SW[15:0]),
                .shamnt(shamnt),
                .dir(dir),
                .rotate(rot),
                .data_out(barrel_out)
            );
                   
    // shamnt
        wire btnc = BTN[4];
        assign rst_n = ~btnc_input;
        assign clk_rst = 1; // turn off reset
                shamnt_counter shamnt_c (
                    .clk(clk_1kHz),           
                    .btn_input(btnc_input),        //Straight btnc input
                    .shamnt(shamnt0)   
        );

        wire [3:0] shamnt = {shamnt0, shamnt1};
        
    // Seg Scan
        wire [3:0] ones, tens, hundreds, thousands;
        assign ones = barrel_out[3:0];
        assign tens = barrel_out[7:4];
        assign hundreds = barrel_out[11:8];
        assign thousands = barrel_out[15:12];
            seg7scan8 segscan (
                .clk(clk),
                .rst_n(rst_n),
                .onesP(ones),
                .tensP(tens),
                .hundredsP(hundreds),
                .thousandsP(thousands),
                .SEG(SEG),
                .AN(AN)
            );
   
endmodule