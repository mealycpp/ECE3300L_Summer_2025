module clock_divider_tb;
    reg CLK_tb;
    reg RST_tb;
    reg [4:0] SEL_tb;
    wire [31:0] CNT_tb;
    wire CLK_DIV_tb;

    clock_divider uut (
        .clk(CLK_tb),
        .BTN0(RST_tb),
        .sel(SEL_tb),
        .cnt(CNT_tb),
        .clk_div(CLK_DIV_tb)
    );

    always #5 CLK_tb = ~CLK_tb;

    initial begin
        CLK_tb = 0;
        RST_tb = 0;
        SEL_tb = 5'd2;
        #20;
        RST_tb = 1;
        #200;
        RST_tb = 0;
        #20;
        RST_tb = 1;
        #500;
        $finish;
    end
endmodule