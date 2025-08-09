`timescale 1ns / 1ps

module seg7_scan8_tb;

    reg clk = 0;
    reg rst = 0;
    reg [6:0] seg_data [7:0];
    wire [6:0] seg;
    wire [7:0] an;

    seg7_scan8 uut (
        .clk(clk),
        .rst(rst),
        .seg_in0(seg_data[0]),
        .seg_in1(seg_data[1]),
        .seg_in2(seg_data[2]),
        .seg_in3(seg_data[3]),
        .seg_in4(seg_data[4]),
        .seg_in5(seg_data[5]),
        .seg_in6(seg_data[6]),
        .seg_in7(seg_data[7]),
        .seg(seg),
        .an(an)
    );

    always #500 clk = ~clk;  // 1 kHz clock

    initial begin
        rst = 1;
        #1000;
        rst = 0;

        seg_data[0] = 7'b1000000; // 0
        seg_data[1] = 7'b1111001; // 1
        seg_data[2] = 7'b0100100; // 2
        seg_data[3] = 7'b0110000; // 3
        seg_data[4] = 7'b0011001; // 4
        seg_data[5] = 7'b0010010; // 5
        seg_data[6] = 7'b0000010; // 6
        seg_data[7] = 7'b1111000; // 7

        #100_000;
        $finish;
    end

endmodule
`timescale 1ns / 1ps

module seg7_scan8_tb;

    reg clk = 0;
    reg rst = 0;
    reg [6:0] seg_data [7:0];
    wire [6:0] seg;
    wire [7:0] an;

    seg7_scan8 uut (
        .clk(clk),
        .rst(rst),
        .seg_in0(seg_data[0]),
        .seg_in1(seg_data[1]),
        .seg_in2(seg_data[2]),
        .seg_in3(seg_data[3]),
        .seg_in4(seg_data[4]),
        .seg_in5(seg_data[5]),
        .seg_in6(seg_data[6]),
        .seg_in7(seg_data[7]),
        .seg(seg),
        .an(an)
    );

    always #500 clk = ~clk;  // 1 kHz clock

    initial begin
        rst = 1;
        #1000;
        rst = 0;

        seg_data[0] = 7'b1000000; // 0
        seg_data[1] = 7'b1111001; // 1
        seg_data[2] = 7'b0100100; // 2
        seg_data[3] = 7'b0110000; // 3
        seg_data[4] = 7'b0011001; // 4
        seg_data[5] = 7'b0010010; // 5
        seg_data[6] = 7'b0000010; // 6
        seg_data[7] = 7'b1111000; // 7

        #100_000;
        $finish;
    end

endmodule
