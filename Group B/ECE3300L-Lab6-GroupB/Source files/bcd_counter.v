module bcd_counter(
    input clk,
    input rst_n,
    input dir,
    output reg [3:0] bcd
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bcd <= 4'd0;
        else if (dir)
            bcd <= (bcd == 4'd9) ? 4'd0 : bcd + 1;
        else
            bcd <= (bcd == 4'd0) ? 4'd9 : bcd - 1;
    end
endmodule

