`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 02:38:38 AM
// Design Name: 
// Module Name: clock_divider_fixed
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


module clock_divider_fixed(
    input clk,
    input rst,
    output reg clk_2hz,
    output reg clk_1khz
    );
    parameter DIV_VALUE = 26'd50000000;
    reg [25:0] Hz;
    reg [25:0] Khz;
    
    always@(posedge clk or negedge rst) begin
        if (rst == 0) begin
            Hz <= 0;
            Khz <=0;
        end
        else begin
            Hz = Hz + 1'b1;
            Khz = Khz + 1'b1;
            if (Hz == DIV_VALUE) begin
                Hz = 0;
                clk_2hz = ~clk_2hz;
            end
            if (Khz == DIV_VALUE/500) begin
                Khz = 0;
                clk_1khz = ~clk_1khz;
            end
        end
    end       
endmodule
