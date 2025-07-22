`timescale 1ns / 1ps

module top_lab5 (
    input           CLK,     
    input           BTN0,    
    input           BTN1,    
    input  [4:0]    SW,      
    output [12:0]   LED,
    output [1:0]    AN,
    output [6:0]    SEG                
);
    wire [31:0]     cnt;
    wire            clk_out; 
    wire [3:0]      lsb0;    
    wire [3:0]      lsb1;    
    
    clock_divider u_div (
        .clk (CLK),
        .rst_n (!BTN0),   
        .cnt (cnt)
    );
        
    mux32x1 u_mux (
        .cnt (cnt),   
        .sel (SW),
        .clk_out (clk_out)
    );

    bcd_up_down_counter u_bcd (
        .clk (clk_out),  
        .rst_n (!BTN0),
        .dir (BTN1),     
        .lsb0 (lsb0),
        .lsb1 (lsb1)
    );

    seg7_scan u_scan (
        .clk (CLK),     
        .rst_n (!BTN0),
        .lsb0 (lsb0),
        .lsb1 (lsb1),
        .seg (SEG),
        .an (AN)
    );



    assign LED[4:0]     =   SW;                          
    assign LED[8:5]     =   lsb0;                      
    assign LED[12:9]    =   lsb1;                   

endmodule