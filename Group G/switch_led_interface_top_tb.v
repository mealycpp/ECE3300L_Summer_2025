`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 06:30:46 PM
// Design Name: 
// Module Name: switch_led_interface_top_tb
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


module switch_led_interface_top_tb(

    );
    
    reg [15:0] switch;
    wire [15:0] light;
    
    
        switch_led_interface_top TB_TESTING(
                            .sw(switch),
                            .led(light)
                              );
        initial 
         begin
          switch = 16'b0000000000000001;
          #10
          switch = 16'b0000000000000010;
          #10
          switch = 16'b0000000000000100;
          #10
          switch = 16'b0000000000001000;
          #10
          switch = 16'b0000000000010000;
          #10
          switch = 16'b0000000000100000;
          #10
          switch = 16'b0000000001000000;
          #10
          switch = 16'b0000000010000000;
          #10
          switch = 16'b0000000100000000;
          #10
          switch = 16'b0000001000000000;
          #10
          switch = 16'b0000010000000000;
          #10
          switch = 16'b0000100000000000;
          #10
          switch = 16'b0001000000000000;
          #10
          switch = 16'b0010000000000000;
          #10
          switch = 16'b0100000000000000;
          #10
          switch = 16'b1000000000000000;
          #10
          $finish;
         end
endmodule
