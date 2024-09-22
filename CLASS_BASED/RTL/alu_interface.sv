import alu_package::*;
interface alu_interface (clk);
input clk; 
logic rst,en;
logic signed [3:0] A,B;
opcode_e opcode;
logic signed [4:0] C;
endinterface 
