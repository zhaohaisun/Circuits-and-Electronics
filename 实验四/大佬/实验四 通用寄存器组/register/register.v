module reg_group(
    input clk,we,
    input [1:0] raa,rwba,
    input [7:0] i,
    output reg[7:0] s,d);
reg[7:0] A,B,C;

always @(raa or rwba or A or B or C) //组合逻辑电路使用阻塞赋值
begin
    case (raa)
    2'b00: s=A;
    2'b01: s=B;
    2'b10: s=C;
    default: s=C;
    endcase

    case (rwba)
    2'b00: d=A;
    2'b01: d=B;
    2'b10: d=C;
    default: d=C;
    endcase
end

always @(negedge clk) /时序电路使用非阻塞赋值
begin
    if(we==1'b0)
    begin
        case (rwba)
        2'b00: A<=i;
        2'b01: B<=i;
        2'b10: C<=i;
        endcase
    end
    else A<=A;
end
endmodule