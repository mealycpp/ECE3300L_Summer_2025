Lab 3: 16x1 Multiplexer Using Nested 2x1 MUXes with Debounced Toggle Select Control 
By: Nicholas Williams and Faris Khan  
Objective: Design a 16-to-1 multiplexer (MUX16x1) using gate-level 2x1 multiplexers in Verilog. We   
will control the MUX using the pushbuttons on the Nexys A7 board, which must behave like switches using  
toggle logic. This requires implementing a debouncing system and a toggle flip-flop for each select bit. The  
output of the multiplexer will be shown on LED0, while the inputs will be fed from the 16 switches (SW[15:0])  
