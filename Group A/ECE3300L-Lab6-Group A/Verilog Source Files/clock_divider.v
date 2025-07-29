`timescale 1ns / 1ps

module clock_divider (
    input clk,              
    input rst_n,            
    input [4:0] SW,
    output clk_out   
);
    reg [31:0] cnt = 32'd0;
    
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            cnt <= 32'd0;
        else
            cnt <= cnt + 1;
    assign clk_out = cnt[SW];
endmodule
