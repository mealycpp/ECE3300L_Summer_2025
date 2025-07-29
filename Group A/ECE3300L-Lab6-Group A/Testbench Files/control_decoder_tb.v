`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 09:29:40 PM
// Design Name: 
// Module Name: control_decoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control_decoder_tb(

    );
    
    reg SW5, SW6, SW7, SW8;
    wire [3:0] nibble;
    
    control_decoder decode(SW5, SW6, SW7, SW8, nibble);
    
    initial begin
        SW5 = 0;
        SW6 = 0;
        SW7 = 0;
        SW8 = 0;
        
        #5
        
        SW5 = 1;
        SW6 = 0;
        SW7 = 0;
        SW8 = 0;
        
        #5
        
        SW5 = 0;
        SW6 = 1;
        SW7 = 0;
        SW8 = 0;
        
        #5
        
        SW5 = 1;
        SW6 = 1;
        SW7 = 0;
        SW8 = 0;
        
        #5
        
        SW5 = 0;
        SW6 = 0;
        SW7 = 1;
        SW8 = 0;
        
        #5
        
        SW5 = 1;
        SW6 = 0;
        SW7 = 1;
        SW8 = 0;
        
        #5
        
        SW5 = 0;
        SW6 = 1;
        SW7 = 1;
        SW8 = 0;
        
        #5
        
        SW5 = 1;
        SW6 = 1;
        SW7 = 1;
        SW8 = 0;
        
        #5
        
        SW5 = 0;
        SW6 = 0;
        SW7 = 0;
        SW8 = 1;
        
        #5
        
        SW5 = 1;
        SW6 = 0;
        SW7 = 0;
        SW8 = 1;
        
        #5
        
        SW5 = 0;
        SW6 = 1;
        SW7 = 0;
        SW8 = 1;
        
        #5
        
        SW5 = 1;
        SW6 = 1;
        SW7 = 0;
        SW8 = 1;
        
        #5
        
        SW5 = 0;
        SW6 = 0;
        SW7 = 1;
        SW8 = 1;
        
        #5
        
        SW5 = 1;
        SW6 = 0;
        SW7 = 1;
        SW8 = 1;
        
        #5
        
        SW5 = 0;
        SW6 = 1;
        SW7 = 1;
        SW8 = 1;
        
        #5
        
        SW5 = 1;
        SW6 = 1;
        SW7 = 1;
        SW8 = 1;
    end
    
endmodule
