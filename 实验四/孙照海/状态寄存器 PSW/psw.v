module psw (
    input clk,cf_en,zf_en,cf,zf,
    output reg c,z);

initial
begin
    c=1'b0;
    z=1'b0;
end

always @(negedge clk)
begin
    if(cf_en) c<=cf;
    else c<=c;
    if(zf_en) z<=zf;
    else z<=z;
end
endmodule
