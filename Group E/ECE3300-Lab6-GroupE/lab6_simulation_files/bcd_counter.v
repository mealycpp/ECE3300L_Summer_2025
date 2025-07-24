`timescale 1ns / 1ps

module bcd_counter(
    input clk,
    input rst_n,
    input dir,            // 1 = up, 0 = down
    output reg [3:0] BCD  // 4-bit BCD output
);

    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            BCD <= 0;
        else if (dir) begin
            if (BCD == 9)
                BCD <= 0;
            else
                BCD <= BCD + 1;
        end else begin
            if (BCD == 0)
                BCD <= 9;
            else
                BCD <= BCD - 1;
        end
endmodule
