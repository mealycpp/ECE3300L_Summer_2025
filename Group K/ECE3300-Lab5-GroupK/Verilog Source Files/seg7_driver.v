`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2025 10:37:10 AM
// Design Name: 7 Segment Driver
// Module Name: seg7_driver
// Project Name: 7 Segment Display Driver
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: Displays counter's tens and ones digits to both 7 segment displays
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module seg7_driver (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] units,
    input  wire [3:0] tens,
    output reg  [6:0] SEG,
    output reg  [1:0] AN
);

    //// 16-bit scan counter for display multiplexing
    reg [15:0] scan_ctr;
    always @(posedge clk or negedge rst_n)
        scan_ctr <= !rst_n ? 16'd0 : scan_ctr + 16'd1;

    // Use the MSB of scan_ctr to toggle between 'tens' and 'units' digits
    wire sel = scan_ctr[15];

     // 7-segment lookup table
    function [6:0] seg7(input [3:0] n);
        case (n)
            4'd0: seg7 = 7'b0000001;
            4'd1: seg7 = 7'b1001111;
            4'd2: seg7 = 7'b0010010;
            4'd3: seg7 = 7'b0000110;
            4'd4: seg7 = 7'b1001100;
            4'd5: seg7 = 7'b0100100;
            4'd6: seg7 = 7'b0100000;
            4'd7: seg7 = 7'b0001111;
            4'd8: seg7 = 7'b0000000;
            4'd9: seg7 = 7'b0001100;
            default: seg7 = 7'b1111111;
        endcase
    endfunction

    // // Combinational logic for digit selection and segment output
    always @(*) begin
        if (sel) begin
            SEG = seg7(tens);
            AN  = 2'b01;     
        end else begin
            SEG = seg7(units);
            AN  = 2'b10; 
        end
    end
endmodule