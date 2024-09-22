vlib work
vlog *v +cover -covercells
vsim -voptargs=+acc work.alu_top -cover
coverage save alu_top.ucdb -onexit -du work.alu -du work.alu_package
run -all
#vcover report alu_top.ucdb -details -annotate -all -output coverage_rprt.txt