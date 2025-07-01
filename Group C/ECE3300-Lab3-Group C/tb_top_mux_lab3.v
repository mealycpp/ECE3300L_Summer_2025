`timescale 1ns / 1ps

module tb_top_mux_lab3;

    reg clk, rst, btnU, btnD, btnL, btnR;
    reg [15:0] SW;
    wire LED0;

    top_mux_lab3 uut(
        .clk(clk), .rst(rst),
        .btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR),
        .SW(SW),
        .LED0(LED0)
    );

    // 100 MHz clock
    initial clk = 0;
    always #5 clk = ~clk;

    // Declare integer for loop
    integer i;

    // Tasks for each button
    task pressD; begin btnD = 1; #60; btnD = 0; #100; end endtask
    task pressR; begin btnR = 1; #60; btnR = 0; #100; end endtask
    task pressL; begin btnL = 1; #60; btnL = 0; #100; end endtask
    task pressU; begin btnU = 1; #60; btnU = 0; #100; end endtask

    initial begin
        SW = 0;
        btnU = 0; btnD = 0; btnL = 0; btnR = 0;
        rst = 1; #20; rst = 0;

        for (i = 0; i < 16; i = i + 1) begin
            // Reset selector logic
            rst = 1; #10; rst = 0;

            // Set current switch high
            SW = 16'b1 << i;

            // Press buttons to set sel = i
            if (i[0]) pressD();
            if (i[1]) pressR();
            if (i[2]) pressL();
            if (i[3]) pressU();

            #100;

            $display("Testing sel = %0d | SW[%0d] = %b | LED0 = %b", i, i, SW[i], LED0);

            // Clear switch for next test
            SW = 0;
            #100;
        end

        $finish;
    end

endmodule
