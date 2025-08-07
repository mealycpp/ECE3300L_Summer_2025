`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 04:16:48 AM
// Design Name: 
// Module Name: barrel_shifter16
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


module barrel_shifter16(
    input [1:0] control,
    input [15:0] SW,
    input [3:0] ShAmt,
    output reg [15:0] out
    );
    wire [15:0] out_layer0, out_layer1, out_layer2, out_layer3;
    reg [15:0] calc;

    genvar i;
    generate
        for (i=0;i<16;i=i+1) begin : layer_0  
            mux_2x1 mux_m0 (.a(SW[(i+(ShAmt[3]*4'd8))%16]), .b(SW[(i+(ShAmt[3]*4'd8))%16]), .sel(control[0]), .out(out_layer0[i]));
        end
        for (i=0;i<16;i=i+1) begin : layer_1    
            mux_2x1 mux_n0 (.a(out_layer0[(i+(ShAmt[2]*4'd4))%16]), .b(out_layer0[(i+(16-(ShAmt[2]*4'd4)))%16]), .sel(control[0]), .out(out_layer1[i]));
        end
        for (i=0;i<16;i=i+1) begin : layer_2   
            mux_2x1 mux_x0 (.a(out_layer1[(i+(ShAmt[1]*4'd2))%16]), .b(out_layer1[(i+(16-(ShAmt[1]*4'd2)))%16]), .sel(control[0]), .out(out_layer2[i]));
        end
        for (i=0;i<16;i=i+1) begin : layer_3   
            mux_2x1 mux_y0 (.a(out_layer2[(i+(ShAmt[0]*4'd1))%16]), .b(out_layer2[(i+(16-(ShAmt[0]*4'd1)))%16]), .sel(control[0]), .out(out_layer3[i]));
        end
    endgenerate 
    
    always@(*) begin
        calc = 16'b1111111111111111;
        case (control)
            2'b10: out = out_layer3 & (calc << ShAmt);
            2'b11: out = out_layer3 & (calc >> ShAmt);
            default: out = out_layer3;
        endcase
    end
    
endmodule
