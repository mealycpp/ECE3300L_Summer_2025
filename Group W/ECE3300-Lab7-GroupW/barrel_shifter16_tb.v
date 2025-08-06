`timescale 1ns / 1ps

module barrel_shifter16_tb(

    );
    
    reg [15:0] data_in_tb;
    reg [3:0] shamt_tb;
    reg dir_tb;
    reg rotate_tb;
    wire [15:0] data_out_tb;
    
    barrel_shifter16 tb (
        .data_in(data_in_tb),
        .shamt(shamt_tb),
        .dir(dir_tb),
        .rotate(rotate_tb),
        .data_out(data_out_tb)
    );
    
    reg clk = 0;
    always #5 clk = ~clk;
    
    always @(posedge clk)
        begin
            shamt_tb <= shamt_tb + 1;
        end
    
    initial
        begin
            data_in_tb = 16'd0;
            shamt_tb = 4'd0;
            dir_tb = 0;
            rotate_tb = 0;
            #100
            
            data_in_tb = 16'b1111_1111_1111_1111;
            shamt_tb = 4'd0;
            dir_tb = 0;
            rotate_tb = 1;
            #100
            
            data_in_tb = 16'b0000_0000_1111_1111;
            shamt_tb = 4'd0;
            dir_tb = 1;
            rotate_tb = 0;
            #100
            
            data_in_tb = 16'b1111_1111_0000_0000;
            shamt_tb = 4'd0;
            dir_tb = 1;
            rotate_tb = 1;
            #100
            
            $finish;
            
        end
    
endmodule
