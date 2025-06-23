`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Paul Kim and Winson Zhu
// 
// Create Date: 06/19/2025 08:16:54
// Design Name: 
// Module Name: decoder4x16_gate
// Project Name: decoder4x16_gate
// Target Devices: ARTIX - 7 Family
// Tool Versions: Vivado 2025.1
// Description: 4-to-16 decoder with enable.
// 
// Dependencies: 
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: This has been designed by Student Daniel and Student Kobe
//////////////////////////////////////////////////////////////////////////////////


module decoder4x16_gate(
    input wire [3:0] sw, 
    input e,
    output wire [15:0] led
    );
    
    assign led[0] = e&~sw[3]&~sw[2]&~sw[1]&~sw[0];
    assign led[1] = e&~sw[3]&~sw[2]&~sw[1]&sw[0];
    assign led[2] = e&~sw[3]&~sw[2]&sw[1]&~sw[0];
    assign led[3] = e&~sw[3]&~sw[2]&sw[1]&sw[0];
    assign led[4] = e&~sw[3]&sw[2]&~sw[1]&~sw[0];
    assign led[5] = e&~sw[3]&sw[2]&~sw[1]&sw[0];
    assign led[6] = e&~sw[3]&sw[2]&sw[1]&~sw[0];
    assign led[7] = e&~sw[3]&sw[2]&sw[1]&sw[0];
    assign led[8] = e&sw[3]&~sw[2]&~sw[1]&~sw[0];
    assign led[9] = e&sw[3]&~sw[2]&~sw[1]&sw[0];
    assign led[10] = e&sw[3]&~sw[2]&sw[1]&~sw[0];
    assign led[11] = e&sw[3]&~sw[2]&sw[1]&sw[0];
    assign led[12] = e&sw[3]&sw[2]&~sw[1]&~sw[0];
    assign led[13] = e&sw[3]&sw[2]&~sw[1]&sw[0];
    assign led[14] = e&sw[3]&sw[2]&sw[1]&~sw[0];
    assign led[15] = e&sw[3]&sw[2]&sw[1]&sw[0];

endmodule
