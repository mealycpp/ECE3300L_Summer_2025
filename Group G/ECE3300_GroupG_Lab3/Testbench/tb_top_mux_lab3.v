`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2025 09:32:03 PM
// Design Name: 
// Module Name: tb_top_mux_lab3
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


module tb_top_mux_lab3;

    reg clk, rst, btnU, btnD, btnL, btnR;
    wire LED0;
    reg [15:0] SW;

    top_mux_lab3 DUT (
        .clk(clk),
        .rst(rst),
        .btnU(btnU),
        .btnD(btnD),
        .btnL(btnL),
        .btnR(btnR),
        .SW(SW),
        .LED0(LED0)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Task to apply a test pattern for a given selection index
    task apply_sel;
        input [15:0] sw_val;
        input btnU_val, btnD_val, btnL_val, btnR_val;
        input integer sel_index;
        begin
            SW = sw_val;
            $display("=== Testing select index: %0d ===", sel_index);
            btnU = btnU_val;
            btnD = btnD_val;
            btnL = btnL_val;
            btnR = btnR_val;
            #40;
            btnU = 0; btnD = 0; btnL = 0; btnR = 0; #40;
            btnU = btnU_val; btnD = btnD_val; btnL = btnL_val; btnR = btnR_val; #40;
            btnU = 0; btnD = 0; btnL = 0; btnR = 0; #40;
        end
    endtask

    initial begin
        // Initialize signals
        btnU = 0; btnD = 0; btnL = 0; btnR = 0;
        SW = 16'b0;

        rst = 1; #20;
        rst = 0; #20;

        // Apply all 16 selections
        apply_sel(16'h0001, 0, 0, 0, 0, 0);
        apply_sel(16'h0002, 0, 1, 0, 0, 1);
        apply_sel(16'h0004, 0, 0, 0, 1, 2);
        apply_sel(16'h0008, 0, 1, 0, 1, 3);
        apply_sel(16'h0010, 0, 0, 1, 0, 4);
        apply_sel(16'h0020, 0, 1, 1, 0, 5);
        apply_sel(16'h0040, 0, 0, 1, 1, 6);
        apply_sel(16'h0080, 0, 1, 1, 1, 7);
        apply_sel(16'h0100, 1, 0, 0, 0, 8);
        apply_sel(16'h0200, 1, 1, 0, 0, 9);
        apply_sel(16'h0400, 1, 0, 0, 1, 10);
        apply_sel(16'h0800, 1, 1, 0, 1, 11);
        apply_sel(16'h1000, 1, 0, 1, 0, 12);
        apply_sel(16'h2000, 1, 1, 1, 0, 13);
        apply_sel(16'h4000, 1, 0, 1, 1, 14);
        apply_sel(16'h8000, 1, 1, 1, 1, 15);

        $display("=== All tests completed successfully ===");
        $finish;
    end

endmodule