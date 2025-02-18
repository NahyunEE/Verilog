module half_adder( a,b,c,s);

input a,b;
output reg c,s;

//ERROR DETECTED
//s,c already in this scope

// Cannot use gate naming while c,s is specified.
//xor s (a,b);
//and c (a,b);

assign s = a^b;
assign c = a&b;


endmodule;

