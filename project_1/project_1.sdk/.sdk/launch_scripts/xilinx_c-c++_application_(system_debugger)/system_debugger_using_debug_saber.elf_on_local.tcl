connect -url tcp:127.0.0.1:3121
source D:/Vivado2018_installed/SDK/2018.1/scripts/sdk/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A7B4EE"} -index 1
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A7B4EE" && level==0} -index 0
fpga -file D:/SABER_FPGA_cleaned_for_Github/project_1/project_1.sdk/Top_wrapper_hw_platform_0/Top_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A7B4EE"} -index 1
loadhw -hw D:/SABER_FPGA_cleaned_for_Github/project_1/project_1.sdk/Top_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A7B4EE"} -index 1
source D:/SABER_FPGA_cleaned_for_Github/project_1/project_1.sdk/Top_wrapper_hw_platform_0/psu_init.tcl
psu_init
after 1000
psu_ps_pl_isolation_removal
after 1000
psu_ps_pl_reset_config
catch {psu_protection}
targets -set -nocase -filter {name =~"*A53*0" && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A7B4EE"} -index 1
rst -processor
dow D:/SABER_FPGA_cleaned_for_Github/project_1/project_1.sdk/Saber/Debug/Saber.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~"*A53*0" && jtag_cable_name =~ "Digilent JTAG-SMT2NC 210308A7B4EE"} -index 1
con
