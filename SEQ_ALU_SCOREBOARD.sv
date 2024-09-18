import SEQ_ALU_PACKAGE::*;
module SEQ_ALU_SCOREBOARD (SEQ_ALU_INTERFACE.MONITOR ALU_INTR);

integer correct_count,error_count;
logic signed [4:0] C_expected;

initial
begin
correct_count=0;
error_count=0;
end

always @(posedge ALU_INTR.clk)
begin
golden_model();
check_result();
$display("correct %0d, error %0d",correct_count,error_count);
end



task golden_model;
if(!ALU_INTR.rst)
C_expected=0;
else if(ALU_INTR.en)
begin
case(ALU_INTR.opcode)
ADD:C_expected=ALU_INTR.A+ALU_INTR.B;
SUB:C_expected=ALU_INTR.A-ALU_INTR.B;
AND:C_expected=ALU_INTR.A&ALU_INTR.B;
OR:C_expected=ALU_INTR.A|ALU_INTR.B;
endcase
end
endtask

task check_result;
@(negedge ALU_INTR.clk)
if(ALU_INTR.C==C_expected)
begin
correct_count=correct_count+1;
end
else
begin
error_count=error_count+1;
$display("error at %0t",$time);
end
endtask












endmodule
