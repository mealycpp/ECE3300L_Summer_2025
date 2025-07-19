`timescale 1ns/1ps
module dual_bcd_counter (
    input  wire clk,
    input  wire rst_n,
    input  wire tick,
    input  wire dir,          // 1 = up, 0 = down
    output wire [3:0] units,
    output wire [3:0] tens
);
    wire unit_roll;

    bcd_digit u_units (
        .clk(clk), .enable(tick), .dir(dir), .rst_n(rst_n),
        .value(units), .roll_out(unit_roll)
    );

    bcd_digit u_tens (
        .clk(clk), .enable(unit_roll), .dir(dir), .rst_n(rst_n),
        .value(tens), .roll_out()
    );
endmodule
