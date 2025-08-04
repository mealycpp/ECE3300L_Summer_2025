`timescale 1ns / 1ps
module debounce_toggle(
    input wire clk_1kHz,       
    input wire btn_raw,       
    output reg btn_toggle = 0 
);

    reg [2:0] shift_reg = 3'b000;
    reg debounced = 0;
    reg prev_debounced = 0;

    always @(posedge clk_1kHz) begin
        shift_reg <= {shift_reg[1:0], btn_raw};
        if (shift_reg == 3'b111)     
            debounced <= 1;
        else if (shift_reg == 3'b000)
            debounced <= 0;
        if (~prev_debounced && debounced)    
            btn_toggle <= ~btn_toggle;

        prev_debounced <= debounced;   
    end
endmodule
