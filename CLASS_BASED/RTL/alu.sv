import alu_package::*;
module ALU ( input clk,rst,en,
                 input signed [3:0] A,B,
		 input opcode_e opcode,
                 output reg signed [4:0] C );
always@(posedge clk, negedge rst)
 begin
  if(!rst)
   begin
    C<=0;
   end
  else if(en)
   begin
    case(opcode)
    ADD:
       begin
      	C<=A+B;
       end
    SUB:
       begin
      	C<=A-B;     
       end
    AND:
       begin
      	C<=A&B;      
       end
    OR:
       begin
      	C<=A|B;      
       end
     default:
       begin
      	C<=0;      
       end
    endcase
   end
 end 
endmodule