`timescale 1ns / 1ps
module mux32x1(
        input [4:0] Sel,
        input [31:0] cnt,
        output clk_out
    );  

    assign clk_out = cnt[Sel];
    
endmodule
