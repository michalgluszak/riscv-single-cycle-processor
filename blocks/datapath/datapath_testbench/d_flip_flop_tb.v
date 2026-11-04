`timescale 1ns/1ps

module d_filpflop_tb;
reg clk = 1'b0;
reg reset = 1'b1;
reg d;
wire q;

d_flipflop #(.WIDTH(1)) uut(
	.clk(clk), 
	.reset(reset), 
	.d(d), 
	.q(q));

initial begin 
$monitor("clk = %b reset %b d = %b q = %b", clk, reset, d, q);
clk = 1'b0; reset = 1'b0; d = 1'b0;
#10;
clk = 1'b0; reset = 1'b0; d = 1'b1;
#10;
clk = 1'b1; reset = 1'b0; d = 1'b1;
#10;
clk = 1'b0; reset = 1'b0; d = 1'b0;
#10;
clk = 1'b1; reset = 1'b0; d = 1'b0;
#10;
$finish();
end

endmodule
