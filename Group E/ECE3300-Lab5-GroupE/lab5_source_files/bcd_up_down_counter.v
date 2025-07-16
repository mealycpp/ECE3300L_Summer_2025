`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 11:15:27 AM
// Design Name: 
// Module Name: bcd_up_down_counter
// Project Name: bcd_up_down_counter
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

module bcd_up_down_counter(
    input clk,              
    input rst_n,            
    input dir,               // Direction: 1 = Up, 0 = Down
    output reg [3:0] digit0, // Ones digit
    output reg [3:0] digit1  // Tens digit
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            digit0 <= 4'd0; // Reset both digits to 00
            digit1 <= 4'd0;
        end
        else begin
            if (dir) begin
                // COUNT UP
                if (digit0 == 4'd9) begin
                    digit0 <= 4'd0;
                    if (digit1 == 4'd9)
                        digit1 <= 4'd0;
                    else
                        digit1 <= digit1 + 4'd1;
                end
                else begin
                    digit0 <= digit0 + 4'd1;
                end
            end
            else begin
                // COUNT DOWN
                if (digit0 == 4'd0) begin
                    digit0 <= 4'd9;
                    if (digit1 == 4'd0)
                        digit1 <= 4'd9;
                    else
                        digit1 <= digit1 - 4'd1;
                end
                else begin
                    digit0 <= digit0 - 4'd1;
                end
            end
        end
    end

endmodule
