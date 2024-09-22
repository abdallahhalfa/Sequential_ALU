import alu_package::*;
class seq_item;
rand logic rst,en;
  rand logic signed [3:0] A,B;
  rand opcode_e opcode;
  bit clk;
  logic signed [4:0] C;
  logic rst2;
  constraint opcode_c {
	if (opcode==ADD || opcode == SUB) {
	 A dist {MAX_POS:=30, MAX_NEG:=30, ZERO:=30 };
	 B dist {MAX_POS:=30, MAX_NEG:=30, ZERO:=30 };
	} 
	}
  constraint rst_c {
	 rst dist {0:=1, 1:=99};
	}
 
  constraint en_c {
	 en dist {0:=5, 1:=95};
	}

endclass
