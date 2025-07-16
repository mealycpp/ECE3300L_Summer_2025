`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 12:00:47 PM
// Design Name: 
// Module Name: mux32x1_tb
// Project Name: mux32x1_tb
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mux32x1_tb();
    reg [31:0] cnt;
    reg [4:0] sel;
    wire clk_out;

    mux32x1 uut (
        .cnt(cnt),
        .sel(sel),
        .clk_out(clk_out)
    );

    initial begin
      cnt = 32'b10101010101010101010101010101010;
      for (sel = 0; sel < 32; sel = sel + 1) begin
            #10; // wait
            $display("sel=%0d, clk_out=%b, expected=%b", sel, clk_out, cnt[sel]);
            if (clk_out !== cnt[sel]) begin
                $display(" Test failed at sel=%0d", sel);
                $stop;
            end
        end

        $display(" All tests passed.");
        $finish;
    end
endmodule
