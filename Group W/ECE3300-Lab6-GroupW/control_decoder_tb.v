`timescale 1ns / 1ps

module control_decoder_tb(

    );
    
    reg Sw4_tb, Sw3_tb, Sw2_tb, Sw1_tb;
    wire [3:0] ctrl_nibble_tb;
    
    control_decoder tb (
        .Sw4(Sw4_tb),
        .Sw3(Sw3_tb),
        .Sw2(Sw2_tb),
        .Sw1(Sw1_tb),
        .ctrl_nibble(ctrl_nibble_tb)
    );
    
    initial 
        begin
            Sw1_tb = 1;
            Sw2_tb = 1;
            Sw3_tb = 0;
            Sw4_tb = 0;
            #40
        
            Sw1_tb = 0;
            Sw2_tb = 0;
            Sw3_tb = 0;
            Sw4_tb = 1;
            #40
        
            $finish;
        end
    
endmodule
