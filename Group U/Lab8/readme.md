\# ECE3300L – Lab 8: RGB LED PWM Controller (Nexys A7)



\##Goal

Design and implement an FPGA-based RGB LED controller using Pulse Width Modulation (PWM) on the Nexys A7 board.  

With a single LOAD button, sequentially configure:

1\. Resolution (PWM period)  

2\. Red duty cycle  

3\. Green duty cycle  

4\. Blue duty cycle  



This lab demonstrates how to control LED brightness and create color blends through digital logic.



---



\##Stage-by-Stage Implementation



\###Stage 1 — Clock Divider (`clock\_divider\_fixed.v`)

Generates:

\- ~1 kHz clock for button debouncing and FSM timing.

\- ~20 kHz clock for flicker-free PWM.



\*\*Micro-Lab A:\*\* Synthesize and ensure no errors.



---



\###Stage 2 — Debounce \& One-Pulse (`debounce\_onepulse.v`)

Cleans mechanical button bounce and produces a single pulse per press.



\*\*Micro-Lab B:\*\* Map `btnr` to LED0 and `pulse` to LED1. LED1 should blink once per press.



---



\###Stage 3 — Load FSM (`load\_fsm.v`)

Cycles through 4 load slots (RES, R, G, B) using a single LOAD button.



\*\*Micro-Lab C:\*\* Verify `led\[3:0]` cycles through `0001 → 0010 → 0100 → 1000 → wrap`.



---



\###Stage 4 — PWM Core (`pwm\_core.v`)

Generates PWM signals for each color channel using stored resolution and duty cycles.



\*\*Micro-Lab D:\*\* Simulate or observe LED brightness at various duty cycles.



---



\###Stage 5 — RGB LED Driver (`rgb\_led\_driver.v`)

Handles active-low inversion for RGB LEDs on Nexys A7.



\*\*Micro-Lab E:\*\* Set `ACTIVE\_LOW = 1` for Nexys A7 LEDs.



---



\###Stage 6 — Top-Level Integration (`top\_lab8.v`)

Connects all modules:

\- Crosses data from 1 kHz to PWM clock domains via two flip-flops.

\- Updates registers based on FSM load slot and switch values.



\*\*Micro-Lab F:\*\*  

Test sequence:

1\. `SW = 8` → press LOAD (RES)

2\. `SW = 128` → press LOAD (RED)

3\. `SW = 64` → press LOAD (GREEN)

4\. `SW = 200` → press LOAD (BLUE) → LOAD again wraps to RES.



---



\##Bonus

\*\*Testbench (`pwm\_core\_tb.v`)\*\*  

Verifies correct PWM output ratio for each color channel.



---

