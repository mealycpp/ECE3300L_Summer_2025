`timescale 1ns / 1ps                                // Sets the simulation time unit to 1 nanosecond and precision to 1 picosecond
module seg7_scan (
    input wire clk_fast,                            // Fast clock input used to drive refresh timer
    input wire rst_n,                               // Active-low reset input
    input wire [3:0] lower_digit,                   // BCD value for the units digit (0-9)
    input wire [3:0] upper_digit,                   // BCD value for the tens digit (0-9)
    input wire [3:0] ctrl_nibble,                   // SW[8:5]
    output reg [6:0] seg_pins,                      // Output to 7-segment display segments (a-g)
    output wire dp,                                 // Decimal point (always off in this design)
    output reg [2:0] anodes                         // Output to control which digit is active
);

    reg [15:0] refresh_counter = 0;                 // Refresh rate control
    reg [1:0] scan = 0;                             // Scan index to select which digit is active
    wire [3:0] current_digit;                       // Active digit's BCD value

    // Counter increments on every clk_fast rising edge
    always @(posedge clk_fast) begin
        refresh_counter <= refresh_counter + 1;
    end

    always @(posedge refresh_counter[15]) begin
        scan <= scan + 1;
    end

    // Select BCD value for the digit being displayed
    assign current_digit = (scan == 2'd0) ? lower_digit :
                           (scan == 2'd1) ? upper_digit : ctrl_nibble;

    always @(*) begin
        case (scan)
            2'd0: anodes = 3'b110;                  // AN0
            2'd1: anodes = 3'b101;                  // AN1
            2'd2: anodes = 3'b011;                  // AN2
            default: anodes = 3'b111;
        endcase

        case (current_digit)
            4'h0: seg_pins = 7'b1000000;
            4'h1: seg_pins = 7'b1111001;
            4'h2: seg_pins = 7'b0100100;
            4'h3: seg_pins = 7'b0110000;
            4'h4: seg_pins = 7'b0011001;
            4'h5: seg_pins = 7'b0010010;
            4'h6: seg_pins = 7'b0000010;
            4'h7: seg_pins = 7'b1111000;
            4'h8: seg_pins = 7'b0000000;
            4'h9: seg_pins = 7'b0010000;
            4'hA: seg_pins = 7'b0001000;
            4'hb: seg_pins = 7'b0000011;
            4'hC: seg_pins = 7'b1000110;
            4'hd: seg_pins = 7'b0100001;
            4'hE: seg_pins = 7'b0000110;
            4'hF: seg_pins = 7'b0001110;
            default: seg_pins = 7'b1111111;
        endcase
    end
endmodule
