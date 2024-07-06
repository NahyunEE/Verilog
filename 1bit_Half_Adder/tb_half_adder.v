`timescale 1ns/100ps

module tb_half_adder();

reg a,b;
wire c,s;

half_adder ha( .a(a), .b(b), .c(c), .s(s));

integer i,j;

initial begin
	   a = 16'h0; 
	   b = 16'h0;
	  
	for (i=0;i<16;i=i+1) begin
		for (j=0;j<16;j=j+1) begin
			
				#5 a = i;
				   b = j;
				   
			
		end
	end

	#5 $stop;
end



initial begin
$monitor("a: %d b: %d  c: %d d: %d", a,b,c,s);
end




endmodule