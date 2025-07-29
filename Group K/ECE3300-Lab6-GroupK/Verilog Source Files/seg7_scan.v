`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Dalton Hoang
// 
// Create Date: 07/25/2025 01:21:19 PM
// Design Name: 
// Module Name: seg7_scan
// Project Name: 
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: cycles through three digits on 7 seg dispaly, shows ALU result and control nibble with scan counter for multiplexing
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module seg7_scan(
    input wire [3:0] lower_digit, 
    input wire [3:0] upper_digit,
    input wire clk,
    input wire rst_n,
    input wire [3:0] ctrl_nibble,
    
    output reg [2:0] AN,
    output reg [6:0] SEG
);
    wire [3:0] current_digit;
    reg [1:0] scan = 0;
    reg [15:0] refresh_counter = 0;

    // Refresh counter increments on every clock tick
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end

    // Advance scan position on slower tick
    always @(posedge refresh_counter[15]) begin
        scan <= scan + 1;
    end

    // Select which digit to display based on scan
    assign current_digit = (scan == 2'd0) ? lower_digit :
                           (scan == 2'd1) ? upper_digit :
                                            ctrl_nibble;

    // Segment control logic
    always @(*) begin
        case (scan)
            2'd0: AN = 3'b110;
            2'd1: AN = 3'b101;
            2'd2: AN = 3'b011;
            default: AN = 3'b111;
        endcase

        case (current_digit)
            4'h0: SEG = 7'b1000000;
            4'h1: SEG = 7'b1111001;
            4'h2: SEG = 7'b0100100;
            4'h3: SEG = 7'b0110000;
            4'h4: SEG = 7'b0011001;
            4'h5: SEG = 7'b0010010;
            4'h6: SEG = 7'b0000010;
            4'h7: SEG = 7'b1111000;
            4'h8: SEG = 7'b0000000;
            4'h9: SEG = 7'b0010000;
            4'hA: SEG = 7'b0001000;
            4'hb: SEG = 7'b0000011;
            4'hC: SEG = 7'b1000110;
            4'hd: SEG = 7'b0100001;
            4'hE: SEG = 7'b0000110;
            4'hF: SEG = 7'b0001110;
            default: SEG = 7'b1111111;
        endcase
    end

endmodule
