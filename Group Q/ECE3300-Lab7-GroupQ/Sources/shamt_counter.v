module shamt_counter(
    input clk, rst,
    input btn_inc,      // from BTNC debounced
    output reg [1:0] shamt_hi
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            shamt_hi <= 0;
        else if (btn_inc)
            shamt_hi <= shamt_hi + 1;
    end
endmodule