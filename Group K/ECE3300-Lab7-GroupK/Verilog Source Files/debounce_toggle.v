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
    input wire btn_raw,     
    output reg btn_toggle       
);

    wire btn_clean;
    reg btn_prev;

    // Instantiate debounce module
    debounce db (
        .clk(clk),
        .btn_in(btn_raw),
        .btn_clean(btn_clean)
    );

    always @(posedge clk ) begin

            if (btn_clean && !btn_prev)
                btn_toggle <= ~btn_toggle; 
            btn_prev <= btn_clean;
        end

endmodule
