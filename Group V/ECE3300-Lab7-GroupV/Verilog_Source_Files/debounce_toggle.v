`timescale 1ns / 1ps

module debounce_toggle(
    input clk_1kHz,
    input btn_raw,
    output reg btn_toggle
);
    reg [2:0] shift_reg;
    reg state;

initial begin
    btn_toggle = 0;
    shift_reg = 0;
    state = 1;
end
//initialize shift register
    always @(posedge clk_1kHz) begin
        shift_reg <= {shift_reg[1:0], btn_raw};
//if the shift register reads 3 high inputs in a row it will toggle the button and state will go high
        if (shift_reg == 3'b111 && !state) begin
            btn_toggle <= ~btn_toggle;
            state <= 1;
//if it detects 3 low inputs in a row it will not toggle, state will stay low.
        end else if (shift_reg == 3'b000) begin
            state <= 0;
        end
    end
endmodule