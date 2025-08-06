`timescale 1ns / 1ps

module debounce_toggle(
                        input clk_1khz,
                        input btn_raw,
                        output reg toggle
                        );
                    reg [2:0] shift_reg = 0;
                    reg last_state = 0;
                
                    always @(posedge clk_1khz) begin
                        shift_reg <= {shift_reg[1:0], btn_raw};
                        if (shift_reg == 3'b111 && !last_state) begin
                            toggle <= ~toggle;
                            last_state <= 1;
                        end else if (shift_reg == 3'b000) begin
                            last_state <= 0;
                        end
                    end
endmodule