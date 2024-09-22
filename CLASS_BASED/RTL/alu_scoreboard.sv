import alu_package::*;
`include "alu_monitor.sv"

class alu_scoreboard;
int correct_count,error_count;
int rst_happened;
logic signed [4:0] C_expected;
mailbox scb_mbx;

function new();
begin
correct_count=0;
error_count=0;
rst_happened=0;
C_expected=0;
end
endfunction
task run();
 forever begin
  seq_item item;
  scb_mbx.get(item);
  golden_model(item);
  check_result(item);
  $display("T=%0t, [SCOREBOARD]correct %0d, error %0d",$time,correct_count,error_count);
 end

endtask



task golden_model(seq_item item);
if(!item.rst || !item.rst2)begin
C_expected=0;
end
else if(item.en)
begin
case(item.opcode)
ADD:C_expected=item.A+item.B;
SUB:C_expected=item.A-item.B;
AND:C_expected=item.A&item.B;
OR:C_expected=item.A|item.B;
endcase
end
endtask

task check_result(seq_item item);
if(item.C==C_expected)
begin
correct_count=correct_count+1;
end
else
begin
error_count=error_count+1;
$display("[SCOREBOARD] error at %0t, expected %0d, got %0d",$time,C_expected,item.C);
end
endtask


endclass



