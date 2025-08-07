`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/06/2025 10:53:14 AM
// Design Name: 
// Module Name: shamt_counter
// Project Name: shamt_counter
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


module shamnt_counter (
    input wire clk,            
    input wire btn_input,        
    output reg [1:0] shamnt     
);
    reg shamnt_p;
    wire btn_in;
    reg btn_prev;

    // Debounce input from button
    debounce db (
        .clk(clk),
        .btn(btn),
        .btn_in(btn_in)
    );

    always @(posedge clk) begin
        btn_prev <= btn_in;
        shamnt_p <= btn_in & ~btn_prev;
        
        if (shamnt_p) begin
            shamnt <= shamnt + 1;
        end
    end
    
endmodule