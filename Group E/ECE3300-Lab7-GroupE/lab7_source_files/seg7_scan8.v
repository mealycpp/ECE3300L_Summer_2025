`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 11:00:48 AM
// Design Name: 
// Module Name: seg7_scan8
// Project Name: seg7_scan8
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
    input wire clk,                      
    input wire [6:0] hex_seg [7:0],      
    output reg [7:0] an = 8'b11111111,   // Active-low digit enables
    output reg [6:0] seg = 7'b1111111    // Active-low segment output
);
    reg [2:0] scan_index = 0;

    always @(posedge clk) begin
        scan_index <= scan_index + 1;

        an <= 8'b11111111;
        an[scan_index] <= 1'b0;           // Enable one digit
        seg <= hex_seg[scan_index];       // Output segment value
    end
endmodule
