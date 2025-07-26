module seg7_scan_tb;
    reg clk;
    reg rst_n;
    reg [3:0] digit0;
    reg [3:0] digit1;
    wire [6:0] SEG;
    wire [7:0] AN;
    
    seg7_scan uut (
        .clk(clk),
        .rst_n(rst_n),
        .digit0(digit0),
        .digit1(digit1),
        .SEG(SEG),
        .AN(AN)
        );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;
    end

    initial begin
        digit0 = 4'd7; digit1 = 4'd3;
        #6000000;
        digit0 = 4'd2; digit1 = 4'd8;
        #6000000;
        $finish;
    end
endmodule