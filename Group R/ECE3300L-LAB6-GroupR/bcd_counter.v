`timescale 1ns / 1ps


module bcd_counter(
    input clk_div,
    input btn0,
    input dir_bit,             // 1 = up, 0 = down
    output reg [3:0] led
    );
    
    always @(posedge clk_div or negedge btn0)
        if (!btn0)
            led <= 4'b0000;
        else begin
            if (dir_bit==1'b1) begin
                if (led == 4'd9)
                    led <= 4'd0;
                else
                    led <= led + 1;
            end else begin
                if (led == 4'd0)
                    led <= 4'd9;
                else
                    led <= led - 1;
            end
        end
    
endmodule
