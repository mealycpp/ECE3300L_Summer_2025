module bcd_counter(
    input clk,
    input rst_n,
    input dir,
    output reg [3:0] bcd = 0
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bcd <= 0;
        else if (dir) begin
            if (bcd == 9)
                bcd <= 0;
            else
                bcd <= bcd + 1;
        end else begin
            if (bcd == 0)
                bcd <= 9;
            else
                bcd <= bcd - 1;
        end
    end
endmodule
