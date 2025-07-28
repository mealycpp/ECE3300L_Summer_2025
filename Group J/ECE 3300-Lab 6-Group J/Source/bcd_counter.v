`timescale 1ns / 1ps

module bcd_counter(
                    input wire clk,
                    input wire rst_n,
                    input wire dir,            // 1 = up, 0 = down
                    output reg [3:0] BCD  // 4-bit BCD output
                  );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            BCD <= 0;
        else if (dir)
            BCD <= (BCD == 9) ? 0 : BCD + 1;    
        else
            BCD <= (BCD == 0) ? 9 : BCD - 1; 
        end
endmodule