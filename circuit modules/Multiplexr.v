module mult(Clk,reset,start,a_enable,a_L,Psel,p_L,b_enable,b_L,b_lsb,b_zero);
localparam Start=0, Add=1, Shift=2, finish=3;
reg [1:0] state, nxtState;
input Clk,reset,start,b_lsb,b_zero;
output a_enable,b_enable,Psel,a_L,b_L,p_L;
wire a_enable,b_enable,Psel,a_L,b_L,p_L;

always @(posedge Clk) begin 
	if(!reset) begin 
	state <=Start;
	end 
	else begin 
	state <= nxtState; 
	end 	
end

always @(*) begin
case(state) 
	Start: begin
	   if(!start)
		nxtState = Start;
	   if(b_zero)
		nxtState = finish;
	   else
	        nxtState = Shift;
	   a_enable=1;
	   b_enable=1;
	   a_L =1;
	   b_L=1;
	   Psel=0;
	   p_L=0;
	end
	Add: begin
	     nxtState = Shift;
	     Psel=1;
	     p_L=1;
	     a_enable=0;
	     b_enable=0;
	     a_L=0;
	     b_L=0;
	end 
	Shift: begin
	   if(b_zero)
		nxtState = finish;
	   if(b_lsb)
		nxtState = Add;
	   else
		nxtState = Shift;
	   a_enable=1;
	   b_enable=1;
	   a_L=0;
	   b_L=0;
           Psel=0;
	   p_L=0;
	end 
	finish: begin
	nxtState = Start;
	end
	endcase
end
endmodule