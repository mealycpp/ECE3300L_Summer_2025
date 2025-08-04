`timescale 1ns / 1ps
module seg7_scan8(
    input wire clk,                      
    input wire [6:0] hex_seg [7:0],      
    output reg [7:0] an = 8'b11111111, 
    output reg [6:0] seg = 7'b1111111    
);
    reg [2:0] scan_index = 0;

    always @(posedge clk) begin
        scan_index <= scan_index + 1;

        an <= 8'b11111111;
        an[scan_index] <= 1'b0;        
        seg <= hex_seg[scan_index];     
    end
endmodule
