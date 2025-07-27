`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module Name: seg7_scan (Corrected)
// Description: Drives a 3-digit 7-segment display.
//              FIXED: Digit selection logic now updates only on the rising
//              edge of the refresh tick to prevent display ghosting.
//////////////////////////////////////////////////////////////////////////////////

module seg7_scan(
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] digit0,
    input  wire [3:0] digit1,
    input  wire [3:0] digit2,
    output reg  [6:0] seg,
    output reg  [2:0] an
);

    // Refresh counter to create a tick for changing digits.
    // A 17-bit counter with a 100MHz clock gives a refresh rate of ~763Hz.
    reg [16:0] refresh_counter;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    // We only want to change digits on the RISING edge of the refresh tick.
    // The top bit of the counter is our refresh signal.
    wire refresh_tick = refresh_counter[16];

    // Create a delayed version of the tick to detect its rising edge.
    reg  refresh_tick_dly;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            refresh_tick_dly <= 1'b0;
        else
            refresh_tick_dly <= refresh_tick;
    end
    wire refresh_tick_posedge = refresh_tick & ~refresh_tick_dly;

    // Digit selector (0-1-2-0-...)
    reg [1:0] sel;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            sel <= 2'd0;
        // BUG FIX: Only update 'sel' on the single clock cycle of the tick's rising edge.
        else if (refresh_tick_posedge)
            sel <= (sel == 2'd2) ? 2'd0 : sel + 1;
    end

    // Combinational logic to drive the display
    reg [3:0] current_digit;
    always @(*) begin
        // 1. Select which digit's data to show and which anode to activate
        case (sel)
            2'd0: begin current_digit = digit0; an = 3'b110; end // AN0 active
            2'd1: begin current_digit = digit1; an = 3'b101; end // AN1 active
            2'd2: begin current_digit = digit2; an = 3'b011; end // AN2 active
            default: begin current_digit = 4'hF; an = 3'b111; end // Off
        endcase

        // 2. Decode the selected digit's data into segment patterns
        case (current_digit)
            // Using your provided patterns which are correct for {a,b,c,d,e,f,g}
            4'd0: seg = 7'b0000001;
            4'd1: seg = 7'b1001111;
            4'd2: seg = 7'b0010010;
            4'd3: seg = 7'b0000110;
            4'd4: seg = 7'b1001100;
            4'd5: seg = 7'b0100100;
            4'd6: seg = 7'b0100000;
            4'd7: seg = 7'b0001111;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0000100;
            // Added hex characters for displaying the control nibble
            4'hA: seg = 7'b0001000; // A
            4'hB: seg = 7'b0000011; // b
            4'hC: seg = 7'b1000110; // C
            4'hD: seg = 7'b0100001; // d
            4'hE: seg = 7'b0000110; // E
            4'hF: seg = 7'b0001110; // F
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule