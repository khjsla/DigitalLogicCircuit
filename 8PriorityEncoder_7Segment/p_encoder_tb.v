module p_encoder_tb;
reg [7:0]a;
wire [2:0]z;
wire nr;

p_encoder uut(a,z,nr);

initial begin

a[0]=0;a[1]=0;a[2]=0;a[3]=0;a[4]=0;a[5]=0;a[6]=0;a[7]=0;

#75 a[7]=1; a[5]=1; a[3]=1;
#75 a[7]=0; a[6]=1; 
#75 a[6]=0; a[5]=1; a[3]=1;
#75 a[5]=0; a[4]=1; 
#75 a[4]=0; a[3]=1; 
#75 a[3]=0; a[2]=1;
#75 a[2]=0; a[1]=1;
#75 a[1]=0; a[0]=1;
#75 a[0]=0;
end

endmodule
