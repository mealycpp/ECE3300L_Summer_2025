`timescale 1ns / 1ps

module seg7_scan8(
    input wire clk,                      
    input wire [55:0] hex_seg_flat,      
    output reg [7:0] an = 8'b11111111,  
    output reg [6:0] seg = 7'b1111111
);

    reg [2:0] scan_index = 3'd0;

    always @(posedge clk) begin
        scan_index <= scan_index + 1;
        an <= 8'b11111111;
        an[scan_index] <= 1'b0;
        
        case (scan_index)
            3'd0: seg <= hex_seg_flat[6:0];
            3'd1: seg <= hex_seg_flat[13:7];
            3'd2: seg <= hex_seg_flat[20:14];
            3'd3: seg <= hex_seg_flat[27:21];
            3'd4: seg <= hex_seg_flat[34:28];
            3'd5: seg <= hex_seg_flat[41:35];
            3'd6: seg <= hex_seg_flat[48:42];
            3'd7: seg <= hex_seg_flat[55:49];
            default: seg <= 7'b1111111;
        endcase
    end

endmodule
