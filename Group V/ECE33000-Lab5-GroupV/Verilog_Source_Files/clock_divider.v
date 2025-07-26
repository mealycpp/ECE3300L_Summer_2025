module clock_divider(
    input clk,
    input rst_n,
    output reg [31:0] cnt
);
//count is 0 if reset, else increment every clock cycle
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end
endmodule