module upcount_top;
reg Clock, Resetn;
reg [3:0] R;
reg E,L;
wire [3:0] Q;

upcount test1(R, Resetn, Clock, E, L ,Q);

initial begin 
Clock=0;
forever #5 Clock=!Clock;
end

initial begin
Resetn=0;E=0;L=1;R=4'b0001;
//L�� �Ѽ� R�� ������ �Ϸ������� 
#10 L=1;R=4'b0001;
#10 L=1;R=4'b0010;
#10 L=1;R=4'b0011;
#10 L=1;R=4'b0100;
#10 Resetn=1;R=4'b0000; //������ �����ϴ�
#10 R=4'b0001;
#10 R=4'b0010;
#10 R=4'b0011;
#10 R=4'b0100;
#10 E=1; L=0; //upcounter ����
end

endmodule 