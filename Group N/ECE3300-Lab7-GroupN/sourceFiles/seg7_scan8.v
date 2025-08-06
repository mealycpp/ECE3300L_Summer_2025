`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2025 06:48:27 PM
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
    input wire clk_1kHz,            // 1 kHz refresh clock
    input wire rst_n,               // active-low reset

    input wire [6:0] seg0,          
    input wire [6:0] seg1,
    input wire [6:0] seg2,
    input wire [6:0] seg3,          

    output reg [6:0] SEG,           // segment outputs, active-low
    output reg [7:0] AN,            // anode control, AN0-AN3 used
    output wire DP                  
);

    assign DP = 1'b1; // DP off (active-low)

    reg [1:0] scan_sel;

    // 2-bit counter to select active digit
    always @(posedge clk_1kHz or negedge rst_n) begin
        if (!rst_n)
            scan_sel <= 0;
        else
            scan_sel <= scan_sel + 1;
    end

    // scan and select digit and anode
    always @(*) begin
        case (scan_sel)
            2'd0: begin
                SEG = seg0;
                AN  = 8'b11111110; // enable AN0 (digit 0)
            end
            2'd1: begin
                SEG = seg1;
                AN  = 8'b11111101; // enable AN1 (digit 1)
            end
            2'd2: begin
                SEG = seg2;
                AN  = 8'b11111011; // enable AN2 (digit 2)
            end
            2'd3: begin
                SEG = seg3;
                AN  = 8'b11110111; // enable AN3 (digit 3)
            end
        endcase
    end

endmodule
