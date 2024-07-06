`timescale 1ns/100ps

module tb_mux_2x1();
reg i1, i0, sel;
wire z;
mux_2x1 m(.i1(i1),
.i0(i0),
.sel(sel),
.z(z)
);
initial
begin
i1=0; i0=0; sel=0;
end
always
begin
#5 i0=1;
#5 i0=0;
end
always
begin
#200 sel=1;
#200 sel=0;
end
endmodule