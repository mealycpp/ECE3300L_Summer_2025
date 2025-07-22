`timescale 1ns / 1ps

module seg7_scan(                   
    input [3:0] lsb0,            
    input [3:0] lsb1,             
    input [3:0] msb1,             
    input [3:0] msb0,             
    input clk,                      
    input rst_n,  
    output reg [6:0] seg,          
    output reg [3:0] an             
);

    reg  [15:0] reset_count = 0; 
    wire [1:0] sel;  

    assign sel = reset_count[15:14];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reset_count <= 0;
        else
            reset_count <= reset_count + 1;
    end

    reg [3:0] active_bit; 

    always @(*) begin
        case (sel)
            2'd0: active_bit = lsb0;
            2'd1: active_bit = lsb1;
            2'd2: active_bit = msb1;
            2'd3: active_bit = msb0;
            default: active_bit = 4'd0;
        endcase
    end

    always @(*) begin
        case (sel)
            2'd0: an = 4'b1110;  
            2'd1: an = 4'b1101;  
            2'd2: an = 4'b1011;  
            2'd3: an = 4'b0111;  
            default: an = 4'b1111;
        endcase
    end

    always @(*) begin
        case (active_bit)
            4'd0: seg = 7'b1000000;
            4'd1: seg = 7'b1111001;
            4'd2: seg = 7'b0100100;
            4'd3: seg = 7'b0110000;
            4'd4: seg = 7'b0011001;
            4'd5: seg = 7'b0010010;
            4'd6: seg = 7'b0000010;
            4'd7: seg = 7'b1111000;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0010000;
            default: seg = 7'b1111111; 
        endcase
    end

endmodule