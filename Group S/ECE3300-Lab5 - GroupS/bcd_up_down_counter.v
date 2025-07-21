`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 06:06:37 PM
// Design Name: 
// Module Name: bcd_up_down_counter
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
    input clk_div, //divided clock
    input rst_n, // reset
    input dir, // direction 
    output reg [3:0] bcd_value, //4 bit bcd value
    output reg roll // check for rollover
    );
 always @(posedge clk_div or negedge rst_n) begin
        if (!rst_n) begin
        //reset roll and bcd value
        
            bcd_value <= 4'd0; 
            roll      <= 1'b0;
            
        end else begin
            roll <= 1'b0;  // initialize roll to 0
            if (dir) begin // count up
                if (bcd_value == 4'd9) begin // set up case for rollover
                    bcd_value <= 4'd0;
                    roll      <= 1'b1;  // overflow
                end else begin
                    bcd_value <= bcd_value + 4'd1;
                end
            end else begin // count down
                if (bcd_value == 4'd0) begin // setup case for rollover counting down
                    bcd_value <= 4'd9;
                    roll      <= 1'b1;  // underflow
                end else begin
                    bcd_value <= bcd_value - 4'd1;
                end
            end
        end
    end
endmodule
