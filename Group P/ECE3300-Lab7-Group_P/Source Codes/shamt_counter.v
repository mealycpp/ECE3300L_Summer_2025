module shamt_counter(
    input wire clk,                                                         // use internal clock
    input wire rst,                                                         // Active-high reset 
    input wire btnc,                                                        // BTNC signal (debounced)
    output reg [1:0] shamt_high                                             // 2-bit output for upper shift amount bits
);
    reg btnc_prev;                                                          // Register to store previous value of btnc for edge detection

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shamt_high <= 2'b00;                                            // Reset shift amount to 0
            btnc_prev <= 1'b0;                                              // Reset previous button state
        end else begin
            btnc_prev <= btnc;                                              // Update previous button state
            if (~btnc_prev & btnc) begin                                    // rising edge detect
                shamt_high <= (shamt_high == 2'd3) ? 2'd0 : shamt_high + 1;
            end
        end
    end
endmodule
