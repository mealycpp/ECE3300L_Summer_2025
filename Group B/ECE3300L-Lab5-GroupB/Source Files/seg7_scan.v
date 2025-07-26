`timescale 1ns / 1ps
module seg7_scan (
    input wire clk,              
    input wire rst_n,           
    input wire [3:0] digit0,     // Units digit BCD
    input wire [3:0] digit1,     // Tens digit BCD
    output reg [7:0] an,         
    output reg [6:0] seg        
);

    // Scan counter for time multiplexing 
    reg [19:0] scan_counter;
    wire scan_clk;
   
    assign scan_clk = scan_counter[19];
    
    // Scan counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            scan_counter <= 20'b0;
        end else begin
            scan_counter <= scan_counter + 1;
        end
    end
    
    // Current digit selection
    reg [3:0] current_digit;
    
    // Multiplexer for digit selection and anode control
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            an <= 8'b1111_1111;  // everything off
            current_digit <= 4'b0;
        end else begin
            case (scan_clk)
                1'b0: begin
                    an <= 8'b1111_1110;         // Enable digit 0 (units), disable others
                    current_digit <= digit0;
                end
                1'b1: begin
                    an <= 8'b1111_1101;         // Enable digit 1 (tens), disable others
                    current_digit <= digit1;
                end
            endcase
        end
    end
    
    // BCD to 7-segment decoder
    always @(*) begin
        case (current_digit)
            4'd0: seg = 7'b1000000; // 0
            4'd1: seg = 7'b1111001; // 1
            4'd2: seg = 7'b0100100; // 2
            4'd3: seg = 7'b0110000; // 3
            4'd4: seg = 7'b0011001; // 4
            4'd5: seg = 7'b0010010; // 5
            4'd6: seg = 7'b0000010; // 6
            4'd7: seg = 7'b1111000; // 7
            4'd8: seg = 7'b0000000; // 8
            4'd9: seg = 7'b0010000; // 9
            default: seg = 7'b1111111;
        endcase
    end

endmodule
