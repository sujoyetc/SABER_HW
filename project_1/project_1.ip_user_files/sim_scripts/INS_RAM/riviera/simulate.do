onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+INS_RAM -L xilinx_vip -L xil_defaultlib -L xpm -L dist_mem_gen_v8_0_12 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.INS_RAM xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {INS_RAM.udo}

run -all

endsim

quit -force
