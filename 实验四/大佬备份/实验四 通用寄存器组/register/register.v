module register(
    input clk,we,
    input [1:0] raa,rwba,
    input [7:0] i,
    output reg[7:0] s,d
);
reg[7:0] A,B,C; 
parameter a=2'b00,b=2'b01,c=2'b10;   
always @(raa or rwba or A or B or C) begin
    case (raa)
    a:begin s=A;end
    b:begin s=B;end
    c:begin s=C;end
    default:begin s=C;end
    endcase
    case (rwba)
    a:begin d=A;end
    b:begin d=B;end
    c:begin d=C;end
    default:begin d=C;end
    endcase
end
always @(negedge clk) begin
    if(we==1'b0)begin
        case (rwba)
        a:begin A<=i;end
        b:begin B<=i;end
        c:begin C<=i;end
        endcase
    end
    else begin A<=A;end//it is useless
end
endmodule