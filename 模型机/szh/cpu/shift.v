module shift(fbus,flbus,frbus,a,w,cf);
	input fbus;
	input flbus;
	input frbus;
	input [7:0]a;
	output [7:0]w;
	output cf;
	reg [7:0]w;
	reg cf;
	always@(fbus,flbus,frbus,a)
		begin
			cf=1'b0;
			if(fbus==1'b1) w[7:0]=a[7:0];
			else if(frbus==1'b1) 
				begin 
					w[7:0]={a[0],a[7:1]};
					cf=a[0];
				end
			else if(flbus==1'b1) 
				begin
					w[7:0]={a[6:0],a[7]};
					cf=a[7];
				end
			else w[7:0]=8'hZZ;
		end
endmodule