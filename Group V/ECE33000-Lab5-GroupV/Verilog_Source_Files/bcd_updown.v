`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 07:54:13 PM
// Design Name: 
// Module Name: bcd_updown
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


module bcd_up_down_counter(
    input clk,
    input rst_n,
    input dir, // 1 = up, 0 = down
    output reg [3:0] units,
    output reg [3:0] tens,
    output reg [7:0] leds
);
    reg [3:0] prev_units;

    always @(posedge clk or negedge rst_n) begin
       //if reset, set 7seg's to 0, if not reset, set register prev_units =units at clock cycle
        if (!rst_n) begin
            units <= 0;
            tens <= 0;
        end else begin
            prev_units <= units;

            if (dir) begin // Count up
            //reset to 0 if 9 for both units and tens.
                if (units == 9) begin
                    units <= 0;
                    if (tens == 9)
                        tens <= 0; 
                    else
                    //count normally
                        tens <= tens + 1;
                end else begin
                    units <= units + 1;
                end
            end else begin // Count down
                if (units == 0) begin
                    units <= 9;
                    if (tens == 0)
                        tens <= 9;
                    else
                        tens <= tens - 1;
                end else begin
                    units <= units - 1;
                end
            end
        end
    end

    always @(*) begin
    //set led's to our bcd numbers
        leds[3:0] = units;
        leds[7:4] = tens;
    end
endmodule