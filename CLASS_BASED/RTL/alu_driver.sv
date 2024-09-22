import alu_package::*;
`include "alu_sequencer.sv"

class alu_driver;
 virtual alu_interface alu_vif;
 mailbox drv_mbx;
 event drv_done;
 
 task run();
  $display("T=%0t [DRIVER] Starting....",$time);
  @(posedge alu_vif.clk)

   forever begin
    seq_item item;
    $display("T=%0t [Driver] waiting for item ...",$time);
    drv_mbx.get(item);
    alu_vif.A <= item.A;
    alu_vif.B  <= item.B;
    alu_vif.opcode <= item.opcode;
    alu_vif.en <= item.en;
    alu_vif.rst <= item.rst;
    @(posedge alu_vif.clk);
    ->drv_done;
   end
 endtask:run
endclass
