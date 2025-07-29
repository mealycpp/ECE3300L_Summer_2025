module control_decoder_tb;
    reg CLK_DIV_tb;
    reg RST_tb;
    reg [3:0] SW_tb;
    wire [3:0] CTRL_tb;

    control_decoder uut (
        .clk_div(CLK_DIV_tb),
        .BTN0(RST_tb),
        .SW(SW_tb),
        .ctrl_nibble(CTRL_tb)
    );

    always #10 CLK_DIV_tb = ~CLK_DIV_tb;

    initial begin
        CLK_DIV_tb = 0;
        RST_tb = 0; SW_tb = 4'b1010; #20;
        RST_tb = 1; #40;
        SW_tb = 4'b1100; #40;
        RST_tb = 0; #20;
        RST_tb = 1; #40;
        $finish;
    end
endmodule