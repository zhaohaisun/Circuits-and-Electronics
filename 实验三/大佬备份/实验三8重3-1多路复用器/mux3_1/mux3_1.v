module mux3_1(a,b,c,madd,y);
  input [7:0] a,b,c;
  input [1:0] madd;
  output reg[7:0] y;
  
  always @(*) begin
       if(madd==2'b00) y=a;
       else if(madd==2'b01) y=b;
       else if(madd==2'b10) y=c;
       else y=8'hZZ;
       end
endmodule       