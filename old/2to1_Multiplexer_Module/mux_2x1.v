
module mux_2x1(i0,i1,sel,z);

input i0,i1,sel;
output z;

reg z;

always@(sel, i0, i1)
	case(sel)
	0: z=i0;
	1: z=i1;
	endcase
endmodule