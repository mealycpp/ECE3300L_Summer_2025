`timescale 1ns / 1ps

module clock_divider (
    input clk,              
    input rst_n,            
    output reg [31:0] cnt   
);
   
   
    always @(posedge clk or negedge rst_n)
                if (!rst_n)
                    cnt <= 32'd0;   
                else
                    cnt <= cnt + 1; 


endmodule