vlib work
vlog *v +cover -covercells
vsim -voptargs=+acc work.SEQ_ALU_TOP -cover
add wave *
coverage exclude -src SEQ_ALU.sv -line 30 -code s
coverage exclude -src SEQ_ALU.sv -line 28 -code b
coverage save SEQ_ALU_TOP.ucdb -onexit -du work.SEQ_ALU -du SEQ_ALU_PACKAGE
run -all
#vcover report SEQ_ALU_TOP.ucdb -details -annotate -all -output coverage_rprt.txt