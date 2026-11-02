`timescale 1ns/1ps

module datapath(
	input clk,
	input reset,
	input [31:0] pc,
	input PCSrc,
);

wire [31:0] PCNext;
wire [31:0] PCPlus4;
wire [31:0] PCTarget;
wire [31:0] ImmExt;

//next program counter logic
mux2x1 pcmux(
	.in0(PCPlus4), 
	.in1(PCTarget), 
	.s(PCSrc), 
	.out(PCNext));

d_flip_flop #(.WIDTH(32)) pcreg(
	.clk(clk), 
	.reset(reset), 
	.d(PCNext), 
	.q(pc));

adder pcadd4(
	.a(pc), 
	.b(32'd4), 
	.result(PCPlus4));

adder pcaddbranch(
	.a(pc), 
	.b(ImmExt), 
	.result(PCTarget));


//2

endmodule
