module shamt_counter(
    input  wire clk1k,
    input  wire tick,
    output reg [1:0] shamt_high = 0
);
    always @(posedge clk1k) begin
        if (tick) shamt_high <= shamt_high + 1;
    end
endmodule
