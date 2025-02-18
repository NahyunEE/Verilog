`timescale 1ns/100ps

module tb_mul4();
reg [3:0]mulplier;
reg [3:0]mulcand;
wire [7:0] a;
reg start;
reg clk;
wire [1:0] counter;
reg st;

mul4 mul( .mulplier(mulplier), .mulcand(mulcand), .a(a), .start(start), .clk(clk), .counter(counter), .st(st));

initial begin
clk=0;

 //state=1'b0;
      start = 1'b1; st=1'b0;
      mulcand=5'b01011;
      mulplier=5'b01101;
$monitor ("Firset Cycle result: %b, counter %d", a, counter);

 //state=1'b1;

  #2 start =1'b0;  st=1'b1;
    mulcand = 5'b11010;
    mulplier=5'b01010;

$monitor ("Second Cycle result: %b, counter %d", a, counter);

//$monitor ("state : %b", state);

//state=1'b1;
   
  #2  start =1'b1; st=1'b1;
      mulcand = 5'b01010;
      mulplier=5'b01001;
$monitor (" Third Cycle result: %b, counter %d", a, counter);

//$monitor ("state : %b", state);

#10 $stop;
end
always begin
#1 clk =1;
#1 clk =0;
end

endmodule
