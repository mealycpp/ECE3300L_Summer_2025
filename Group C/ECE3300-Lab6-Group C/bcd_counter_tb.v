
module bcd_counter_tb;
    reg CLK_DIV_tb;
    reg RST_tb;
    reg DIR_tb;
    wire [3:0] BCD_tb;

    bcd_counter uut (
        .clk_div(CLK_DIV_tb),
        .BTN0(RST_tb),
        .dir_bit(DIR_tb),
        .BCD(BCD_tb)
    );

    always #10 CLK_DIV_tb = ~CLK_DIV_tb;

    initial begin
        CLK_DIV_tb = 0;
        RST_tb = 0;
        DIR_tb = 1;
        #20; RST_tb = 1;
        repeat (15) @(posedge CLK_DIV_tb);
        DIR_tb = 0;
        repeat (15) @(posedge CLK_DIV_tb);
        $finish;
    end
endmodule