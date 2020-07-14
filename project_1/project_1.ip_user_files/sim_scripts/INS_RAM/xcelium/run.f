-makelib xcelium_lib/xilinx_vip -sv \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Vivado2018_installed/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/Vivado2018_installed/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Vivado2018_installed/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/dist_mem_gen_v8_0_12 \
  "../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../project_1.srcs/sources_1/ip/INS_RAM/sim/INS_RAM.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

