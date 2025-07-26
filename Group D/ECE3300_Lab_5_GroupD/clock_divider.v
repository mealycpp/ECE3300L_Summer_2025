//jaden

module clock_divider (
    input clk,
    output reg [31:0] cnt
);
    always @(posedge clk) begin
        cnt <= cnt + 1;
    end
endmodule
