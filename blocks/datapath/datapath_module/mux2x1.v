`timescale 1ns/1ps

module mux2x1(
	input [31:0] in0, in1,
	input s,
	output [31:0] out
);

	assign out = (s==1'b0) ? in0 : in1;

endmodule
