module clock_divider_tb;
    wire [31:0] count;
    reg rst;
    reg clock;

    clock_divider inc(
        .cnt(count),
        .rst_n(rst),
        .clk(clock)
    );

    always #5 clock = ~clock;

    initial begin
        clock = 0;
        rst = 1;       // inactive reset
        #100 rst = 0;  // active reset
        #100 rst = 1;  // release reset
        #5000;
        $finish;
    end
endmodule
