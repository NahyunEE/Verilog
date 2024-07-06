module fulladder16( sum, c_out, a, b, c_in);
output [15:0] sum;
output c_out;
input [15:0] a;
input [15:0] b;
input c_in;
wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
fulladder fa0(sum[0], c1, a[0], b[0], c_in);
fulladder fa1(sum[1], c2, a[1], b[1], c1);
fulladder fa2(sum[2], c3, a[2], b[2], c2);
fulladder fa3(sum[3], c4, a[3], b[3], c3);
fulladder fa4(sum[4], c5, a[4], b[4], c4);
fulladder fa5(sum[5], c6, a[5], b[5], c5);
fulladder fa6(sum[6], c7, a[6], b[6], c6);
fulladder fa7(sum[7], c8, a[7], b[7], c7);
fulladder fa8(sum[8], c9, a[8], b[8], c8);
fulladder fa9(sum[9], c10, a[9], b[9], c9);
fulladder fa10(sum[10], c11, a[10], b[10], c10);
fulladder fa11(sum[11], c12, a[11], b[11], c11);
fulladder fa12(sum[12], c13, a[12], b[12], c12);
fulladder fa13(sum[13], c14, a[13], b[13], c13);
fulladder fa14(sum[14], c15, a[14], b[14], c14);
fulladder fa15(sum[15], c_out, a[15], b[15], c15);
endmodule
