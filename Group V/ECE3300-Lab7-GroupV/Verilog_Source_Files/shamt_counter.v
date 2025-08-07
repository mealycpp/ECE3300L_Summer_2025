module shamt_counter(
    input clk,
    input rst_n,
    input inc,
    output reg [1:0] shamt_high
);
//output shamt_high by creating a counter that increments every time you press an increment button.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            shamt_high <= 0;
        else if (inc)
            shamt_high <= shamt_high + 1;
    end
endmodule