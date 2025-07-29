//bryan

module main(
    input clk,
    input btnC, // reset_n
    input [8:0] SW,
    output [6:0] seg,
    output [2:0] AN,
    output [7:0] LED
);
    wire clk_div;
    wire [3:0] unit_bcd, ten_bcd;
    wire [7:0] result;
    wire [3:0] ctrl;

    clock_divider div(.clk(clk), .sel(SW[4:0]), .clk_div(clk_div));
    bcd_counter u_cnt(.clk(clk_div), .rst_n(btnC), .dir(SW[7]), .out(unit_bcd));
    bcd_counter t_cnt(.clk(clk_div), .rst_n(btnC), .dir(SW[8]), .out(ten_bcd));
    alu alu_inst(.A(unit_bcd), .B(ten_bcd), .ctrl(SW[6:5]), .result(result));
    control_decoder ctrl_inst(.switches(SW[8:5]), .nibble(ctrl));
    seg7_scan disp(.clk(clk), .rst_n(btnC), .result(result), .ctrl(ctrl), .seg(seg), .an(AN));

    assign LED[3:0] = unit_bcd;
    assign LED[7:4] = ten_bcd;
endmodule
