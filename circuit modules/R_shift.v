module R_shift_b(Clk, reset, b_enable, b_data, b_L, b_lsb,B_result,b_zero);
input Clk,reset,b_enable,b_L;
input [3:0] b_data;
output reg [3:0] B_result;
output reg b_lsb, b_zero;

always @(posedge Clk or negedge reset) begin
	if(!reset)
	    B_result=4'b0;
        else if(!b_enable & !b_L)
	    B_result=4'b0;
	else if(b_enable & !b_L)
	    B_result=b_data;
	else begin
	    B_result = b_data;
	    B_result[0] <= B_result[1];
   	    B_result[1] <= B_result[2];
 	    B_result[2] <= B_result[3];
	    B_result[3] <= 0;
	    b_lsb = B_result[3];

	if(b_data == 4'b0000)
	    b_zero =1;
	end
end
endmodule