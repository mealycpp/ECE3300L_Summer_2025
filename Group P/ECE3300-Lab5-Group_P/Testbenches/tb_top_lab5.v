`timescale 1ns / 1ps
module tb_top_lab5;

// Inputs
reg CLK = 0;
reg BTN0 = 1; // reset (active low)
reg BTN1 = 1; // direction (1 = up, 0 = down)
reg [4:0] SW = 5'd4; // default speed

// Outputs
wire [6:0] SEG;
wire [1:0] AN;
wire [4:0] SWLED;
wire [7:0] BCDLED;

// Instantiate DUT
top_lab5 uut (
    .CLK(CLK),
    .BTN0(BTN0),
    .BTN1(BTN1),
    .SW(SW),
    .SEG(SEG),
    .AN(AN),
    .SWLED(SWLED),
    .BCDLED(BCDLED)
);

// Clock generation
always #5 CLK = ~CLK;

// Stimulus
initial begin
    $display("Start of testbench simulation");

    // Apply reset
    BTN0 = 0; #20; BTN0 = 1;

    // Count up for a while
    BTN1 = 1;
    #500000;

    // Count down for a while
    BTN1 = 0;
    #500000;

    $display("End of testbench simulation");
    $finish;
end

endmodule
