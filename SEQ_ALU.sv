import SEQ_ALU_PACKAGE::*;
module SEQ_ALU ( SEQ_ALU_INTERFACE.DUT ALU_INTR );
always@(posedge ALU_INTR.clk, negedge ALU_INTR.rst)
 begin
  if(!ALU_INTR.rst)
   begin
    ALU_INTR.C<=0;
   end
  else if(ALU_INTR.en)
   begin
    case(ALU_INTR.opcode)
     ADD:
       begin
      	ALU_INTR.C<=ALU_INTR.A+ALU_INTR.B;
       end
     SUB:
       begin
      	ALU_INTR.C<=ALU_INTR.A-ALU_INTR.B;     
       end
     AND:
       begin
      	ALU_INTR.C<=ALU_INTR.A&ALU_INTR.B;      
       end
     OR:
       begin
      	ALU_INTR.C<=ALU_INTR.A|ALU_INTR.B;      
       end
     default:
       begin
      	ALU_INTR.C<=0;      
       end
    endcase
   end
 end 
endmodule