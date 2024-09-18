import SEQ_ALU_PACKAGE::*;
interface SEQ_ALU_INTERFACE (clk);
input clk; 
logic rst,en;
logic signed [3:0] A,B;
opcode_e opcode;
logic signed [4:0] C;

modport DUT (input clk,rst, en, A, B, opcode, output C);
modport DRIVER (input clk, output rst, en, A, B, opcode);
modport MONITOR (input clk,rst, en, A, B, opcode, C);
endinterface