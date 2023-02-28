module sm(
    input clk,sm_en,
    output reg sm);

initial sm=1'b0;

always @(negedge clk) //�½���
begin
    if(sm_en) sm<=~sm; //ʹ���ź�Ϊ1 ȡ��
    else sm<=sm; //ʹ���ź�Ϊ0 ����
end
endmodule
