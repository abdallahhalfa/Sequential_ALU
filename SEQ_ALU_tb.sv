import SEQ_ALU_PACKAGE::*;
module SEQ_ALU_driver(SEQ_ALU_INTERFACE.DRIVER ALU_INTR);

parameter T_period = 10;

ALU ALU_opj;
initial
begin
forever 
begin
#(T_period/2) 
ALU_opj.clk=ALU_INTR.clk;
end
end

initial
begin
ALU_opj=new();
assert_rst();
repeat(1000)
begin
assert(ALU_opj.randomize());
ALU_INTR.rst=ALU_opj.rst;
ALU_INTR.en=ALU_opj.en;
ALU_INTR.A=ALU_opj.A;
ALU_INTR.B=ALU_opj.B;
ALU_INTR.opcode=ALU_opj.opcode;
@(negedge ALU_INTR.clk);
end
$stop;
end


task assert_rst;
ALU_INTR.rst=0;
@(negedge ALU_INTR.clk);
@(negedge ALU_INTR.clk);
ALU_INTR.rst=1;
endtask

endmodule
