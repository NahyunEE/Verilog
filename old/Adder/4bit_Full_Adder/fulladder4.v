module fulladder4( sum, c_out, c_in, a,b);

input [3:0] a;
input [3:0] b;
output c_out;
input c_in;
output [3:0] sum;

wire c1,c2,c3;

full_adder fa0(sum[0], c1, a[0], b[0], c_in);
full_adder fa1(sum[1], c2, a[1], b[1], c1);
full_adder fa2(sum[2], c3, a[2], b[2], c2);
full_adder fa3(sum[3], c_out, a[3], b[3], c3);

endmodule


