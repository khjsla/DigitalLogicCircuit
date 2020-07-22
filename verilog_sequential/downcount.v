module downcount (R, Resetn, Clock, E, L, Q);
parameter n = 8;
input [n-1:0] R;
input Resetn, Clock, L, E;
output reg [n-1:0] Q;

always @(negedge Resetn or posedge Clock)
if (!Resetn)
Q <= 0;
else if (L)
Q <= R;
else if (E)
Q <= Q-1;

endmodule
