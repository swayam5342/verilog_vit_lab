module fulladder(sum,carry,a,b,c);
input a,b,c;
output sum,carry;
assign sum= a^b^c;
assign carry = ((a^b)&c)| (a&b);
endmodule 


