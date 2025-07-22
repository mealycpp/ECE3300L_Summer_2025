`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 05:07:59 PM
// Design Name: 
// Module Name: top_lab5
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


module clock_divider(
    input clock_in, 
    input rst_n, // active low-reset
    output reg [31:0] counterIn // 32 bit counter output increments on posEdge CLK

    );
   
    always @(posedge clock_in or negedge rst_n) begin
        if (!rst_n)
            counterIn <= 32'b0;     // Reset the counter
        else
            counterIn <= counterIn + 1;   // Increment on each rising clock edge
    end
    
endmodule
