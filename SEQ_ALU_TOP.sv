module SEQ_ALU_TOP;
bit clk;
parameter T_period = 10;
initial
begin
clk=0;
forever #(T_period/2) clk=~clk;
end



SEQ_ALU_INTERFACE ALU_INTR (clk);

SEQ_ALU DUT (ALU_INTR);

SEQ_ALU_MONITOR mon (ALU_INTR);

SEQ_ALU_driver driv (ALU_INTR);

SEQ_ALU_SCOREBOARD score (ALU_INTR);

bind SEQ_ALU SEQ_ALU_SVA sva (ALU_INTR);

endmodule
