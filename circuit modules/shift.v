module L_shift_a(Clk,reset,a_enable,a_L,a_data,A_result);
input Clk,reset,a_enable,a_L;
input [3:0] a_data;
output reg[7:0] A_result;

always @(posedge Clk or negedge reset) begin
        if(!reset)
	A_result=8'b0;
        else if(!a_enable & !a_L)
	A_result=8'b0;
	else if(a_enable & !a_L)
	A_result = a_data;
        else begin
	A_result = a_data;
	A_result[0] <= A_result[1];
	A_result[1] <= A_result[2];
	A_result[2] <= A_result[3];
	A_result[3] <= A_result[4];
	A_result[4] <= A_result[5];
	A_result[5] <= A_result[6];
	A_result[6] <= A_result[7];
	A_result[7] <= 0;
end

end

endmodule