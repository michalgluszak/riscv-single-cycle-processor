`timescale 1ns/1ps

module adder_tb;
reg [31:0] a, b;
wire [31:0] result;

adder uut(
	.a(a), 
	.b(b), 
	.result(result));

initial begin 
$monitor("a = %0d b = %0d result = %0d", a, b, result);
a = 32'd24; b = 32'd26;
#10;
a = 32'd14; b = 32'd14;
#10;
$finish();
end

endmodule
