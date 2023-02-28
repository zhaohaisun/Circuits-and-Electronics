module pc (
    input clk,pc_inc,pc_ld,
    input [7:0] a,
    output reg[7:0] add
);
always @(negedge clk) begin
    if(pc_inc==1'b1&&pc_ld==1'b0)begin
        add<=add+1'b1;
    end
    else if(pc_inc==1'b0&&pc_ld==1'b1) begin
        add<=a;
    end
    else begin add<=add;end
end    
endmodule
