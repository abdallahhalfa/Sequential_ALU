import alu_package::*;
`include "alu_scoreboard.sv"

class alu_env;
	alu_sequencer g0;
	alu_driver	d0;
	alu_monitor m0;
	alu_scoreboard s0;
	mailbox scb_mbx;
	mailbox drv_mbx;
	virtual alu_interface alu_vif;
	event drv_done;

	function new();
		g0 = new;
		d0 = new;
		m0 = new;
		s0 = new;
		scb_mbx = new;
		drv_mbx = new;
	endfunction

	virtual task run;
		d0.alu_vif = alu_vif;
		m0.alu_vif = alu_vif;

		m0.scb_mbx = scb_mbx;
		s0.scb_mbx = scb_mbx;

		g0.drv_mbx = drv_mbx;
		d0.drv_mbx = drv_mbx;

		g0.drv_done = drv_done;
		d0.drv_done = drv_done;

		fork
			s0.run();
			m0.run();
			d0.run();
			g0.run();
		join_any
	endtask
endclass : alu_env
