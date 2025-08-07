`timescale 1ns / 1ps

module barrel_shifter16_tb;
    
    reg [15:0] data_in;
    reg [3:0] shamt;
    reg dir;
    reg rotate;
    wire [15:0] data_out;
    
    barrel_shifter16 dut (
        .data_in(data_in),
        .shamt(shamt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );
    
    reg clk = 0;
    always #5 clk = ~clk;
    
    always @(posedge clk)
        begin
            shamt <= shamt + 1;
        end
    
    initial
        begin         
            data_in = 16'b1010010110100101;
            shamt = 4'd0;   //left shift
            dir = 0;
            rotate = 0;
            #100
            
            shamt = 4'd0;   //right shift
            dir = 1;
            rotate = 0;
            #100
            
            shamt = 4'd0;   //rotate left
            dir = 0;
            rotate = 1;
            #100
            
            shamt = 4'd0;   //rotate right
            dir = 1;
            rotate = 1;
            #100
            
            data_in = 16'b1111_1111_0000_0000;//other valeus rotated right
            shamt = 4'd0;
            dir = 1;
            rotate = 1;
            #100
            
            data_in = 16'b1111_1111_1111_1111;
            shamt = 4'd0;
            dir = 1;
            rotate = 1;
            #100
            
            data_in = 16'b0000_0000_1111_1111;
            shamt = 4'd0;
            dir = 1;
            rotate = 1;
            #100
            
            #1_000_000
            $finish;
            
        end
    
endmodule