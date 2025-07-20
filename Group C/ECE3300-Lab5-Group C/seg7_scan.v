`timescale 1ns / 1ps

module seg7_scan(
    input CLK,
    input [3:0] digit0,  
    input [3:0] digit1,  
    output reg [7:0] AN, 
    output reg [6:0] SEG 
);

    reg [17:0] refresh_counter = 0;
    wire digit_select;
    reg [3:0] current_digit;

    always @(posedge CLK) begin
        refresh_counter <= refresh_counter + 1;
    end

    assign digit_select = refresh_counter[17]; 

    always @(*) begin
        case (digit_select)
            1'b1: begin
                AN = 8'b11111101; 
                current_digit = digit1;
            end
            default: begin
                AN = 8'b11111110; 
                current_digit = digit0;
            end
        endcase
    end

    always @(*) begin
        case (current_digit)
            4'd0: SEG = 7'b1000000; // 0
            4'd1: SEG = 7'b1111001; // 1
            4'd2: SEG = 7'b0100100; // 2
            4'd3: SEG = 7'b0110000; // 3
            4'd4: SEG = 7'b0011001; // 4
            4'd5: SEG = 7'b0010010; // 5
            4'd6: SEG = 7'b0000010; // 6
            4'd7: SEG = 7'b1111000; // 7
            4'd8: SEG = 7'b0000000; // 8
            4'd9: SEG = 7'b0010000; // 9
            default: SEG = 7'b1111111; // Blank
        endcase
    end
endmodule