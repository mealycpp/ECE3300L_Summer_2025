//bryan

module shamt_counter(
    input clk,
    input rst,
    input btn_center,
    output reg [1:0] shamt_high
);
    reg prev = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shamt_high <= 0;
            prev <= 0;
        end else begin
            if (btn_center && !prev)
                shamt_high <= shamt_high + 1;
            prev <= btn_center;
        end
    end
endmodule
