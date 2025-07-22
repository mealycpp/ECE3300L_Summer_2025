`timescale 1ns / 1ps

module seg7_scan(
    input wire clk,
    input wire rst_n,
    input wire [3:0] digit0,
    input wire [3:0] digit1,
    output reg [6:0] SEG,
    output reg [7:0] AN
);

    reg [19:0] refresh_counter = 0;
    wire sel;
    reg [3:0] digit_val;
    
    assign sel = refresh_counter[19];

    always @(posedge clk or negedge rst_n) //Display Counter
        begin
            if (!rst_n)
                refresh_counter <= 0;
            else
                refresh_counter <= refresh_counter + 1;
        end

    always @(*) // Anode select
        begin
            case(sel)
                1'b0: 
                    begin
                        AN = 8'b11111110;
                        digit_val = digit0;
                    end
                1'b1: 
                    begin
                        AN = 8'b11111101;
                        digit_val = digit1;
                    end
                default: AN = 8'b11111111;
            endcase
        end

    always@(*)
        begin
            case(digit_val)
                4'd0: SEG = 7'b1000000; //BCD to 7seg Cathode
                4'd1: SEG = 7'b1111001;
                4'd2: SEG = 7'b0100100;
                4'd3: SEG = 7'b0110000;
                4'd4: SEG = 7'b0011001;
                4'd5: SEG = 7'b0010010;
                4'd6: SEG = 7'b0000010;
                4'd7: SEG = 7'b1111000;
                4'd8: SEG = 7'b0000000;
                4'd9: SEG = 7'b0010000;
                default: SEG = 7'b1111111;
            endcase
        end

endmodule
