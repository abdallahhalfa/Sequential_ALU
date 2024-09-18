import SEQ_ALU_PACKAGE::*;
module SEQ_ALU_MONITOR (SEQ_ALU_INTERFACE.MONITOR ALU_INTR);
initial
begin
$monitor("rst %0d, en %0d, A %0d, B %0d, opcode %0d, C %0d",ALU_INTR.rst, ALU_INTR.en, ALU_INTR.A, ALU_INTR.B, ALU_INTR.opcode, ALU_INTR.C);

end
endmodule