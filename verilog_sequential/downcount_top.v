module downcount_top;
parameter n = 8;
reg Clock, Resetn;
reg [n-1:0] R;
reg E,L;
wire [n-1:0] Q;

downcount test2(R, Resetn, Clock, E, L, Q);

initial begin 
Clock=0;
forever #5 Clock=!Clock; //Clock�� ��� ���ư���
end

initial begin
Resetn=0;E=0;L=1;R=8'b00000001;
//L�� �Ѽ� R�� ������ �ȴ�
#10 R=8'b00000001;
#10 R=8'b00000010;
#10 R=8'b00000011;
#10 R=8'b00000100; //�׷��� Resetn =0 �̱� ������ ��·�� Q���� 0�̴�
#10 Resetn=1;R=8'b0; //������ R���� Q���� ���� �ȴ�. 
#10 R=8'b00000001;
#10 R=8'b00000010;
#10 R=8'b00000011;
#10 R=8'b00000100;
#10 R=8'b00001000;
#10 E=1; L=0; //down counter ����
end
endmodule 
