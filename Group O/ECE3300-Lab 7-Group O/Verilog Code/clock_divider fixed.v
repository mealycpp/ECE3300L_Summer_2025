`timescale 1ns / 1ps
module clock_divider_fixed(
    input wire clk,               
    output reg clk_1kHz = 0,       
    output reg clk_demo = 0      
);

    parameter DIV_VALUE = 26'd50_000_000;
    reg [25:0] count_1Hz = 0;
    reg clk_1Hz = 0;

    reg [9:0] count_1kHz = 0;      
    reg [7:0] count_demo = 0;      

    always @(posedge clk) begin
        if (count_1Hz == DIV_VALUE - 1) begin
            count_1Hz <= 0;
            clk_1Hz <= ~clk_1Hz;
        end else begin
            count_1Hz <= count_1Hz + 1;
        end
    end
  
    always @(posedge clk_1Hz) begin
        if (count_1kHz == 500 - 1) begin
            count_1kHz <= 0;
            clk_1kHz <= ~clk_1kHz;
        end else begin
            count_1kHz <= count_1kHz + 1;
        end
        if (count_demo == 2 - 1) begin
            count_demo <= 0;
            clk_demo <= ~clk_demo;
        end else begin
            count_demo <= count_demo + 1;
        end
    end

endmodule
