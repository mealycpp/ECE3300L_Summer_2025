`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 08:44:15 PM
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


module barrel_shifter16_tb();

    reg [15:0] DATA_IN;
    reg [3:0] SHAMT;
    reg DIR;
    reg ROTATE;
    wire [15:0] DATA_OUT;

    integer i, j, k;

    barrel_shifter16 dut (
        .DATA_IN(DATA_IN),
        .SHAMT(SHAMT),
        .DIR(DIR),
        .ROTATE(ROTATE),
        .DATA_OUT(DATA_OUT)
    );
  
    initial begin

        DATA_IN <= 16'h1234;

        for (i = 0; i <= 1; i = i + 1) begin
            DIR <= i;
            for (j = 0; j <= 1; j = j + 1) begin
                ROTATE <= j;
                for (k = 0; k < 16; k = k + 1) begin
                    SHAMT <= k;
                    #10;
                end
            end
        end
        
        #10;
        DATA_IN <= 16'hABCD;
        
        for (i = 0; i <= 1; i = i + 1) begin
            DIR <= i;
            for (j = 0; j <= 1; j = j + 1) begin
                ROTATE <= j;
                for (k = 0; k < 16; k = k + 1) begin
                    SHAMT <= k;
                    #10;
                end
            end
        end
        
        #20;
        $finish;
    end
endmodule