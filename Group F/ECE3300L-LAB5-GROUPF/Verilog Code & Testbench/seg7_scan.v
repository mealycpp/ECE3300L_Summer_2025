`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 11:04:53 AM
// Design Name: 
// Module Name: seg7_scan
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


module seg7_scan(
    input CLK,
    input [3:0] digit0, digit1,
    output reg [1:0] AN,
    output reg [6:0] SEG
    );

    reg [17:0] refresh_counter = 0; // For 100MHz clock, ~1kHz multiplexing
    wire digit_select;
    
    always @(posedge CLK) begin
        refresh_counter <= refresh_counter + 1;
    end
    
    assign digit_select = refresh_counter[17];  // Toggle approximately every 1ms
    
    reg [3:0] current_digit;
    
    // Multiplex between digit0 and digit1
    always @(*) begin
        if (digit_select == 1) begin
            AN = 2'b10; // Activate digit 0 (units)
            current_digit = digit0;
        end else begin
            AN = 2'b01; // Activate digit 1 (tens)
            current_digit = digit1;
        end
    end
    
    // Segment decoding logic (assuming common-anode)
    always @(*) begin
        case (current_digit)
            4'd0: SEG = 7'b1000000;
            4'd1: SEG = 7'b1111001;
            4'd2: SEG = 7'b0100100;
            4'd3: SEG = 7'b0110000;
            4'd4: SEG = 7'b0011001;
            4'd5: SEG = 7'b0010010;
            4'd6: SEG = 7'b0000010;
            4'd7: SEG = 7'b1111000;
            4'd8: SEG = 7'b0000000;
            4'd9: SEG = 7'b0010000;
            default: SEG = 7'b1111111;  // Blank
        endcase
    end
    
endmodule

