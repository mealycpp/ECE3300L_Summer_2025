`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 07/17/2025 09:18:22 AM
// Design Name: Binary Coded Decimal Counter
// Module Name: bcd_counter
// Project Name: BCD Counter
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: This is a Up/Down BCD Counter
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module bcd_counter (
    input  wire clk,
    input  wire rst_n,
    input  wire tick,
    input  wire dir,          // 1 = up, 0 = down
    output wire [3:0] units,
    output wire [3:0] tens
);
    wire unit_roll; //carry signal from units to tens

     // generates 'unit_roll' when units digit overflows (up) or underflows (down)
    dig_select u_units (
        .clk(clk), .enable(tick), .dir(dir), .rst_n(rst_n),
        .value(units), .roll_out(unit_roll)
    );

    //counts when 'unit_roll' is active
    dig_select u_tens (
        .clk(clk), .enable(unit_roll), .dir(dir), .rst_n(rst_n),
        .value(tens), .roll_out()
    );
endmodule
