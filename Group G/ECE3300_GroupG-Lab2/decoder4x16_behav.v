`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 08:31:45 PM
// Design Name: 
// Module Name: decoder4x16_behav
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


module decoder4x16_behav(
    input [3:0] A,
    input E,
    output reg [15:0] Y
);
    always @(*) begin
        if (E) begin
            case (A)
                4'h0: Y = 16'b0000_0000_0000_0001;
                4'h1: Y = 16'b0000_0000_0000_0010;
                4'h2: Y = 16'b0000_0000_0000_0100;
                4'h3: Y = 16'b0000_0000_0000_1000;
                4'h4: Y = 16'b0000_0000_0001_0000;
                4'h5: Y = 16'b0000_0000_0010_0000;
                4'h6: Y = 16'b0000_0000_0100_0000;
                4'h7: Y = 16'b0000_0000_1000_0000;
                4'h8: Y = 16'b0000_0001_0000_0000;
                4'h9: Y = 16'b0000_0010_0000_0000;
                4'hA: Y = 16'b0000_0100_0000_0000;
                4'hB: Y = 16'b0000_1000_0000_0000;
                4'hC: Y = 16'b0001_0000_0000_0000;
                4'hD: Y = 16'b0010_0000_0000_0000;
                4'hE: Y = 16'b0100_0000_0000_0000;
                4'hF: Y = 16'b1000_0000_0000_0000;
                default: Y = 16'h0000;
            endcase
        end else begin
            Y = 16'h0000;
        end
    end
endmodule
