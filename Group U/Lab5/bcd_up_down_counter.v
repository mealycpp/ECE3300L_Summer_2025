`timescale 1ns / 1ps


module bcd_up_down_counter(
    input clk,              
    input rst_n,            
    input dir,             
    output reg [3:0] lsb0 = 0, 
    output reg [3:0] lsb1 = 0 
);


     always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            lsb0 <= 0;
            lsb1 <= 0;
        end else begin
            if (dir) begin  
                if (lsb0 == 9) begin
                    lsb0 <= 0;
                    lsb1 <= (lsb1 == 9) ? 0 : lsb1 + 1;
                end else
                    lsb0 <= lsb0 + 1;
            end else begin  
                if (lsb0 == 0) begin
                    lsb0 <= 9;
                    lsb1 <= (lsb1 == 0) ? 9 : lsb1 - 1;
                end else
                    lsb0 <= lsb0 - 1;
            end
        end
    end
endmodule