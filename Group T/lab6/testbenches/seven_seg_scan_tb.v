`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2025 12:51:25 AM
// Design Name: 
// Module Name: seven_seg_scan_tb
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


module seven_seg_scan_tb(

    );
    reg clk_tb = 0;
    reg [3:0] ctrl_nibble_tb = 4'h0;
    reg [7:0] result_tb = 8'h10;
    wire [7:0] AN_tb;
    wire [6:0] SEG_tb;

    seven_seg_scan A(
        .clk(clk_tb),
        .ctrl_nibble(ctrl_nibble_tb),
        .result(result_tb),
        .AN(AN_tb),
        .SEG(SEG_tb)
);

    integer i;

    always 
        begin
            #5 clk_tb = ~clk_tb;
        end

    initial 
    begin
        #35;
        #40;
        for(i = 0; i < 8; i = i+1) begin
            ctrl_nibble_tb <= ctrl_nibble_tb + 1;
            result_tb = result_tb + 8'h11;
            #40;
        end
        $finish;    
    end
endmodule
