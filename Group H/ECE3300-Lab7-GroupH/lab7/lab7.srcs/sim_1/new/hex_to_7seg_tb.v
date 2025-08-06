`timescale 1ns / 1ps

module hex_to_7seg_tb;

    reg [3:0] hex;

    wire [6:0] seg;

    hex_to_7seg uut (
        .hex(hex),
        .seg(seg)
    );

    initial begin
        $display("Starting hex_to_7seg_tb...");
        $monitor("Input Hex: %h -> Output Seg: %b", hex, seg);

        hex = 4'h0; #10;
        hex = 4'h1; #10;
        hex = 4'h2; #10;
        hex = 4'h3; #10;
        hex = 4'h4; #10;
        hex = 4'h5; #10;
        hex = 4'h6; #10;
        hex = 4'h7; #10;
        hex = 4'h8; #10;
        hex = 4'h9; #10;
        hex = 4'hA; #10;
        hex = 4'hB; #10;
        hex = 4'hC; #10;
        hex = 4'hD; #10;
        hex = 4'hE; #10;
        hex = 4'hF; #10;

        $display("Simulation finished.");
        $finish;
    end

endmodule
