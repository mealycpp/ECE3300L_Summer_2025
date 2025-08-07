`timescale 1ns / 1ps

module barrel_shifter16_tb;
    reg [15:0] data_in;
    reg [3:0] shamt;
    reg dir;
    reg rotate;
    
    wire [15:0] data_out;
    
    barrel_shifter16 uut (
        .data_in(data_in),
        .shamt(shamt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );
    
    initial begin
        // Initialize Inputs
        data_in = 0;
        shamt = 0;
        dir = 0;
        rotate = 0;
        
        #10 data_in = 16'h0001; shamt = 1; dir = 0; rotate = 0;
        #10;
        
        #10 data_in = 16'h8001; shamt = 1; dir = 1; rotate = 1;
        #10;
        
        #10 data_in = 16'hFFFF; shamt = 15; dir = 0; rotate = 0;
        #10;
        
        #10 data_in = 16'h1234; shamt = 0; dir = 0; rotate = 0;
        #10;
        
        $finish;
    end
endmodule