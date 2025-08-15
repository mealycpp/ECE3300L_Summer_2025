`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 07:01:44 PM
// Design Name: 
// Module Name: load_fsm_tb
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


module load_fsm_tb(

    );
    
    reg clk;
    reg rst_n;
    reg load_pulse;
    wire [1:0] slot;
    wire [3:0] slot_onehot;
    wire wr_res, wr_r, wr_g, wr_b;
    
    load_fsm fsm(clk, rst_n, load_pulse, slot, slot_onehot, wr_res, wr_r, wr_g, wr_b);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst_n = 1;
        #5 rst_n = 0;
        #5 rst_n = 1;
        #10 load_pulse = 1;
        #10 load_pulse = 0;
        #10 load_pulse = 1;
        #10 load_pulse = 0;
        #10 load_pulse = 1;
        #10 load_pulse = 0;
        #10 load_pulse = 1;
        #10 load_pulse = 0;
    end
    
endmodule
