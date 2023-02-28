module con_signal(mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,z,jc,c,in1,out1,nop,halt,ir,sm,
 	reg_ra,reg_wa,madd,alu_s,pc_ld,pc_inc,reg_we,ram_xl,ram_dl,alu_m,shi_fbus,shi_flbus,shi_frbus,ir_ld,cf_en,zf_en,sm_en,in_en,out_en);
	input [7:0] ir;
	input mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,z,jc,c,in1,out1,nop,halt,sm;
	output [1:0]reg_ra;
	output [1:0]reg_wa;
	output [1:0]madd;
	output [3:0]alu_s;
	output pc_ld,pc_inc,reg_we,ram_xl,ram_dl,alu_m,shi_fbus,shi_flbus,shi_frbus,ir_ld,cf_en,zf_en,sm_en,in_en,out_en;
	reg [1:0]reg_ra;
	reg [1:0]reg_wa;
	reg [1:0]madd;
	reg[3:0]alu_s;
	reg pc_ld,pc_inc,reg_we,ram_xl,ram_dl,alu_m,shi_fbus,shi_flbus,shi_frbus,ir_ld,cf_en,zf_en,sm_en,in_en,out_en;
	always@(mova,movb,movc,add,sub,and1,not1,rsr,rsl,jmp,jz,z,jc,c,in1,out1,nop,halt,sm,ir)
		begin
			sm_en=~halt;
			ir_ld=~sm;
			ram_dl=(~sm)|movc|jmp|(jz&z)|(jc&c);
			ram_xl=movb;
			shi_fbus=mova|movb|add|sub|and1|not1|out1;
			shi_flbus=rsl;
			shi_frbus=rsr;
			alu_s=ir[7:4];
			alu_m=and1|not1|add|sub;
			cf_en=add|sub|rsr|rsl;
			zf_en=add|sub;
			pc_inc=(~sm)|(jc&(~c))|(jz&(~z));
			pc_ld=jmp|(jz&z)|(jc&c);
			reg_we=~(sm&(mova|movc|add|sub|and1|not1|rsr|rsl|in1));
			in_en=in1;
			out_en=out1;
			reg_ra=ir[1:0];
			reg_wa=ir[3:2];
			if(sm==1&&movc==1) madd=01;
			else if(sm==1&&movb==1) madd=2'b10;
			else madd=00;
		end
endmodule