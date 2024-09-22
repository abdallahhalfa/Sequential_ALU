import alu_package::*;
`include "alu_env.sv"

module alu_top ;
	bit clk;
	alu_env e0;

	always #10 clk=~clk;
	alu_interface intr (clk);
        logic signed [4:0] cexpc;

	ALU DUT (
		.A(intr.A),
		.B(intr.B),
		.opcode(intr.opcode),
		.en(intr.en),
		.clk(clk),
		.rst(intr.rst),
		.C(intr.C)
		);


	initial begin
		clk = 0;
		intr.rst = 0;
		#20 intr.rst =1;

		e0 = new();
		e0.alu_vif = intr;
		
		e0.run();
		#30 $display ("PASS Tests = %0d , ERROR Tests = %0d",e0.s0.correct_count,e0.s0.error_count);
		$stop();
	end


endmodule : alu_top
