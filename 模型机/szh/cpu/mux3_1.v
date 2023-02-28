module mux3_1(a,b,c,madd,y);
	input[7:0]a;
	input[7:0]b;
	input[7:0]c;
	input[1:0]madd;
	output[7:0]y;
	reg[7:0]y;
	always@(*)
	begin
		y<=8'b0000_0000;
	case(madd)
			2'b00 : y<=a;
			2'b01 : y<=b;
			2'b10 : y<=c;
			default : ;
		endcase
		
	end
endmodule
			