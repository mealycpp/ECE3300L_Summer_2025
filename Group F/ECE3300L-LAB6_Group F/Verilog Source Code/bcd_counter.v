`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 04:44:20 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
    input wire clk_div,
    input wire BTN0,
    input wire dir_bit,
    output reg [3:0] LED
    );
    
    always@(posedge clk_div or negedge BTN0)
        if (~BTN0) 
            LED <= 4'b0000;         
        else if (dir_bit == 1'b1) begin // Increment mode
                if (LED == 4'd9) // If current value is 9
                    LED <= 4'd0;    // Wrap around to 0
                else 
                    LED <= LED + 1; // Increment by 1
            end else begin // Decrement mode (dir_bit == 0)
                if (LED == 4'd0)  // If current value is 0
                    LED <= 4'd9;    // Wrap around to 9
                else
                    LED <= LED - 1; // Decrement by 1  
                end
endmodule
