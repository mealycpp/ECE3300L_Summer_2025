`timescale 1ns / 1ps

module bcd_counter #(
    parameter MAX = 4'd9        // terminal count (default 9 for BCD)
)(
    input  wire        clk,
    input  wire        rst_n,   // asynchronous, active-low
    input  wire        dir,     // 1 = up, 0 = down
    output reg  [3:0]  bcd
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bcd <= 4'd0;
        else if (dir) begin                          // count up
            if (bcd == MAX)
                bcd <= 4'd0;
            else
                bcd <= bcd + 1'b1;
        end else begin                               // count down
            if (bcd == 4'd0)
                bcd <= MAX;
            else
                bcd <= bcd - 1'b1;
        end
    end
endmodule