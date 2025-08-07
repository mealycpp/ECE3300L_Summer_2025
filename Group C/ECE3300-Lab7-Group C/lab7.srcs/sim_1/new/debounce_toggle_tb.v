`timescale 1ns / 1ps

module debounce_toggle_tb;

    reg clk1k = 0;
    reg btn_raw = 0;
    wire btn_toggle;

    debounce_toggle uut (
        .clk1k(clk1k),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );

    always #500 clk1k = ~clk1k;

    initial begin
        $display("Starting debounce_toggle_tb");

        #2000;

        btn_raw = 1; #1000;
        btn_raw = 0; #500;
        btn_raw = 1; #300;
        btn_raw = 0; #400;
        btn_raw = 1; #5000;  
        btn_raw = 0; #10000; 

        btn_raw = 1; #400;
        btn_raw = 0; #300;
        btn_raw = 1; #5000;
        btn_raw = 0; #10000;

        $display("Ending debounce_toggle_tb");
        $finish;
    end

endmodule
