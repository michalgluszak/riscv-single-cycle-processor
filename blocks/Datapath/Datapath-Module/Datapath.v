`timescale 1ns/1ps

module datapath(
	input clk,
	input reset,
	input [31:0] pc,
	input PCSrc,
	
	input instr[31:0],
	input ImmSrc [1:0],
	input RegWrite,
	input [31:0] WriteData
);

wire [31:0] PCNext;
wire [31:0] PCPlus4;
wire [31:0] PCTarget;
wire [31:0] ImmExt;
wire [31:0] result;
wire [31:0] SrcA, SrcB;

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


//register file logic
registerfile regfile(
	.clk(clk), 
	.we3(RegWrite), 
	.a1(instr[19:15]), 
	.a2(instr[24:20]), 
	.a3(instr[11:7]), 
	.wd3(result), 
	.rd1(SrcA), 
	.rd2(SrcB));

extend extendins(
	.ImmSrc(ImmSrc), 
	.Instr(Instr[31:7]), 
	.ImmExt(ImmExt));

assign WriteData = SrcB;

//3

endmodule
