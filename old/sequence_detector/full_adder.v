module full_adder( 
input a,
input b,
input c_in,
output c_out,
output sum);


wire s1,s2,c1;


xor( s1, a, b);
and(c1 , a,b);
xor(sum,s1,c1);
and(s2,s1,c_in);
xor(c_out, s2,c1);

endmodule