module pc(clk,pc_inc,pc_ld,a,add);
input clk,pc_inc,pc_ld;
input [7:0] a;
output reg[7:0] add;
always @(negedge clk) begin
    if(pc_inc==1&&pc_ld==0)add<=add+1'b1;
    else if(pc_inc==0&&pc_ld==1)add<=a;
    else add<=add;
end
endmodule
