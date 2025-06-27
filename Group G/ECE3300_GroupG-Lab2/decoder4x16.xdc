## Clock signal (optional for this project unless used in future)
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}];
## Switches (SW0 - SW4)
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { A[0] }]; # SW0
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { A[1] }]; # SW1
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { A[2] }]; # SW2
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { A[3] }]; # SW3
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { E }];    # SW4 (Enable)
## LEDs (LD0-LD15)
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { Y[0] }];  # LD15
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { Y[1] }];  # LD14
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { Y[2] }];  # LD13
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { Y[3] }];  # LD12
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { Y[4] }];  # LD11
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { Y[5] }];  # LD10
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { Y[6] }];  # LD9
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { Y[7] }];  # LD8
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { Y[8] }];  # LD7
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { Y[9] }];  # LD6
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { Y[10] }]; # LD5
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { Y[11] }]; # LD4
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { Y[12] }]; # LD3
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { Y[13] }]; # LD2
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { Y[14] }]; # LD1
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { Y[15] }]; # LD0
