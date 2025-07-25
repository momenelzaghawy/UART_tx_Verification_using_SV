vlib work
vlog -f src_files_UART.list  +cover -covercells
vsim -voptargs=+acc work.UART_top -cover 
add wave *
add wave -position insertpoint  \
sim:/UART_top/uartif/reset \
sim:/UART_top/uartif/P_DATA \
sim:/UART_top/uartif/PAR_EN \
sim:/UART_top/uartif/PAR_TYP \
sim:/UART_top/uartif/DATA_VALID \
sim:/UART_top/uartif/TX_OUT \
sim:/UART_top/uartif/TX_OUT_ex \
sim:/UART_top/uartif/Busy \
sim:/UART_top/uartif/Busy_ex
add wave -position insertpoint  \
sim:/UART_top/dut/state \
sim:/UART_top/dut/counter \
sim:/UART_top/dut/DATA_reg \
sim:/UART_top/dut/PARITY_bit
add wave -position insertpoint  \
sim:/UART_top/GM/counter \
sim:/UART_top/GM/DATA_reg \
sim:/UART_top/GM/PARITY_bit \
sim:/UART_top/GM/cs \
sim:/UART_top/GM/ns
coverage save UART_tb.ucdb -onexit -du UART
run -all


