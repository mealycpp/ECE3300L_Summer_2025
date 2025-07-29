`timescale 1ns / 1ps

module clock_divider(
input clk,
input rst_n,
input [4:0]sel,
output clk_out
);
reg [31:0]cnt;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 0;//if reset is low, count is 0
    else 
        cnt <= cnt + 1;//if reset is high count can increment
end

assign clk_out = cnt[sel]; //we assign our clock signal to a single cnt index, since a single index is proportional to clock period

endmodule