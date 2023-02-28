module pc (
    input clk,pc_ld,pc_inc,
    input [7:0] a,
    output reg[7:0] add);

always @(negedge clk)
begin
    if(pc_inc==1'b1&&pc_ld==1'b0) add<=add+1'b1;
    else if(pc_inc==1'b0&&pc_ld==1'b1) add<=a;
    else add<=add;
end
endmodule
