import SEQ_ALU_PACKAGE::*;
module SEQ_ALU_SVA (SEQ_ALU_INTERFACE.DUT ALU_INTR);

property p1;
@(posedge ALU_INTR.clk) (!ALU_INTR.rst) |-> (ALU_INTR.C==5'd0);
endproperty

property p2;
disable iff (!ALU_INTR.rst)
@(posedge ALU_INTR.clk) (ALU_INTR.opcode == ADD && ALU_INTR.en) |=> (ALU_INTR.C==$past(ALU_INTR.A)+$past(ALU_INTR.B));
endproperty

property p3;
disable iff (!ALU_INTR.rst)
@(posedge ALU_INTR.clk) (ALU_INTR.opcode == SUB && ALU_INTR.en) |=> (ALU_INTR.C==$past(ALU_INTR.A)-$past(ALU_INTR.B));
endproperty

property p4;
disable iff (!ALU_INTR.rst)
@(posedge ALU_INTR.clk) (ALU_INTR.opcode == AND && ALU_INTR.en) |=> (ALU_INTR.C==$past(ALU_INTR.A & ALU_INTR.B));
endproperty

property p5;
disable iff (!ALU_INTR.rst)
@(posedge ALU_INTR.clk) (ALU_INTR.opcode == OR && ALU_INTR.en) |=> (ALU_INTR.C==$past(ALU_INTR.A)|$past(ALU_INTR.B));
endproperty

property p6;
disable iff (!ALU_INTR.rst)
@(posedge ALU_INTR.clk) (!ALU_INTR.en) |=> $stable(ALU_INTR.C);
endproperty

assert_p1: assert property(p1);
cov_p1: cover property(p1);

assert_p2: assert property(p2);
cov_p2: cover property(p2);

assert_p3: assert property(p3);
cov_p3: cover property(p3);

assert_p4: assert property(p4);
cov_p4: cover property(p4);

assert_p5: assert property(p5);
cov_p5: cover property(p5);

assert_p6: assert property(p6);
cov_p6: cover property(p6);
endmodule
