`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2025 03:49:17 PM
// Design Name: 
// Module Name: tb_mux16x1_db
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


module tb_mux16x1_db;
//Set Testbench variables
    reg btnu, btnr, btnl, btnd;
    reg [15:0] in_mux;
    reg rst;
    reg clk;
    wire out;
    integer i;

//Set DUT
    top_mux_lab3 muxTest ( 
        .clk(clk),
        .rst(rst),
        .SW(in_mux),
        .btnD(btnd), 
        .btnR(btnr), 
        .btnL(btnl), 
        .btnU(btnu), 
        .LED0(out)
    );

    // Set clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  //10ns period, swap every 5ns
    end

    // button press simulation since we are using debounced signal
    task button_press(input [3:0] value);
        integer j; //variable for for loop
        begin
            rst = 1; #20; rst = 0; #20; //reset button

            //press button located at index if the select input is high at that index.
            for (j = 0; j < 4; j = j + 1) begin //begin for loop
                if (value[j] == 1) begin
                    case (j)
                        0: begin //set btnd high
                            btnd = 1; #30;
                            btnd = 0; #20;
                        end
                        1: begin //set btnl high
                            btnr = 1; #30;
                            btnr = 0; #20;
                        end
                        2: begin //set btnr high
                            btnl = 1; #30;
                            btnl = 0; #20;
                        end
                        3: begin // set btnd high
                            btnu = 1; #30;
                            btnu = 0; #20;
                        end
                    endcase //end case statement
                end //end if statement
            end
            //#50; delay for debounce
        end //end the task
    endtask //end task

    // Main loop
    initial begin: Test
    //reset all pushbuttons, set a random value for in_mux
        rst = 0;
        btnu = 0; btnl = 0; btnr = 0; btnd = 0;
        in_mux = 16'b1010101010101010;  
        
        //loop from 0->15, press button at index i, if output is the same as mux input, then pass, else fail
        for (i = 0; i < 16; i = i + 1) begin //begin for loop
            button_press(i);  // pass index as 4-bit vector
            if (out == in_mux[i]) begin //begin if statement
                $display("%0d, PASS", i);
            end else begin //end if loop, begin for loop
                $fatal(1, "%0d, fail", i);
            end  //end else
        end //end for loop
        $finish; //finish testbench
    end
endmodule
