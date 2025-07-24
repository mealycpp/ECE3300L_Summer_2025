
module bcd_counter_tb (
    input clk,
    input rst_n,
    input dir,            // 1 = up, 0 = down
    output reg [3:0] bcd
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bcd <= 0;
        else begin
            if (dir) begin
                bcd <= (bcd == 9) ? 0 : bcd + 1;
            end else begin
                bcd <= (bcd == 0) ? 9 : bcd - 1;
            end
        end
    end
endmodule
