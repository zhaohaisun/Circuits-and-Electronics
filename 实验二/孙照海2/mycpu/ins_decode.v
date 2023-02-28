module ins_decode(en,ir,mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,jc,in1,out1,nop,halt);
  input wire en;
  input wire [7:0] ir;
  output reg mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,jc,in1,out1,nop,halt;
  always @(ir) //ir��Ϊ0ʱ
    begin {mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,jc,in1,out1,nop,halt}=0;
    if(en==1'b1)
      begin
      if(ir[7:4]==4'b1100)
      begin
        if(ir[3:2]==2'b11) movb=1;
        else if(ir[1:0]==2'b11) movc=1;
        else mova=1;
      end
      else if(ir[7:4]==4'b1001) add=1;
      else if(ir[7:4]==4'b0110) sub=1;
      else if(ir[7:4]==4'b1011) and1=1;
      else if(ir[7:4]==4'b0101) not1=1;
      else if(ir[7:4]==4'b1010)
      begin
        if(ir[1:0]==2'b00) rsr=1;
        else if(ir[1:0]==2'b11) rsl=1;
      end
      else if(ir[7:2]==6'b001100)
      begin
        if(ir[1:0]==2'b00) jmp=1;
        else if(ir[1:0]==2'b01) jz=1;
        else if(ir[1:0]==2'b10) jc=1;
      end
      else if(ir[7:4]==4'b0010) in1=1;
      else if(ir[7:4]==4'b0100) out1=1;
      else if(ir[7:0]==8'b01110000) nop=1;
      else if(ir[7:0]==8'b10000000) halt=1;
      end
    end

endmodule