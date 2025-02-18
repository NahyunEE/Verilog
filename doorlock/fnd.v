module fnd(
	number,
	fnd_on
);
input [3:0] number;
output reg [6:0] fnd_on;

always@(number) begin

case(number) 	4'h0: fnd_on = 7'b000_0001; //0
	 	4'h1: fnd_on = 7'b100_1111;  //1
	 	4'h2: fnd_on = 7'b001_0010; //2
		4'h3: fnd_on = 7'b000_0110; //3
		4'h4: fnd_on = 7'b100_1100; //4
		4'h5: fnd_on = 7'b010_0100; //5
		4'h6: fnd_on = 7'b010_0000; //6
	  	4'h7: fnd_on = 7'b000_1111; //7
		4'h8: fnd_on = 7'b000_0000; //8
		4'h9: fnd_on = 7'b000_0100;//9
                4'hA: fnd_on = 7'b111_1111; //Reset 
                4'hB: fnd_on = 100_1000; //X
		default  fnd_on = 7'b111_1111; //Unknwon
endcase
end

endmodule
