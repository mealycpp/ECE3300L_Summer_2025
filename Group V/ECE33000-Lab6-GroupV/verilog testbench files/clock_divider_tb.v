module clock_divider_tb;
    reg clk;
    reg rst_n;
    reg [4:0] sel;
    wire clk_out;

clock_divider uut (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .clk_out(clk_out)
    );


    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        sel = 5'd15;
        #20;
        rst_n = 1;
        #200;
        rst_n = 0;
        #20;
        rst_n = 1;
        #100000000;
        $finish;
    end
endmodule