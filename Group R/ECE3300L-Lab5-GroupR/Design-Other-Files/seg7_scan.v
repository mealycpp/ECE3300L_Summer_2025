`timescale 1ns / 1ps
module seg7_scan(
    output [1:0] AN,          // Active-low anode control for 2-digit 7-seg display
    output reg [6:0] SEG,     // 7-segment display output (a-g)
    input [7:0] out,          // 8-bit BCD input: [7:4]=tens, [3:0]=units
    input CLK,                // System clock
    input rst_n               // Active-low reset
);
    reg [17:0] tmp;           // Clock divider counter
    reg [3:0] digit;          // Currently selected BCD digit to display
    // ------------------------------
    // Digit-to-7-segment decoder
    // Updates SEG based on current BCD digit
    // ------------------------------
    always @(digit) 
        case(digit)
            4'd0: SEG = 7'b0000001; // '0'
            4'd1: SEG = 7'b1001111; // '1'
            4'd2: SEG = 7'b0010010; // '2'
            4'd3: SEG = 7'b0000110; // '3'
            4'd4: SEG = 7'b1001100; // '4'
            4'd5: SEG = 7'b0100100; // '5'
            4'd6: SEG = 7'b0100000; // '6'
            4'd7: SEG = 7'b0001111; // '7'
            4'd8: SEG = 7'b0000000; // '8'
            4'd9: SEG = 7'b0001100; // '9'
            default: SEG = 7'b1111111; // Blank for invalid input
        endcase 
    // ------------------------------
    // Clock divider logic
    // Generates a slow toggling bit for display multiplexing
    // ------------------------------
    always @(posedge CLK)
        if (!rst_n)
            tmp <= 0;
        else
            tmp <= tmp + 1;
    wire s = tmp[17];  // Use bit 17 to toggle between digits (approx ~6ms at 100MHz)
    // ------------------------------
    // Digit selection
    // Chooses which digit to display based on 's'
    // ------------------------------
    always @(s, out)
        case (s)
            1'd0: digit = out[3:0];  // Units digit
            1'd1: digit = out[7:4];  // Tens digit
        endcase
    // ------------------------------
    // Anode control logic (active-low)
    // Selects which digit is currently active
    // ------------------------------
    reg [1:0] AN_tmp;
    always @(s)
        case(s)
            1'd0: AN_tmp = 2'b10;  // Enable right digit (units)
            1'd1: AN_tmp = 2'b01;  // Enable left digit (tens)
            default: AN_tmp = 2'b11; // Both off
        endcase
    assign AN = AN_tmp;
endmodule
