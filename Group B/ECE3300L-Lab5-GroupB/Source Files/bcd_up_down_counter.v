`timescale 1ns / 1ps
module bcd_up_down_counter (
    input wire clk,
    input wire rst_n,
    input wire dir,
    output reg [3:0] digit0,
    output reg [3:0] digit1
);
    wire rollover_up   = (digit0 == 4'd9) && dir;
    wire rollover_down = (digit0 == 4'd0) && ~dir;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            digit0 <= 4'd0;
            digit1 <= 4'd0;
        end else begin
            if (dir) begin
                digit0 <= (digit0 == 4'd9) ? 4'd0 : digit0 + 1;
            end else begin
                digit0 <= (digit0 == 4'd0) ? 4'd9 : digit0 - 1;
            end
            if (rollover_up)
                digit1 <= (digit1 == 4'd9) ? 4'd0 : digit1 + 1;
            else if (rollover_down)
                digit1 <= (digit1 == 4'd0) ? 4'd9 : digit1 - 1;
        end
    end
endmodule
