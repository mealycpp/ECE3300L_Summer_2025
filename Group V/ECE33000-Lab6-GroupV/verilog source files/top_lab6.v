`timescale 1ns / 1ps

module top_lab6(
input clk,
input rst_n,
input [8:0]sw, //4:0 Clock Control, 6:5 alu control, 8:7 up/down
output[7:0]led,//7:4 tens debug, 3:0 units debug
output[7:0]an,
output [6:0]seg,
output DP
);


wire clk_out;
wire[3:0]units_bcd, tens_bcd;
wire[7:0]result;
wire[3:0]ctrl_nibble;

wire [3:0]tens = (result/10) % 10;
wire [3:0]units = result % 10;


//BCD result
assign DP = 1'b1;

clock_divider u_clock_divider(
.clk(clk),
.rst_n(rst_n),
.sel(sw[4:0]),
.clk_out(clk_out)
);

bcd_counter u_counter_units(
    .clk_div(clk_out), .BTN0(rst_n), .dir_bit(sw[7]), .BCD(units_bcd)
    );

bcd_counter u_counter_tens(
    .clk_div(clk_out), .BTN0(rst_n), .dir_bit(sw[8]), .BCD(tens_bcd)
);

alu u_alu(
    .A(units_bcd), .B(tens_bcd), .CTRL(sw[6:5]), .RESULT(result)
);

    control_decoder u_ctrl(
        .nibble({sw[8:5]}), .ctrl_nibble(ctrl_nibble)
    );


seg7_scan u_seg(
    .clk(clk), .rst_n(rst_n),
    .dig0(units), .dig1(tens), .dig2(ctrl_nibble),
    .an(an), .seg(seg)
);

assign led[3:0] = units_bcd;
assign led[7:4] = tens_bcd;

endmodule