module updowncount_top;
parameter n = 8;
reg Clock, Resetn, up_down;
reg [n-1:0] R;
reg E,L;
wire [n-1:0] Q;

updowncount test3(R, Resetn, Clock, E, L, up_down, Q);
initial begin 
Clock=0;
forever #5 Clock=!Clock; //clk은 계속 돌아가게 한다
end

initial begin
Resetn=0;E=0;L=1;R=4'b0001;
//L을 켜서 R을 넣으려고 하지만 Resetn 이 0이라 그럴 수 없다
#10 R=4'b0001;
#10 R=4'b0010;
#10 R=4'b0011;
#10 R=4'b0100;
#10 Resetn=1;R=4'b0000; //이젠 Resetn=1이라 R값이 Q에 들어갈 수 있게 된다.
#10 R=4'b0001;
#10 R=4'b0010;
#10 R=4'b0011;
#10 R=4'b0100;
#10 E=1; L=0; up_down =1; //up counter 시작
#200;
#10 up_down =0; //down counter 시작

end

endmodule 
