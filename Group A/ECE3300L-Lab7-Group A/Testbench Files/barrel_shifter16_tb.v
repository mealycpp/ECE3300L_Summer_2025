`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 08:42:04 AM
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


module barrel_shifter16_tb(

    );
    
    reg [15:0] data_in;
    reg [3:0] shamt;
    reg dir;
    reg rotate;
    wire [15:0] data_out;
    
    barrel_shifter16 shift(data_in, shamt, dir, rotate, data_out);
    
    initial begin
        data_in = 16'hA5A5;
        shamt = 4'd4;
        dir = 0;
        rotate = 1;
        #5 rotate = 0;
        #5 dir = 1;
        #5 rotate = 1;
        #5 data_in = 16'h8001;
        shamt = 4'd4;
        dir = 0;
        rotate = 1;
        #5 rotate = 0;
        #5 dir = 1;
        #5 rotate = 1;
    end
    
endmodule
