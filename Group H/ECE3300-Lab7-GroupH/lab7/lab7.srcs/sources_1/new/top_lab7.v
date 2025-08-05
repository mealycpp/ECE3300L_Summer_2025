`timescale 1ns / 1ps

module top_lab7(
    input wire CLK,              
    input wire [15:0] SW,       
    input wire [4:0] BTN,        
    output wire [7:0] LED,      
    output wire [6:0] SEG,       
    output wire [7:0] AN        
);

    wire clk_1kHz;
    wire clk_2Hz_demo;
    clock_divider_fixed clkdiv (
        .clk(CLK),
        .clk_1kHz(clk_1kHz),
        .clk_2Hz(clk_2Hz_demo)
    );

    wire dir_toggled, rot_toggled, shamt0_toggled, shamt1_toggled;

    debounce_toggle db_dir (.clk_1kHz(clk_1kHz), .btn_raw(BTN[0]), .btn_toggle(dir_toggled));
    debounce_toggle db_rot (.clk_1kHz(clk_1kHz), .btn_raw(BTN[1]), .btn_toggle(rot_toggled));
    debounce_toggle db_s0  (.clk_1kHz(clk_1kHz), .btn_raw(BTN[2]), .btn_toggle(shamt0_toggled));
    debounce_toggle db_s1  (.clk_1kHz(clk_1kHz), .btn_raw(BTN[3]), .btn_toggle(shamt1_toggled));

    wire btnc_tick;
    debounce_tick db_btnc (.clk_1kHz(clk_1kHz), .btn_raw(BTN[4]), .tick(btnc_tick));

    wire [1:0] shamt_high_bits;
   
    shamt_counter shamtctr (
        .clk_1kHz(clk_1kHz), 
        .btn_tick(btnc_tick),  
        .shamt_high(shamt_high_bits)
    );
    
    wire [3:0] shamt;
    assign shamt = {shamt_high_bits, shamt1_toggled, shamt0_toggled};

    wire [15:0] shifter_result;
    barrel_shifter16 shifter (
        .data_in(SW),
        .shamt(shamt),
        .dir(dir_toggled),     
        .rotate(rot_toggled), 
        .data_out(shifter_result)
    );

    assign LED[7:4] = shamt;
    assign LED[3]   = rot_toggled;
    assign LED[2]   = dir_toggled;
    assign LED[1:0] = 2'b00; 

    wire [6:0] seg_data_d3, seg_data_d2, seg_data_d1, seg_data_d0;

    hex_to_7seg h3 (.hex(shifter_result[15:12]), .seg(seg_data_d3)); 
    hex_to_7seg h2 (.hex(shifter_result[11:8]),  .seg(seg_data_d2));
    hex_to_7seg h1 (.hex(shifter_result[7:4]),   .seg(seg_data_d1));
    hex_to_7seg h0 (.hex(shifter_result[3:0]),   .seg(seg_data_d0)); 

    wire [55:0] flat_seg_data = {7'h7F, 7'h7F, 7'h7F, 7'h7F, seg_data_d3, seg_data_d2, seg_data_d1, seg_data_d0};

    seg7_scan8 scanner (
        .clk(clk_1kHz),
        .hex_seg_flat(flat_seg_data),
        .an(AN),
        .seg(SEG)
    );

endmodule