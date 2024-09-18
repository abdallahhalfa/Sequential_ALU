package SEQ_ALU_PACKAGE;
 typedef enum {ADD,SUB,AND,OR}opcode_e; 
 parameter MAX_POS = 7;
 parameter MAX_NEG = -8;
 parameter ZERO = 0 ;
 class ALU;
  rand logic rst,en;
  rand logic signed [3:0] A,B;
  rand opcode_e opcode;
  bit clk;
  logic signed [4:0] C;

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

covergroup ALU_GROUP @(posedge clk);
  A_CR: coverpoint A {
	 bins A_zero = {ZERO};
	 bins A_maxpos = {MAX_POS};
	 bins A_maxneg = {MAX_NEG};
         bins A_intr = {ZERO,MAX_POS,MAX_NEG};
	 bins A_others = default;
	}

  B_CR: coverpoint B {
	 bins B_zero = {ZERO};
	 bins B_maxpos = {MAX_POS};
	 bins B_maxneg = {MAX_NEG};
         bins B_intr = {ZERO,MAX_POS,MAX_NEG};
	 bins B_others = default;
	}

  opcode_CR: coverpoint opcode {
	 bins opcode_values = {ADD,SUB,AND,OR};
	}

  opcode_A_B_CR: cross B_CR,A_CR,opcode {
	 bins ADD_SUB_A_B = binsof(B_CR.B_intr)&&binsof(A_CR.A_intr) iff (opcode==ADD || opcode == SUB) ;
	 option.cross_auto_bin_max=0;
	}
endgroup
 
 function new();
  ALU_GROUP=new();
 endfunction
 endclass
endpackage
