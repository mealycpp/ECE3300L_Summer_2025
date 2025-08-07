`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 03:51:38 PM
// Design Name: 
// Module Name: seg7_scan8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seg7_scan8(
       input clk_1kHz,
    input [15:0] hex,
    output reg [3:0] AN,
    output reg [6:0] SEG
);
    reg [1:0] digit_counter = 0;
    
    // Wire to connect the combinational output of hex_to_7seg
    wire [3:0] nibble_to_display;
    wire [6:0] segment_pattern;

    // Instance of the hex_to_7seg module
    hex_to_7seg h2s_inst (
        .hex(nibble_to_display),
        .SEG(segment_pattern)
    );

    always @(posedge clk_1kHz) begin
        // Cycle through the four digits (0 to 3)
        digit_counter <= (digit_counter == 2'b11) ? 2'b00 : digit_counter + 1;
        
        // Activate the correct anode for the current digit
        AN <= ~(4'b0001 << digit_counter);
        
        // Update the segment output with the pattern from the hex_to_7seg module
        SEG <= segment_pattern;
    end
    
    // Combinational logic to select the correct nibble to display
    assign nibble_to_display = (digit_counter == 2'b00) ? hex[3:0] :
                               (digit_counter == 2'b01) ? hex[7:4] :
                               (digit_counter == 2'b10) ? hex[11:8] :
                               hex[15:12];

endmodule