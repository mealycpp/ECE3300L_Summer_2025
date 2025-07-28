`timescale 1ns / 1ps
module seg7_scan(
    input clk,                  
    input BTN0,                  
    input [3:0] digit0,            
    input [3:0] digit1,            
    input [3:0] digit2,            
    output reg [6:0] SEG,          
    output reg [3:0] AN            
    );
    reg [15:0] refresh_counter = 0;
    always @(posedge clk or negedge BTN0) begin 
    if (!BTN0)
    refresh_counter <= 16'd0;
    else
    refresh_counter <= refresh_counter + 1;
    end    
    wire [1:0] sel = refresh_counter[15:14];
   reg [3:0] current_digit;
   always @(*) begin
   case (sel)
   2'd0: current_digit = digit0;
   2'd1: current_digit = digit1;
   2'd2: current_digit = digit2;
   default: current_digit = 4'd0;
   endcase
   end
       always @(*) begin
        case (sel)
            2'd0: AN = 4'b1110;  
            2'd1: AN = 4'b1101;   
            2'd2: AN = 4'b1011;
            default: AN = 4'b1111;
        endcase
    end

    always @(*) begin
        case (current_digit)
4'h0: SEG = 7'b1000000;
4'h1: SEG = 7'b1111001;
4'h2: SEG = 7'b0100100;
4'h3: SEG = 7'b0110000;
4'h4: SEG = 7'b0011001;
4'h5: SEG = 7'b0010010;
4'h6: SEG = 7'b0000010;
4'h7: SEG = 7'b1111000;
4'h8: SEG = 7'b0000000;
4'h9: SEG = 7'b0010000;
4'hA: SEG = 7'b0001000; 
4'hB: SEG = 7'b0000011;
4'hC: SEG = 7'b1000110; 
4'hD: SEG = 7'b0100001; 
4'hE: SEG = 7'b0000110;
4'hF: SEG = 7'b0001110;
default: SEG = 7'b1111111; 
        endcase
    end
endmodule
