set_property PACKAGE_PIN H18 [get_ports {ioPin[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ioPin[1]}]
set_property PACKAGE_PIN J18 [get_ports {ioPin[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ioPin[0]}]
set_property PACKAGE_PIN U18 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN J15 [get_ports RSTn]
set_property IOSTANDARD LVCMOS33 [get_ports RSTn]
set_property PACKAGE_PIN P19 [get_ports SWCLK]
set_property IOSTANDARD LVCMOS33 [get_ports SWCLK]
set_property PACKAGE_PIN N18 [get_ports SWDIO]
set_property IOSTANDARD LVCMOS33 [get_ports SWDIO]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {SWCLK}]

create_clock -period 20.000 -name clk -waveform {0.000 10.000} [get_ports clk]