//jaden

module debounce_toggle(
    input clk_1khz,
    input btn_raw,
    output reg btn_toggle
);
    reg [2:0] shift_reg = 0;
    reg prev = 0;

    always @(posedge clk_1khz) begin
        shift_reg <= {shift_reg[1:0], btn_raw};
        if (shift_reg == 3'b111 && !prev) begin
            btn_toggle <= ~btn_toggle;
            prev <= 1;
        end else if (shift_reg == 3'b000) begin
            prev <= 0;
        end
    end
endmodule
