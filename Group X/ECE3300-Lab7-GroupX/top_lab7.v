`timescale 1ns / 1ps

module top_lab7(
                input wire clk,                
                input wire [15:0] SW,           
                input btnU, btnD, btnL, btnR, btnC,           
                output wire [7:0] LED,          
                output wire [6:0] seg,          
                output wire [7:0] an            
                );

                wire clk_2khz, clk_1khz;
                clock_divider_fixed clkdiv(.clk(clk), .clk_2khz(clk_2khz), .clk_1khz(clk_1khz));
                
                wire dir_toggle, rot_toggle, shamt0_toggle, shamt1_toggle;
                debounce_toggle dir(.clk_1khz(clk_1khz), .btn_raw(btnU), .toggle(dir_toggle));
                debounce_toggle rot(.clk_1khz(clk_1khz), .btn_raw(btnD), .toggle(rot_toggle));
                debounce_toggle shamt0(.clk_1khz(clk_1khz), .btn_raw(btnL), .toggle(shamt0_toggle));
                debounce_toggle shamt1(.clk_1khz(clk_1khz), .btn_raw(btnR), .toggle(shamt1_toggle));
                
                wire [1:0] shamt_high;
                shamt_counter count(.clk(clk_1khz), .btnc(btnC), .shamt_high(shamt_high));
                
                wire [3:0] shamt = {shamt_high, shamt1_toggle, shamt0_toggle};
                
                wire [15:0] barrel_out;
                barrel_shifter16 barrel(
                                        .DATA_IN(SW),
                                        .SHAMT(shamt),
                                        .DIR(dir_toggle),
                                        .ROTATE(rot_toggle),
                                        .DATA_OUT(barrel_out)
                                        );
                
                wire [6:0] seg0, seg1, seg2, seg3;
                hex_to_7seg h0(.hex(barrel_out[3:0]), .seg(seg0));
                hex_to_7seg h1(.hex(barrel_out[7:4]), .seg(seg1));
                hex_to_7seg h2(.hex(barrel_out[11:8]), .seg(seg2));
                hex_to_7seg h3(.hex(barrel_out[15:12]), .seg(seg3));
                
                wire [6:0] blank = 7'b1111111;
                seg7_scan8 scanner(
                                   .clk_1khz(clk_1khz),
                                   .seg0(seg0),
                                   .seg1(seg1),
                                   .seg2(seg2),
                                   .seg3(seg3),
                                   .seg4(blank),
                                   .seg5(blank),
                                   .seg6(blank),
                                   .seg7(blank),
                                   .an(an),
                                   .seg(seg)
                                  );
                 
                 assign LED[7:0] = {2'b00, shamt, rot_toggle, dir_toggle};
                
endmodule