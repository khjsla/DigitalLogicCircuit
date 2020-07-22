module Load_P(Clk,reset,L_P,P_in,result);
input Clk,reset,L_P;
input [7:0] P_in;
output reg [7:0] result;

always @(posedge Clk, negedge reset) begin
	if(!reset)
	result = 8'b0;
	if(!L_P)
	result = 8'b0;
	else
	result = P_in;
end

endmodule