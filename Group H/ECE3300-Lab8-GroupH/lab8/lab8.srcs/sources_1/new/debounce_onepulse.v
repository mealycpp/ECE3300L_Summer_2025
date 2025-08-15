`timescale 1ns/1ps
module debounce_onepulse #(
    parameter integer STABLE_TICKS = 20
)(
    input  wire clk,
    input  wire rst,    // active-high
    input  wire din,
    output reg  pulse = 1'b0
);
    reg d0, d1;
    reg stable, prev_stable;
    reg [$clog2(STABLE_TICKS+1)-1:0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin d0 <= 1'b0; d1 <= 1'b0; end
        else begin d0 <= din; d1 <= d0; end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin cnt <= 0; stable <= 1'b0; end
        else if (d1 != stable) begin
            if (cnt == STABLE_TICKS) begin stable <= d1; cnt <= 0; end
            else cnt <= cnt + 1;
        end else cnt <= 0;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin prev_stable <= 1'b0; pulse <= 1'b0; end
        else begin prev_stable <= stable; pulse <= stable & ~prev_stable; end
    end
endmodule
