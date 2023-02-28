module ins_decode(en,ir,mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,jc,in1,out1,nop,halt);
	input [7:0] ir;
	input en;
	output mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,jc,in1,out1,nop,halt;
	reg mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,jc,in1,out1,nop,halt;
	always@(ir or en)
	begin
	mova=0;movb=0;movc=0;
	add=0;sub=0;and1=0;not1=0;
	rsr=0;rsl=0;
	jmp=0;jz=0;jc=0;
	in1=0;out1=0;
	nop=0;halt=0;
		if (en)
			begin 
				if(ir[7:4]==4'b1100)//1100 refers to move action
					begin
						if(ir[3:2]==2'b11) movb=1;
						else if(ir[1:0]==2'b11) movc=1;
						else mova=1;
					end
				else if(ir[7:4]==4'b1001) add=1;
				else if(ir[7:4]==4'b0101) not1=1;
				else if(ir[7:4]==4'b1011) and1=1;
				else if(ir[7:4]==4'b0110) sub=1;
				else if(ir[7:4]==4'b1010)
					begin
						if(ir[1:0]==2'b11) rsl=1;
						else rsr=1;
					end
				else if(ir[7:4]==4'b0011)//0011 refers to jump action
					begin
						if(ir[1:0]==2'b00) jmp=1;
						else if(ir[1:0]==2'b10) jc=1;
						else if(ir[1:0]==2'b01) jz=1;
					end
				else if(ir[7:4]==4'b1000) halt=1;
				else if(ir[7:4]==4'b0010)in1=1;
				else if(ir[7:4]==4'b0100)out1=1;
				else if(ir[7:4]==4'b0111)nop=1;
				else ;
			end
		else ;
	end
endmodule
