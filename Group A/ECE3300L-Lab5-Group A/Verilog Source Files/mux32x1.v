`timescale 1ns / 1ps

module mux32x1 (
    input [31:0] cnt,     
    input [4:0] sel,    
    output clk_out            
);
    assign clk_out = cnt[sel];
endmodule
