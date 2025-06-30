## This file is a general .xdc for the Nexys A7-100T
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project
## Note: As the Nexys 4 DDR was rebranded to the Nexys A7 with no substantial changes, this XDC file will also work for the Nexys 4 DDR.

## Clock
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Reset
set_property PACKAGE_PIN C12 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## Switches (SW0 - SW15)
set_property PACKAGE_PIN J15 [get_ports {SW[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[0]}]

set_property PACKAGE_PIN L16 [get_ports {SW[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[1]}]

set_property PACKAGE_PIN M13 [get_ports {SW[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[2]}]

set_property PACKAGE_PIN R15 [get_ports {SW[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[3]}]

set_property PACKAGE_PIN R17 [get_ports {SW[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[4]}]

set_property PACKAGE_PIN T18 [get_ports {SW[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[5]}]

set_property PACKAGE_PIN U18 [get_ports {SW[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[6]}]

set_property PACKAGE_PIN R13 [get_ports {SW[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[7]}]

set_property PACKAGE_PIN T8 [get_ports {SW[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[8]}]

set_property PACKAGE_PIN U8 [get_ports {SW[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[9]}]

set_property PACKAGE_PIN R16 [get_ports {SW[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[10]}]

set_property PACKAGE_PIN T13 [get_ports {SW[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[11]}]

set_property PACKAGE_PIN H6 [get_ports {SW[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[12]}]

set_property PACKAGE_PIN U12 [get_ports {SW[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[13]}]

set_property PACKAGE_PIN U11 [get_ports {SW[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[14]}]

set_property PACKAGE_PIN V10 [get_ports {SW[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[15]}]

## Buttons (btnU, btnD, btnL, btnR)
set_property PACKAGE_PIN M18 [get_ports {btnU}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnU}]

set_property PACKAGE_PIN P18 [get_ports {btnD}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnD}]

set_property PACKAGE_PIN P17 [get_ports {btnL}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnL}]

set_property PACKAGE_PIN M17 [get_ports {btnR}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnR}]

## LED0 (Mux Output)
set_property PACKAGE_PIN H17 [get_ports {LED0}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED0}]

## LED1-LED4 (sel[0]-sel[3] Debug)
set_property PACKAGE_PIN K15 [get_ports {LED1}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED1}]

set_property PACKAGE_PIN J13 [get_ports {LED2}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED2}]

set_property PACKAGE_PIN N14 [get_ports {LED3}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED3}]

set_property PACKAGE_PIN R18 [get_ports {LED4}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED4}]
