`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dalton Hoang
// 
// Create Date: 07/21/2025 02:06:16 PM
// Design Name: 
// Module Name: dig_select
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
 

module dig_select (
    input  wire clk,
    input  wire enable,
    input  wire dir,
    input  wire rst_n,
    output reg  [3:0] value,
    output reg        roll_out
);

    // Detect if current value is at maximum (9) or minimum (0)
    wire at_max = value == 4'd9;
    wire at_min = value == 4'd0;

      // Sequential logic: counter operation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin //set value to 0 and clear roll_out
            value    <= 4'd0;
            roll_out <= 1'b0;
        end else begin //no rollover unless counting triggers it
            roll_out <= 1'b0;         
            if (enable) begin
                if (dir) begin  // Counting up
                    value    <= at_max ? 4'd0   : value + 4'd1;
                    roll_out <=  at_max;
                end else begin   // Counting down
                    value    <= at_min ? 4'd9   : value - 4'd1;
                    roll_out <=  at_min;
                end
            end
        end
    end
endmodule
