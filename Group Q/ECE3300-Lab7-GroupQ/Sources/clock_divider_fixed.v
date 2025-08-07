`timescale 1ns / 1ps

module clock_divider_fixed(
                            input clk,
                            output reg clk_1khz,
                            output reg clk_2khz
                            );
                            parameter DIV_2HZ = 26'd25_000_000;    // for 2Hz (toggle)
                            parameter DIV_1KHZ = 17'd50_000;       // for 1kHz
                        
                            reg [25:0] cnt_2hz = 0;
                            reg [16:0] cnt_1khz = 0;
                        
                            always @(posedge clk) begin
                                if (cnt_2hz == DIV_2HZ-1) begin
                                    cnt_2hz <= 0;
                                    clk_2khz <= ~clk_2khz;
                                end else begin
                                    cnt_2hz <= cnt_2hz + 1;
                                end
                            end
                        
                            always @(posedge clk) begin
                                if (cnt_1khz == DIV_1KHZ-1) begin
                                    cnt_1khz <= 0;
                                    clk_1khz <= ~clk_1khz;
                                end else begin
                                    cnt_1khz <= cnt_1khz + 1;
                                end
                            end
endmodule
