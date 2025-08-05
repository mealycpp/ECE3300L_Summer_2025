`timescale 1ns / 1ps
module debounce_toggle_tb;

    reg clk = 0;
    reg btn_raw = 0;
    wire btn_toggle;

    debounce_toggle uut (
        .clk_1kHz(clk),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );

    always #500 clk = ~clk; 

    initial begin
        #2000;

        btn_raw = 1; #100;
        btn_raw = 0; #100;
        btn_raw = 1; #200;
        btn_raw = 0; #100;
        btn_raw = 1; #1000;

        #5000;

        btn_raw = 0; #100;
        btn_raw = 1; #100;
        btn_raw = 0; #200;
        btn_raw = 1; #100;
        btn_raw = 0; #1000;


        btn_raw = 1; #3000;
        btn_raw = 0; #3000;

        #1000;
        $finish;
    end
endmodule
