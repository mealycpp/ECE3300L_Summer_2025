`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 04:13:13 PM
// Design Name: 
// Module Name: tb_decoder4x16
// Project Name: 
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


`timescale 1ns / 1ps

module tb_decoder4x16;
    reg  [3:0] SW;
    reg        en;
    wire [15:0] LED;

    // Instantiate the DUT (Device Under Test)
    decoder4to16 dut (
        .SW(SW),
        .en(en),
        .LED(LED)
    );

    integer i;
    integer pass;

    initial begin
        pass = 1;
        $display("---- Starting testbench ----");

        // Test en = 1: one-hot output
        en = 1;
        for (i = 0; i < 16; i = i + 1) begin
            SW = i;
            #10;
            if (LED !== (16'b1 << i)) begin
                $display("FAIL at SW = %b: Expected LED = %b, Got LED = %b", SW, (16'b1 << i), LED);
                pass = 0;
                $fatal;
            end else begin
                $display("PASS at SW = %b → LED = %b", SW, LED);
            end
        end

        // Test en = 0: all outputs should be 0
        en = 0;
        SW = 4'b0000;
        #10;
        if (LED !== 16'b0) begin
            $display("FAIL: With en=0, expected all outputs LOW. Got LED = %b", LED);
            pass = 0;
            $fatal;
        end else begin
            $display("PASS: en=0 → LED = %b", LED);
        end

        if (pass) $display("All tests PASSED!");
        $finish;
    end
endmodule

