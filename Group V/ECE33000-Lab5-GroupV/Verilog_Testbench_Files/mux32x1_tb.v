`timescale 1ns / 1ps

module mux32x1_tb(
);
reg[31:0]cnt;
reg[4:0]sel;
wire clk_out;

mux32x1 muxtest(
.cnt(cnt),
.sel(sel),
.clk_out(clk_out)
);

integer i;

initial begin
//initial conditions
cnt = 32'b11001100110011001100110011001100;
sel = 4'd00001;
//for each select index, we see what the output at clk_out is
for (i = 0; i < 32; i = i + 1) begin
#20
sel = i;
end
#50;
$finish;
end
endmodule