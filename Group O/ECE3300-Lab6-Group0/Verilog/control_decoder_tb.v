module control_decoder_tb;
    reg CLK_DIV;
    reg RST;
    reg [3:0] SW;
    wire [3:0] CTRL;

    control_decoder uut (
        .clk_div(CLK_DIV),
        .BTN0(RST),
        .SW(SW),
        .ctrl_nibble(CTRL)
    );

    always #10 CLK_DIV = ~CLK_DIV;

    initial begin
        CLK_DIV = 0;
        RST = 0; SW = 4'b1010; #20;
        RST = 1; #40;
        SW = 4'b1100; #40;
        RST = 0; #20;
        RST = 1; #40;
        $finish;
    end
endmodule