`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/06/2025 12:21:13 PM
// Design Name: 
// Module Name: debounce_toggle
// Project Name: debounce_toggle
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


module debounce_toggle (
    input wire clk,
    input wire btn_input,     
    output reg btn_toggle       
);

    wire btn_in;
    reg btn_prev;

    // Instantiate debounce module
    debounce db (
        .clk(clk),
        .btn(btn_input),
        .btn_in(btn_in)
    );

    initial begin
        btn_toggle = 0;
        btn_prev = 0;
    end 
    
    always @(posedge clk ) begin

            if (btn_in && !btn_prev)
                btn_toggle <= ~btn_toggle; 
            btn_prev <= btn_in;
        end

endmodule
