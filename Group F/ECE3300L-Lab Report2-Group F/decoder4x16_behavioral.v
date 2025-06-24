`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 01:38:17 AM
// Design Name: 
// Module Name: decoder4x16_behavioral
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


module decoder4x16_behavioral(
    input wire[3:0] A,
    input E,
    output reg [15:0] Y
    );
    always @(*) begin
        if(E) begin //enable check
            case (A)
                4'h0: Y = 16'b0000_0000_0000_0001; //map first switch to first LED
                4'h1: Y = 16'b0000_0000_0000_0010; //map second switch to second LED
                4'h2: Y = 16'b0000_0000_0000_0100; //map third switch to third LED
                4'h3: Y = 16'b0000_0000_0000_1000; //map fourth switch to fourth LED
                4'h4: Y = 16'b0000_0000_0001_0000; //map fifth switch to fifth LED
                4'h5: Y = 16'b0000_0000_0010_0000; //map sixth switch to sixth LED
                4'h6: Y = 16'b0000_0000_0100_0000; //map seventh switch to seventh LED
                4'h7: Y = 16'b0000_0000_1000_0000; //map eighth switch to eighth LED
                4'h8: Y = 16'b0000_0001_0000_0000; //map ninth switch to ninth LED
                4'h9: Y = 16'b0000_0010_0000_0000; //map tenth switch to tenth LED
                4'hA: Y = 16'b0000_0100_0000_0000; //map eleventh switch to eleventh LED
                4'hB: Y = 16'b0000_1000_0000_0000; //map twelvth switch to twelvth LED
                4'hC: Y = 16'b0001_0000_0000_0000; //map thirteenth switch to thirteenth LED
                4'hD: Y = 16'b0010_0000_0000_0000; //map fourteenth switch to fourteenth LED
                4'hE: Y = 16'b0100_0000_0000_0000; //map fifthteenth switch to fifthteenth LED
                4'hF: Y = 16'b1000_0000_0000_0000; //map sixteenth switch to sixteenth LED
            endcase
        end
        else begin
            Y = 16'h0; //reset
        end
    end
endmodule
