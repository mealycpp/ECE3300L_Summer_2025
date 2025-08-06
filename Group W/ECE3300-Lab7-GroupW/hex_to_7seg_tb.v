`timescale 1ns / 1ps

module hex_to_7seg_tb(

    );
    
    reg [3:0] digitVal_tb;
    wire [6:0] SEG_tb;
    
    hex_to_7seg tb(
        .digitVal(digitVal_tb),
        .SEG(SEG_tb)
    );
    
    integer i;
    
    initial
        begin
            digitVal_tb = 4'd0;
            
            for (i = 0; i <= 16; i = i + 1) 
                begin
                    digitVal_tb = i[3:0]; 
                    #10;
                end
                
            $finish;
            
        end
    
endmodule
