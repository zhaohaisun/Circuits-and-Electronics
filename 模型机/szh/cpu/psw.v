module psw(input clk,cf_en,zf_en,cf,zf,
output reg c,z);
initial begin c=1'b0;z=1'b0;end
always @(negedge clk)begin
    if(cf_en)begin
        c<=cf;
    end
    else begin
        c<=c;
    end
end
always @(negedge clk) begin
    if(zf_en)begin
        z<=zf;
    end
    else begin
        z<=z;
    end
end
endmodule
