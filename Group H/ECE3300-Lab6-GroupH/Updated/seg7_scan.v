`timescale 1ns / 1ps

module seg7_scan(
    input CLK,                  // clock (used to multiplex)
    input rst_n,                // Active-low reset
    input [11:0] bits,
    output reg [6:0] SEG,       // Segment outputs (active low)
    output [7:0] AN,         // 1 bit for each display, Digit select lines (active low)
    output DP
);
    assign DP = 1'b1; // this turns off the decimal point
    
    reg [3:0] digit;
    // Based on digit, maps the Cnode segments to output 0 - F
    always@(digit)
    case(digit)
        4'd0:SEG=7'b0000001; 4'd1: SEG=7'b1001111; 4'd2: SEG=7'b0010010;
        4'd3:SEG=7'b0000110; 4'd4: SEG=7'b1001100; 4'd5: SEG=7'b0100100;
        4'd6:SEG=7'b0100000; 4'd7: SEG=7'b0001111; 4'd8: SEG=7'b0000000;
        4'd9:SEG=7'b0001100; 4'd10:SEG=7'b0001000;4'd11:SEG=7'b1100000;
        4'd12:SEG=7'b0110001;4'd13:SEG=7'b1000010;4'd14:SEG=7'b0110000;
        4'd15:SEG=7'b0111000;default: SEG=7'b1111111;
    endcase
    
    reg [20:0] tmp;
    always@(posedge CLK or negedge rst_n)
    if(!rst_n) tmp<=0;
    else tmp<=tmp+1;
    
    wire [1:0] s = tmp[18:17]; // need it like this so that AN[7-2] are turned off
    
    
    // time-multiplexing
    // lets all displays show at the same time based on the counter above 
    always@(s, bits)
    case (s)
        2'd0:digit=bits[3:0]; 2'd1:digit=bits[7:4];
        2'd2:digit=bits[11:8];
        default:digit=4'b0000;
   endcase

    //reg [0:0] AN_tmp;
    reg [7:0] AN_tmp;
    always@(s)
    case(s)
       2'd0:AN_tmp=8'b11111110; 2'd1:AN_tmp=8'b11111101;
       2'd2:AN_tmp=8'b11111011;
       default:AN_tmp=8'b11111111;
   endcase
   
assign AN=AN_tmp;
    
    
endmodule
