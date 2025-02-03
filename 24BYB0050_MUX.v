//this is swayam, don't delete this file please;
//24BYB0050
module mux(i0,i1,i2,i3,s,y,y1);
input i0,i1,i2,i3;
output y,y1;
input [1:0]s;

wire t,u,v,w,x,z;

not (u,s[0]);
not (v,s[1]);

and (w,i0,u,v);
and (t,i1,s[0],v);
and (x,i2,s[1],u);
and (z,i3,s[1],s[0]);
or (y,t,w,z,x);


assign y1 = (i0&~s[0]&~s[1]) | (i1&s[0]&~s[1]) | (i2&~s[0]&s[1]) | (i3&s[0]&s[1]);

endmodule
