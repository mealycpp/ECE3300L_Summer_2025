`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2025 05:30:41 PM
// Design Name: 
// Module Name: toggle_switch
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

module toggle_switch (
    input clk,         // System clock
    input rst,         // Reset signal 
    input btn_raw,     // Raw  button input
    output reg state   // Output toggle state
);

wire btn_clean;        // Debounced button signal
reg btn_prev;          // Stores previous button state

// Debounce the raw button input
debounce db (
    .clk(clk),
    .btn_in(btn_raw),
    .btn_clean(btn_clean)
);
always @(posedge clk) begin
    if (rst) begin
        state <= 0;        // Reset the output state
        btn_prev <= 0;     // Clear previous button state
    end else begin
        // If button is pressed now and wasn't pressed before 
        if (btn_clean && !btn_prev)
            state <= ~state; // Toggle the state
        btn_prev <= btn_clean; // Update previous button state
    end
end

endmodule
