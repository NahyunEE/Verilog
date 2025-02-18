module block2( 
    input [3:0] a,  // 4-bit input a
    input [3:0] b,  // 4-bit input b
    output [3:0] y  // 4-bit output y
);

    // Perform bitwise NOR operation for each corresponding bit in a and b
    assign y[0] = ~(a[0] | b[0]);
    assign y[1] = ~(a[1] | b[1]);
    assign y[2] = ~(a[2] | b[2]);
    assign y[3] = ~(a[3] | b[3]);

endmodule
