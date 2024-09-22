import alu_package::*;
`include "sequence_item.sv"

class alu_sequencer;
 mailbox drv_mbx;
 event drv_done;
 task run();
  for(int i=0;i<1000;i++) begin
   seq_item item = new();
   item.randomize();
   $display("T=%0t [Generator] Loop: %0d create new item",$time,i);
   drv_mbx.put(item);
   $display("T=%0t [Generator] waiting for driver to done",$time);
   @(drv_done);
  end
 endtask: run
endclass
