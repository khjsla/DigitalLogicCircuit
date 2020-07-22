module mult_frame(Clk,reset,start,a_enable,a_data,a_L,Psel,p_L,b_enable,b_L,b_data,b_lsb,Q,b_zero,P);

input [0:7] a_data;
input [0:3] b_data;
input Clk,reset,start,a_enable,b_enable,Psel,a_L,b_L,p_L;
output [0:3] Q;
output [0:7] P;
output b_lsb,b_zero;

wire [7:0] P_in, sum, a_sum, b_sum, p_zero;
assign P=b_sum;
assign p_zero = 8'b0;
assign P_in = (Psel ? sum : p_zero);

L_shift_a a(Clk,reset,a_enable,a_L,a_data,A_result(a_sum));
R_shift_b b(Clk,reset,b_enable,b_data,b_L,b_lsb,B_result(Q),b_zero);
Load_P p(Clk,reset,L_P(p_L),P_in,result(b_sum));
Adder c(A_result(a_sum), b_sum, sum);

endmodule