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
    input wire btn_in,        
    output reg [1:0] shamnt     
);
    reg shamnt_p;
    wire BTN;
    reg btn_prev;

    // Debounce input from button
    debounce db (
        .clk(clk),
        .btn_in(btn_in),
        .BTN(BTN)
    );

    always @(posedge clk) begin
        btn_prev <= BTN;
        shamnt_p <= BTN & ~btn_prev;
        
        if (shamnt_p) begin
            shamnt <= shamnt + 1;
        end
    end
    
endmodule