`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Paul Kim and Winson Zhu
// 
// Create Date: 06/19/2025 08:37:22 PM
// Design Name: 
// Module Name: tb_decoder4x16
// Project Name: tb_decoder4x16
// Target Devices: ARTIX - 7 Family
// Tool Versions: Vivado 2025.1
// Description: 4-to-16 decoder with enable.
// 
// Dependencies: 
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////


module tb_decoder4x16;

    reg [3:0] sw_tb;
    reg e_tb;
    wire [15:0] led_tb;

    decoder4x16_behav TEST (.e(e_tb),.sw(sw_tb),.led(led_tb));

    initial
    begin: testCase1
        e_tb = 1'b1; // Enable is ON

        sw_tb = 4'd0;
        #10;
        if (led_tb[0] == 1) $display("PASS0");
        else $fatal(1, "FAIL0");

        sw_tb = 4'd1;
        #10;
        if (led_tb[1] == 1) $display("PASS1");
        else $fatal(1, "FAIL1");

        sw_tb = 4'd2;
        #10;
        if (led_tb[2] == 1) $display("PASS2");
        else $fatal(1, "FAIL2");

        sw_tb = 4'd3;
        #10;
        if (led_tb[3] == 1) $display("PASS3");
        else $fatal(1, "FAIL3");

        sw_tb = 4'd4;
        #10;
        if (led_tb[4] == 1) $display("PASS4");
        else $fatal(1, "FAIL4");

        sw_tb = 4'd5;
        #10;
        if (led_tb[5] == 1) $display("PASS5");
        else $fatal(1, "FAIL5");

        sw_tb = 4'd6;
        #10;
        if (led_tb[6] == 1) $display("PASS6");
        else $fatal(1, "FAIL6");

        sw_tb = 4'd7;
        #10;
        if (led_tb[7] == 1) $display("PASS7");
        else $fatal(1, "FAIL7");

        sw_tb = 4'd8;
        #10;
        if (led_tb[8] == 1) $display("PASS8");
        else $fatal(1, "FAIL8");

        sw_tb = 4'd9;
        #10;
        if (led_tb[9] == 1) $display("PASS9");
        else $fatal(1, "FAIL9");

        sw_tb = 4'd10;
        #10;
        if (led_tb[10] == 1) $display("PASS10");
        else $fatal(1, "FAIL10");

        sw_tb = 4'd11;
        #10;
        if (led_tb[11] == 1) $display("PASS11");
        else $fatal(1, "FAIL11");

        sw_tb = 4'd12;
        #10;
        if (led_tb[12] == 1) $display("PASS12");
        else $fatal(1, "FAIL12");

        sw_tb = 4'd13;
        #10;
        if (led_tb[13] == 1) $display("PASS13");
        else $fatal(1, "FAIL13");

        sw_tb = 4'd14;
        #10;
        if (led_tb[14] == 1) $display("PASS14");
        else $fatal(1, "FAIL14");

        sw_tb = 4'd15;
        #10;
        if (led_tb[15] == 1) $display("PASS15");
        else $fatal(1, "FAIL15");

        // Test when enable is OFF
        e_tb = 1'b0;
        sw_tb = 4'd7; // Arbitrary input
        #10;
        if (led_tb == 16'b0) $display("PASS: e=0 → all outputs LOW");
        else $fatal(1, "FAIL: e=0 → outputs should be LOW but got %b", led_tb);

        #10;
        $display("All tests completed successfully.");
        $finish;
    end

endmodule
