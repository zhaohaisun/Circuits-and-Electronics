module simple(m, s, a, b, t, cf, zf);
	input m;
	input [3:0] s;
	input [7:0] a,b;
	output [7:0] t;
	output cf,zf;
	reg [7:0] t;
	reg cf, zf;
	
always @(m, s, a, b, t, cf, zf)
begin
	cf = 1'b0;
	zf = 1'b0;
	t = 8'b00000000;
	if(m==1'b0)
	begin
		if(s==4'b1010) t=b;
		else if(s==4'b1100||s==4'b0100) t=a;
	end
	else if(m==1'b1)
			case(s[3:0])
				4'b1001:
				begin
					{cf, t} =a+b;
					if(t == 0)
						zf = 1;
					else
						zf = 1;
				end
				4'b0110:
				begin
					{cf, t} = b-a;
					if(t==0) zf=1'b1;
				end
				4'b1011:				t = a & b;
				4'b0101:				t = ~b;
				
				default:
				begin
					t = 8'b00000000;
					cf = 0;
					zf = 0;
			end
		endcase
end
endmodule 