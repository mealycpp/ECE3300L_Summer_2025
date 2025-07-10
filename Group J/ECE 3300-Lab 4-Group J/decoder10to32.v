`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 04:01:04 PM
// Design Name: 
// Module Name: decoder10to32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder10to32(
                    input [1:0] selectPart,
                    input [7:0] partValue,
                    output reg [31:0] out
                    );
                    initial out = 32'd0;
    
    always @(*) begin
        case (selectPart)
            2'b00: out[7:0] = partValue;
            2'b01: out[15:8] = partValue;
            2'b10: out[23:16] = partValue;
            2'b11: out[31:24] = partValue;
        endcase
    end
endmodule
