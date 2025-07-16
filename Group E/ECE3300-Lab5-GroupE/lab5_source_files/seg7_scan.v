`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 11:24:26 AM
// Design Name: 
// Module Name: seg7_scan
// Project Name: seg7_scan
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
    input clk,                    
    input rst_n,                  
    input [3:0] digit0,           // Ones digit in BCD
    input [3:0] digit1,           // Tens digit in BCD
    output reg [6:0] SEG,         // Segment lines (a-g)
    output reg [1:0] AN           // AN0, AN1
);

    reg [15:0] refresh_counter;   // Used to switch between digits
    wire refresh_tick;
    reg current_digit;            // 0 = digit0, 1 = digit1
    reg [3:0] current_value;      // Currently selected BCD digit

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    assign refresh_tick = refresh_counter[15];

    // Switch digits on refresh tick
    always @(posedge refresh_tick or negedge rst_n) begin
        if (!rst_n)
            current_digit <= 0;
        else
            current_digit <= ~current_digit;
    end

    // Assign digit value based on current digit
    always @(*) begin
        case (current_digit)
            1'b0: current_value = digit0; // Show ones digit
            1'b1: current_value = digit1; // Show tens digit
            default: current_value = 4'd0;
        endcase
    end

    // BCD to 7-segment decoder
    always @(*) begin
        case (current_value)
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
            default: SEG = 7'b1111111; 
        endcase
    end
    always @(*) begin
        case (current_digit)
            1'b0: AN = 2'b10; // Enable AN0
            1'b1: AN = 2'b01; // Enable AN1 
            default: AN = 2'b11;
        endcase
    end

endmodule
