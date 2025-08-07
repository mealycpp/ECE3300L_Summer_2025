module shamt_counter(
    input wire clk,
    input wire rst,
    input wire inc,
    output reg [1:0] shamt_bits = 0
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            shamt_bits <= 0;
        else if (inc)
            shamt_bits <= shamt_bits + 1;
    end
endmodule



