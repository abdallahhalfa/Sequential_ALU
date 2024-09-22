import alu_package::*;
`include "alu_driver.sv"

class alu_monitor;
	virtual alu_interface alu_vif;
	mailbox scb_mbx;
	seq_item item;
	task run();
		$display("T=%0t [Monitor] starting ...",$time);
		forever begin
			seq_item item = new;
			item.A <= alu_vif.A;
			item.B  <= alu_vif.B;
			item.opcode <= alu_vif.opcode;
			item.en <= alu_vif.en;
                        item.rst <= alu_vif.rst;
			@(posedge alu_vif.clk);
			item.C = alu_vif.C;
			item.rst2 = alu_vif.rst;
			scb_mbx.put(item);
		end
	endtask
endclass

