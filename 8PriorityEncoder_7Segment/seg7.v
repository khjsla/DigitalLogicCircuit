module seg7(bcd,leds);
input[3:0] bcd;
output reg[6:0] leds;
reg a,b,c,d,e,f,g;

always @(bcd)
begin

leds={a,b,c,d,e,f,g};

case(bcd)
0:{a,b,c,d,e,f,g}<=7'b111_1110;
1:{a,b,c,d,e,f,g}<=7'b011_0000;
2:{a,b,c,d,e,f,g}<=7'b110_1101;
3:{a,b,c,d,e,f,g}<=7'b111_1001;
4:{a,b,c,d,e,f,g}<=7'b011_0011;
5:{a,b,c,d,e,f,g}<=7'b101_1011;
6:{a,b,c,d,e,f,g}<=7'b101_1111;
7:{a,b,c,d,e,f,g}<=7'b111_0010;
8:{a,b,c,d,e,f,g}<=7'b111_1111;
9:{a,b,c,d,e,f,g}<=7'b111_1011;
default:{a,b,c,d,e,f,g}<=7'b000_0000;
endcase

end

endmodule