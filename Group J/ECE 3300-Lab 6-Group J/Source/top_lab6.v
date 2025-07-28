`timescale 1ns / 1ps

module top_lab6(
                input wire CLK,
                input wire BTN0,
                input wire [8:0] SW,
                output wire [6:0] SEG,
                output wire [7:0] AN,
                output wire [7:0] LED
                );
                
                wire [31:0] count;
                wire clk_div;
                wire [3:0] ones, tens, ctrl_nibble;
                wire [7:0] result;
                
                clock_divider div(.clk(CLK), .reset_n(BTN0), .sel(SW[4:0]), .clk_div(clk_div), .counter(count));
                
                control_decoder ctrl(.ctrl_in(SW[8:5]), .ctrl_out(ctrl_nibble));
                
                bcd_counter u0(.clk(clk_div), .rst_n(BTN0), .dir(SW[7]), .BCD(ones));
                bcd_counter u1(.clk(clk_div), .rst_n(BTN0), .dir(SW[8]), .BCD(tens));
                
                alu add_sub(.A(ones), .B(tens), .ctrl(SW[6:5]), .result(result));
                
                seg7_scan seg(.clk(CLK),.rst_n(BTN0), .lower_digit(result[3:0]), .upper_digit(result[7:4]), .ctrl_nibble(ctrl_nibble), .seg(SEG), .an(AN));
                
                assign LED = result;
                assign AN[7:3] = 5'b11111;
                
                
endmodule
