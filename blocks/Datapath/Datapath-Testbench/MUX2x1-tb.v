`timescale 1ns/1ps

module mux2x1_tb;
reg [31:0] in0, in1;
reg s;
wire [31:0] out;

mux2x1 mux2x1_ins(
	.in0(in0), 
	.in1(in1), 
	.s(s), 
	.out(out));

initial begin 
$monitor("in0 = %0d in1 = %0d s = %b out = %0d", in0, in1, s, out);
in0 = 32'd24; in1 = 32'd26; s = 1'b0; //out = in0
#10;
in0 = 32'd24; in1 = 32'd26; s = 1'b1; //out = in1
#10;
$finish();
end

endmodule
