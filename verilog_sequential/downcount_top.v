module downcount_top;
parameter n = 8;
reg Clock, Resetn;
reg [n-1:0] R;
reg E,L;
wire [n-1:0] Q;

downcount test2(R, Resetn, Clock, E, L, Q);

initial begin 
Clock=0;
forever #5 Clock=!Clock; //Clock은 계속 돌아간다
end

initial begin
Resetn=0;E=0;L=1;R=8'b00000001;
//L을 켜서 R이 들어오게 된다
#10 R=8'b00000001;
#10 R=8'b00000010;
#10 R=8'b00000011;
#10 R=8'b00000100; //그러나 Resetn =0 이기 때문에 어쨌든 Q값은 0이다
#10 Resetn=1;R=8'b0; //이제는 R값이 Q값에 들어가게 된다. 
#10 R=8'b00000001;
#10 R=8'b00000010;
#10 R=8'b00000011;
#10 R=8'b00000100;
#10 R=8'b00001000;
#10 E=1; L=0; //down counter 시작
end
endmodule 
