`timescale 1ns / 1ps
module tb_mux32x1;

reg [31:0] tick_bits = 32'hA5A5A5A5;
reg [4:0] speed_select;
wire clk_out;

mux32x1 uut (
    .tick_bits(tick_bits),
    .speed_select(speed_select),
    .clk_out(clk_out)
);

initial begin
    $display("Testing mux32x1");
    for (speed_select = 0; speed_select < 32; speed_select = speed_select + 1) begin
        #5;
    end
    $finish;
end

endmodule
