`timescale 1ns / 1ps
module pwm_core_tb;
reg clk = 0, rst_n = 0;
always #10 clk = ~clk; // 50 MHz clock
reg [7:0] period = 8'd7; // eff_period = 8
reg [7:0] dr = 8'd2, dg = 8'd4, db = 8'd6;
wire pr, pg, pb;
pwm_core dut(.clk(clk), .rst_n(rst_n), .period(period),
.duty_r(dr), .duty_g(dg), .duty_b(db),
.pwm_r(pr), .pwm_g(pg), .pwm_b(pb));
integer i, hr, hg, hb;
initial begin
#100 rst_n = 1;
hr = 0; hg = 0; hb = 0;
for (i = 0; i < 8; i = i + 1) begin
@(posedge clk);
hr = hr + pr; hg = hg + pg; hb = hb + pb;
end
$display("R=%0d/8 G=%0d/8 B=%0d/8 (expected: ~2,4,6)", hr, hg, hb);
$finish;
end
endmodule
