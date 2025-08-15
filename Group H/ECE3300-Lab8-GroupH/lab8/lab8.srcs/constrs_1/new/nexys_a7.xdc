## This file is a general .xdc for the Nexys A7-100T
## This version has been configured for the ECE3300L Lab 8 project.

## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { CLK100MHZ }];

## Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { SW[0] }];
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { SW[1] }];
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { SW[2] }];
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { SW[3] }];
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { SW[4] }];
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { SW[5] }];
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { SW[6] }];
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { SW[7] }];

## LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];

## Buttons
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { BTNC }]; # Reset
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { BTNR }]; # Load

## RGB LED 1 (LD16) - Left LED
set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { RGB1_B }];
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { RGB1_G }];
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { RGB1_R }];

## RGB LED 2 (LD17) - Right LED
## FIX: Swapped R and G pins based on hardware testing observations.
## This is the most likely source of the two LEDs showing different colors.
set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { RGB2_G }]; # Was N16, now R11 (Green's pin)
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { RGB2_R }]; # Was R11, now N16 (Red's pin)
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { RGB2_B }]; # Unchanged
