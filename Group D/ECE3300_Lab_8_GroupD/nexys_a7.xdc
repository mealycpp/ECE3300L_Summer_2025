## Clock 100 MHz
set_property PACKAGE_PIN <CLK100_PIN> [get_ports {clk100mhz}]
set_property IOSTANDARD LVCMOS33       [get_ports {clk100mhz}]
create_clock -period 10.000 -name sys_clk [get_ports {clk100mhz}]

## Buttons (Center = active-low reset, Right = LOAD)
set_property PACKAGE_PIN <BTNC_PIN> [get_ports {btnc_n}]
set_property IOSTANDARD LVCMOS33    [get_ports {btnc_n}]
set_property PULLUP true            [get_ports {btnc_n}]   ;# keep at '1' when unpressed
set_property PACKAGE_PIN <BTNR_PIN> [get_ports {btnr}]
set_property IOSTANDARD LVCMOS33    [get_ports {btnr}]

## 8 switches
set_property IOSTANDARD LVCMOS33 [get_ports {sw[*]}]
# Example (replace with real pins):
# set_property PACKAGE_PIN <SW0_PIN> [get_ports {sw[0]}]
# ...
# set_property PACKAGE_PIN <SW7_PIN> [get_ports {sw[7]}]

## 4 simple LEDs (slot indicator)
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]
# set_property PACKAGE_PIN <LED0_PIN> [get_ports {led[0]}]
# ...
# set_property PACKAGE_PIN <LED3_PIN> [get_ports {led[3]}]

## On-board RGB LED (active-low)
# Replace these three with your RGB LED pins from the master XDC
set_property PACKAGE_PIN <RGB_R_PIN> [get_ports {rgb_r}]
set_property PACKAGE_PIN <RGB_G_PIN> [get_ports {rgb_g}]
set_property PACKAGE_PIN <RGB_B_PIN> [get_ports {rgb_b}]
set_property IOSTANDARD LVCMOS33     [get_ports {rgb_r rgb_g rgb_b}]
