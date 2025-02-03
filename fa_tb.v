module fa_tb();
reg x,y,z;
wire sum,carry;
fa1 fa2(.a(x),.b(y),.c(z),.s(sum),.cout(carry));
initial
begin
#20 x=0;y=0;z=0;
#20 x=0;y=0;z=1;
#20 x=0;y=1;z=0;
#20 x=0;y=1;z=1;
#20 x=1;y=0;z=0;
#20 x=1;y=0;z=1;
#20 x=1;y=1;z=0;
#20 x=1;y=1;z=1;
#20 $stop;
end
endmodule
