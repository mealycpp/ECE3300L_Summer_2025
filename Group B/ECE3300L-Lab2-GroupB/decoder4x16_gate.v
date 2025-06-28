`timescale 1ns / 1ps

module decoder4x16_gate (
    input  wire [3:0] SW,    // Slide switches SW3..SW0
    input  wire       EN,    // Enable switch SW4
    output wire [15:0] LED   // LEDs LED0..LED15
);

    // Generate each LED output
    assign LED[0]  = EN & ~SW[3] & ~SW[2] & ~SW[1] & ~SW[0];
    assign LED[1]  = EN & ~SW[3] & ~SW[2] & ~SW[1] &  SW[0];
    assign LED[2]  = EN & ~SW[3] & ~SW[2] &  SW[1] & ~SW[0];
    assign LED[3]  = EN & ~SW[3] & ~SW[2] &  SW[1] &  SW[0];
    assign LED[4]  = EN & ~SW[3] &  SW[2] & ~SW[1] & ~SW[0];
    assign LED[5]  = EN & ~SW[3] &  SW[2] & ~SW[1] &  SW[0];
    assign LED[6]  = EN & ~SW[3] &  SW[2] &  SW[1] & ~SW[0];
    assign LED[7]  = EN & ~SW[3] &  SW[2] &  SW[1] &  SW[0];
    assign LED[8]  = EN &  SW[3] & ~SW[2] & ~SW[1] & ~SW[0];
    assign LED[9]  = EN &  SW[3] & ~SW[2] & ~SW[1] &  SW[0];
    assign LED[10] = EN &  SW[3] & ~SW[2] &  SW[1] & ~SW[0];
    assign LED[11] = EN &  SW[3] & ~SW[2] &  SW[1] &  SW[0];
    assign LED[12] = EN &  SW[3] &  SW[2] & ~SW[1] & ~SW[0];
    assign LED[13] = EN &  SW[3] &  SW[2] & ~SW[1] &  SW[0];
    assign LED[14] = EN &  SW[3] &  SW[2] &  SW[1] & ~SW[0];
    assign LED[15] = EN &  SW[3] &  SW[2] &  SW[1] &  SW[0];

endmodule




