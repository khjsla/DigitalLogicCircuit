module p_encoder(A,Z,NR);
input [7:0] A;
output reg [2:0] Z;
output reg NR;

always @(A)
begin
if(A==8'b00000001) Z=3'b000;
else if(A==8'b0000001x) Z=3'b001;
else if(A==8'b000001xx) Z=3'b010;
else if(A==8'b00001xxx) Z=3'b011;
else if(A==8'b0001xxxx) Z=3'b100;
else if(A==8'b001xxxxx) Z=3'b101;
else if(A==8'b01xxxxxx) Z=3'b110;
else if(A==8'b1xxxxxxx) Z=3'b111;
else 

begin
Z=3'bxxx; 
NR=1;
end

end


endmodule
