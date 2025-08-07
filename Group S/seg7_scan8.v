`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 06:30:25 PM
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
    input CLK_1KHZ,        // 1kHz clock
    input [6:0] SEG0,      // Segment data for digit 0
    input [6:0] SEG1,      // Segment data for digit 1
    input [6:0] SEG2,      // Segment data for digit 2
    input [6:0] SEG3,      // Segment data for digit 3
    input [6:0] SEG4,      // Segment data for digit 4
    input [6:0] SEG5,      // Segment data for digit 5
    input [6:0] SEG6,      // Segment data for digit 6
    input [6:0] SEG7,      // Segment data for digit 7
    output reg [7:0] AN,   // Anode enable signals 
    output reg [6:0] SEG   // Current segment output
);
    reg [2:0] scan_cnt = 0;  // 3-bit counter for scanning
    
    // Increment scan counter on each clock edge
    always @(posedge CLK_1KHZ) begin
        scan_cnt <= scan_cnt + 1;
    end
    
    // Select which display is active
    always @(*) begin
        case(scan_cnt)
            3'd0: begin AN = 8'b11111110; SEG = SEG0; end  // Enable digit 0
            3'd1: begin AN = 8'b11111101; SEG = SEG1; end  // Enable digit 1
            3'd2: begin AN = 8'b11111011; SEG = SEG2; end  // Enable digit 2
            3'd3: begin AN = 8'b11110111; SEG = SEG3; end  // Enable digit 3
            3'd4: begin AN = 8'b11101111; SEG = SEG4; end  // Enable digit 4
            3'd5: begin AN = 8'b11011111; SEG = SEG5; end  // Enable digit 5
            3'd6: begin AN = 8'b10111111; SEG = SEG6; end  // Enable digit 6
            3'd7: begin AN = 8'b01111111; SEG = SEG7; end  // Enable digit 7
        endcase
    end
endmodule