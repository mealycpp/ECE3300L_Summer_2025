`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dalton Hoang
// 
// Create Date: 07/26/2025 09:57:50 AM
// Design Name: Clock Divider
// Module Name: clk_divider
// Project Name: Clock Divider
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: generates a slow single-cycle tick signal from 100Mhz system cloc, 
//uses 32 bit counter and switch-selectable output bit

// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_divider( 
    input wire clk,
    input wire [4:0] sel,
    input wire reset_n,
    
    output wire clk_div,
    output reg [31:0] counter
);

    // Count up on every clock edge, reset on active-low reset
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            counter <= 32'b0;
        else
            counter <= counter + 1;
    end

    assign clk_div = counter[sel];

endmodule
