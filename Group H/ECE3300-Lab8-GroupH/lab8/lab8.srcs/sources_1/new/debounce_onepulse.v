`timescale 1ns/1ps
module debounce_onepulse #(
    parameter integer STABLE_TICKS = 20
)(
    input  wire clk,
    input  wire rst, // Changed to active-high
    input  wire din,
    output reg  pulse = 1'b0
);

    reg d0, d1; // Synchronizer flip-flops
    reg stable;
    reg prev_stable;
    reg [$clog2(STABLE_TICKS)-1:0] cnt;

    // Synchronize the async input `din` to the clock domain
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            d0 <= 1'b0;
            d1 <= 1'b0;
        end else begin
            d0 <= din;
            d1 <= d0;
        end
    end

    // Debounce logic: wait for the signal to be stable for STABLE_TICKS cycles
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
            stable <= 1'b0;
        end else if (d1 != stable) begin
            if (cnt == STABLE_TICKS - 1) begin
                stable <= d1;
                cnt <= 0;
            end else begin
                cnt <= cnt + 1;
            end
        end else begin
            cnt <= 0;
        end
    end

    // Edge detector: generate a single pulse on the rising edge of `stable`
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev_stable <= 1'b0;
            pulse <= 1'b0;
        end else begin
            prev_stable <= stable;
            pulse <= stable & ~prev_stable;
        end
    end

endmodule