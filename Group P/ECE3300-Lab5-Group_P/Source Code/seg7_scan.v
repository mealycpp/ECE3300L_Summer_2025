`timescale 1ns / 1ps                                // Sets the simulation time unit to 1 nanosecond and precision to 1 picosecond
module seg7_scan (
    input wire clk_fast,                            // Fast clock input used to drive refresh timer
    input wire rst_n,                               // Active-low reset input
    input wire [3:0] units_val,                     // BCD value for the units digit (0-9)
    input wire [3:0] tens_val,                      // BCD value for the tens digit (0-9)
    output reg [6:0] seg_pins,                      // Output to 7-segment display segments (a-g)
    output wire dp,                                 // Decimal point (always off in this design)
    output reg [1:0] anodes                         // Output to control which digit is active
);

reg [15:0] refresh_timer;                           // 16-bit counter used to create display refresh timing
wire current_digit = refresh_timer[13];             // Selects which digit (units or tens) is currently active based on bit 13 of the timer

assign dp = 1'b1;                                   // Keeps the decimal point (dp) OFF (active low, so '1' disables it)

always @(posedge clk_fast or negedge rst_n) begin
    if (!rst_n)
        refresh_timer <= 0;                         // Reset the refresh timer if rst_n is low
    else
        refresh_timer <= refresh_timer + 1;         // Increment refresh timer on each clock cycle
end

always @(*) begin
    case (current_digit)                            // Select between displaying units or tens digit
        1'b0: begin
            anodes = 2'b10;                         // Activate the right digit (usually units)
            case (units_val)                        // Set the 7-segment pattern based on the units BCD value
                4'd0: seg_pins = 7'b1000000;        // Segment encoding for 0
                4'd1: seg_pins = 7'b1001111;        // Segment encoding for 1
                4'd2: seg_pins = 7'b0100100;        // Segment encoding for 2
                4'd3: seg_pins = 7'b0110000;        // Segment encoding for 3
                4'd4: seg_pins = 7'b0011001;        // Segment encoding for 4
                4'd5: seg_pins = 7'b0010010;        // Segment encoding for 5
                4'd6: seg_pins = 7'b0000010;        // Segment encoding for 6
                4'd7: seg_pins = 7'b1111000;        // Segment encoding for 7
                4'd8: seg_pins = 7'b0000000;        // Segment encoding for 8
                4'd9: seg_pins = 7'b0010000;        // Segment encoding for 9
                default: seg_pins = 7'b1111111;     // Blank or invalid input
            endcase
        end
        1'b1: begin
            anodes = 2'b01;                         // Activate the left digit (usually tens)
            case (tens_val)                         // Set the 7-segment pattern based on the tens BCD value
                4'd0: seg_pins = 7'b1000000;
                4'd1: seg_pins = 7'b1001111;
                4'd2: seg_pins = 7'b0100100;
                4'd3: seg_pins = 7'b0110000;
                4'd4: seg_pins = 7'b0011001;
                4'd5: seg_pins = 7'b0010010;
                4'd6: seg_pins = 7'b0000010;
                4'd7: seg_pins = 7'b1111000;
                4'd8: seg_pins = 7'b0000000;
                4'd9: seg_pins = 7'b0010000;
                default: seg_pins = 7'b1111111;
            endcase
        end
    endcase
end

endmodule
