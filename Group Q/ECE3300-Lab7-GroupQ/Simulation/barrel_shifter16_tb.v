`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 11:06:01 PM
// Design Name: 
// Module Name: barrel_shifter16_tb
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


`timescale 1ns/1ps
module barrel_shifter16_tb;
    reg [15:0] din;
    reg [3:0] shamt;
    reg dir, rot;
    wire [15:0] dout;

    barrel_shifter16 uut(din, shamt, dir, rot, dout);

    initial begin
        din = 16'hA738;
        dir = 0; rot = 0; shamt = 0;
        repeat (16) begin
            #10 shamt = shamt + 1;
        end
        dir = 1; rot = 1; shamt = 0;
        repeat (16) begin
            #10 shamt = shamt + 1;
        end
        $stop;
    end
endmodule