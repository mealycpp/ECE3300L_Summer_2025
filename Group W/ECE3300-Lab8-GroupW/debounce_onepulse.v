`timescale 1ns/1ps
module debounce_onepulse #(
    parameter integer STABLE_TICKS = 20
)(
    input wire clk,
    input wire rst_n,
    input wire din,
    output reg pulse
);

localparam CNT_WIDTH = $clog2(STABLE_TICKS + 1);
reg [CNT_WIDTH-1:0] cnt;

reg d0, d1;
reg stable, stable_q;

// Input synchronizer
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        d0 <= 0;
        d1 <= 0;
    end else begin
        d0 <= din;
        d1 <= d0;
    end
end

// Stability counter
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt    <= 0;
        stable <= 0;
    end else if (d1 != stable) begin
        if (cnt == STABLE_TICKS) begin
            stable <= d1;
            cnt    <= 0;
        end else begin
            cnt <= cnt + 1;
        end
    end else begin
        cnt <= 0;
    end
end

// One-pulse generator
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        stable_q <= 0;
        pulse    <= 0;
    end else begin
        pulse    <= (~stable_q) & stable;
        stable_q <= stable;
    end
end

endmodule
