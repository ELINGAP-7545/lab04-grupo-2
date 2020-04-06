transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/bulla/OneDrive/Documents/GitHub/lab04-grupo-2/hdl/src {C:/Users/bulla/OneDrive/Documents/GitHub/lab04-grupo-2/hdl/src/BCDtoSSeg.v}
vlog -vlog01compat -work work +incdir+C:/Users/bulla/OneDrive/Escritorio/4\ Display {C:/Users/bulla/OneDrive/Escritorio/4 Display/BCD_7SEGx4.v}

