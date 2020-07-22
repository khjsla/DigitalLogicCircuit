
module seg7_tb;
reg [3:0]bcd;
wire [6:0]leds;
wire a,b,c,d,e,f,g;

integer x;

//seg7 uut(.bcd(bcd),.leds(leds),a,b,c,d,e,f,g);
initial begin
bcd=0;
#100;

for(x=0;x<=20;x=x+1)
#50 bcd=bcd+1;
$stop;
// ½Ã¹Ä
end

endmodule