`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2025 11:23:00 AM
// Design Name: 
// Module Name: top_mux_lab3_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for top_mux_lab3
// 
// Dependencies: top_mux_lab3, toggle_switch, mux16x1
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_mux_lab3_tb;

    reg clk;
    reg rst;
    reg [15:0] SW;
    reg btnU, btnD, btnL, btnR;
    wire LED0;

    top_mux_lab3 uut (
        .clk(clk),
        .rst(rst),
        .SW(SW),
        .btnU(btnU),
        .btnD(btnD),
        .btnL(btnL),
        .btnR(btnR),
        .LED0(LED0)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Button pulse tasks
    task pulse_btnD;
        begin
            btnD = 1; #20; btnD = 0;
        end
    endtask

    task pulse_btnR;
        begin
            btnR = 1; #20; btnR = 0;
        end
    endtask

    task pulse_btnL;
        begin
            btnL = 1; #20; btnL = 0;
        end
    endtask

    task pulse_btnU;
        begin
            btnU = 1; #20; btnU = 0;
        end
    endtask

    // Main test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        SW = 16'b0000_0000_0000_1001;
        btnU = 0;
        btnD = 0;
        btnL = 0;
        btnR = 0;

        #20;
        rst = 0;

        pulse_btnD;  // sel[0] = 1
        #50;

        pulse_btnR;  // sel[1] = 1
        #50;

        pulse_btnL;  // sel[2] = 1
        #50;

        pulse_btnU;  // sel[3] = 1
        #50;

        // Set SW[15] = 1, should be selected by mux
        SW[15] = 1;
        #20;

        $display("Final LED0 value (expecting SW[15] = 1): %b", LED0);
        #50;
        $finish;
    end

endmodule
