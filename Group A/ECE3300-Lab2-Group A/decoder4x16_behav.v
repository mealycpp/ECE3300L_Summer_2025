`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2025 05:36:17 PM
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
    input [3:0] in,
    input enable,
    output reg [15:0] out
    );
    always @(*) begin
        if(enable) begin //enable check
            case (in)
                4'h0: out = 16'b0000_0000_0000_0001; //map first switch to first LED
                4'h1: out = 16'b0000_0000_0000_0010; //map second switch to second LED
                4'h2: out = 16'b0000_0000_0000_0100; //map third switch to third LED
                4'h3: out = 16'b0000_0000_0000_1000; //map fourth switch to fourth LED
                4'h4: out = 16'b0000_0000_0001_0000; //map fifth switch to fifth LED
                4'h5: out = 16'b0000_0000_0010_0000; //map sixth switch to sixth LED
                4'h6: out = 16'b0000_0000_0100_0000; //map seventh switch to seventh LED
                4'h7: out = 16'b0000_0000_1000_0000; //map eighth switch to eighth LED
                4'h8: out = 16'b0000_0001_0000_0000; //map ninth switch to ninth LED
                4'h9: out = 16'b0000_0010_0000_0000; //map tenth switch to tenth LED
                4'hA: out = 16'b0000_0100_0000_0000; //map eleventh switch to eleventh LED
                4'hB: out = 16'b0000_1000_0000_0000; //map twelvth switch to twelvth LED
                4'hC: out = 16'b0001_0000_0000_0000; //map thirteenth switch to thirteenth LED
                4'hD: out = 16'b0010_0000_0000_0000; //map fourteenth switch to fourteenth LED
                4'hE: out = 16'b0100_0000_0000_0000; //map fifthteenth switch to fifthteenth LED
                4'hF: out = 16'b1000_0000_0000_0000; //map sixteenth switch to sixteenth LED
            endcase
        end
        else begin
            out = 16'h0; //reset
        end
    end
endmodule
