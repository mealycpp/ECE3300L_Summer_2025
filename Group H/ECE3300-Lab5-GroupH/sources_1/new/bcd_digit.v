`timescale 1ns/1ps
module bcd_digit (
    input  wire clk,
    input  wire enable,
    input  wire dir,
    input  wire rst_n,
    output reg  [3:0] value,
    output reg        roll_out
);
    wire at_max = value == 4'd9;
    wire at_min = value == 4'd0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            value    <= 4'd0;
            roll_out <= 1'b0;
        end else begin
            roll_out <= 1'b0;            // default: no roll
            if (enable) begin
                if (dir) begin           // counting up
                    value    <= at_max ? 4'd0   : value + 4'd1;
                    roll_out <=  at_max;
                end else begin           // counting down
                    value    <= at_min ? 4'd9   : value - 4'd1;
                    roll_out <=  at_min;
                end
            end
        end
    end
endmodule