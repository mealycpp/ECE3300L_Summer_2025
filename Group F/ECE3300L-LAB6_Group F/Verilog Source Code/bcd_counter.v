module bcd_counter (
    input wire clk,
    input wire reset_n,      // Active-low reset
    input wire dir,          // 1 = up, 0 = down
    output reg [3:0] q       // 4-bit BCD output (0–9)
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            q <= 0;
        else if (dir) begin
            if (q == 9)
                q <= 0;
            else
                q <= q + 1;
        end
        else begin
            if (q == 0)
                q <= 9;
            else
                q <= q - 1;
        end
    end
endmodule
