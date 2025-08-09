\# ECE3300L Lab 7 — 16-bit Barrel Shifter \& 7-Segment Display



Group U - Nathan Rahbar and Justin Herrera





\##  Description



This project implements a 16-bit combinational \*\*barrel shifter/rotator\*\* on the Nexys A7-100T FPGA. Inputs and control signals are routed through switches and debounced push-buttons. The shifted output is displayed in hexadecimal format using the 4-digit 7-segment display (AN0–AN3).



\### Verilog Modules

\- `barrel\_shifter16.v`: Combinational shifter/rotator supporting logical/rotate and left/right.

\- `debounce\_toggle.v`: Debounces and toggles buttons on clean edges.

\- `shamt\_counter.v`: 2-bit counter for SHAMT\[3:2], incremented via BTNC.

\- `clock\_divider\_fixed.v`: Generates 1kHz (display) and 2Hz (shifter) clocks from 100MHz.

\- `hex\_to\_7seg.v`: Encodes hex nibbles to 7-segment outputs.

\- `seg7\_scan8.v`: Multiplexes 8 digits for scanning output.

\- `top\_lab7.v`: Integrates all components and maps inputs/outputs.



\### Testbenches

\- `barrel\_shifter16\_tb.v`: Sweeps through shift amounts, directions, and modes.

\- `debounce\_toggle\_tb.v`: Simulates bouncing input and clean toggling.

\- `seg7\_scan8\_tb.v`: Verifies scanning and output for all 8 digits.



