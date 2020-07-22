module updowncount (R, Resetn, Clock, E, L, up_down, Q);
parameter n = 8;
input [n-1:0] R;
input Resetn, Clock, L, E, up_down;
output reg [n-1:0] Q;

always @(negedge Resetn or posedge Clock) //up down clk 천이 마다 입력된다

if (!Resetn) 
Q <= 0;
else if(L)
Q <= R;
else if(E)
Q <= Q + (up_down ? 1 : -1);

endmodule
