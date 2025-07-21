`timescale 1ns / 1ps

module clock_divider(
    input wire clk,
    input wire rst_n,
    output reg [31:0] cnt
);

    always @(posedge clk or negedge rst_n) //Clock counter- divides frequency from clock 100MHz
        begin
            if (!rst_n)
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
    
endmodule
