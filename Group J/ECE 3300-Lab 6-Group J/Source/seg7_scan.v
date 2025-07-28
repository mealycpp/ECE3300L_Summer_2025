`timescale 1ns / 1ps

module seg7_scan(
                input wire clk,
                input wire rst_n,
                input wire [3:0] lower_digit, 
                input wire [3:0] upper_digit, 
                input wire [3:0] ctrl_nibble,
                output reg [6:0] seg,
                output reg [2:0] an
                );
                
                reg [15:0] refresh_counter = 0;
                reg [1:0] scan = 0;
                wire [3:0] current_digit;
            
                always @(posedge clk) begin
                    refresh_counter <= refresh_counter + 1;
                end
                
                always @(posedge refresh_counter[15]) begin
                    scan <= scan + 1;
                end
                
                assign current_digit = (scan == 2'd0) ? lower_digit : (scan == 2'd1) ? upper_digit : ctrl_nibble;
                
                always @(*) begin
                case (scan)
                    2'd0: an = 3'b110;                  // AN0
                    2'd1: an = 3'b101;                  // AN1
                    2'd2: an = 3'b011;                  // AN2
                    default: an = 3'b111;
                endcase
        
                case (current_digit)
                    4'h0: seg = 7'b1000000;
                    4'h1: seg = 7'b1111001;
                    4'h2: seg = 7'b0100100;
                    4'h3: seg = 7'b0110000;
                    4'h4: seg = 7'b0011001;
                    4'h5: seg = 7'b0010010;
                    4'h6: seg = 7'b0000010;
                    4'h7: seg = 7'b1111000;
                    4'h8: seg = 7'b0000000;
                    4'h9: seg = 7'b0010000;
                    4'hA: seg = 7'b0001000;
                    4'hb: seg = 7'b0000011;
                    4'hC: seg = 7'b1000110;
                    4'hd: seg = 7'b0100001;
                    4'hE: seg = 7'b0000110;
                    4'hF: seg = 7'b0001110;
                    default: seg = 7'b1111111;
                endcase
            end           
endmodule
