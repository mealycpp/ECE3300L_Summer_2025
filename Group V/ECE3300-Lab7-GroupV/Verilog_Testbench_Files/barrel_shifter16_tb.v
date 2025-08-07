`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2025 03:18:06 PM
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
    reg[15:0]data_in;
    reg[3:0]shamt;
    reg dir;
    reg rotate;
    wire[15:0]data_out;

barrel_shifter16 uut(
    .data_in(data_in),
    .shamt(shamt),
    .dir(dir),
    .rotate(rotate),
    .data_out(data_out)
);

integer i,j,k,l,m,n; //integers used in for loops

initial begin

//iterate through all 64 different permutations for both input values
data_in = 16'hABCD;
for (i = 0; i < 2; i = i +1)begin
    rotate = i;
    for (j = 0; j < 2; j = j + 1)begin
        dir = j;
        for (k = 0; k < 16; k = k + 1)begin
            shamt = k;
            #10;
        end
    end
end

#10;
data_in = 16'hEF86;
for (l = 0; l < 2; l = l +1)begin
    rotate = l;
    for (m = 0; m < 2; m = m + 1)begin
        dir = m;
        for (n = 0; n < 16; n = n + 1)begin
            shamt = n;
            #10;
        end
    end
end

#10;
$finish;
end

endmodule
