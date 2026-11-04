`timescale 1ns/1ps

module datapath(
	input clk, 
	input reset, 
	input PCSrc,
	input ResultSrc,
	input [2:0] ALUControl,
	input ALUSrc,
	input [1:0] ImmSrc,
	input RegWrite,
	input [31:0] Instr,
	input [31:0] ReadData,	
	output Zero,
	output [31:0] ALUResult,
	output [31:0] WriteData,
	output [31:0] PC
);

wire [31:0] PCPlus4, PCTarget, PCNext;
wire [31:0] ImmExt;
wire [31:0] SrcA, SrcB;
wire [31:0] Result;

//next program counter logic
mux2x1 pcmux(
	.in0(PCPlus4), 
	.in1(PCTarget), 
	.s(PCSrc), 
	.out(PCNext));

d_flipflop #(.WIDTH(32)) pcreg(
	.clk(clk), 
	.reset(reset), 
	.d(PCNext), 
	.q(PC));

adder pcadd4(
	.a(PC), 
	.b(32'd4), .
	result(PCPlus4));

adder pcaddbranch(
	.a(PC), 
	.b(ImmExt), 
	.result(PCTarget));

//register file logic
register_file regfile(
	.clk(clk), 
	.we3(RegWrite), 
	.a1(Instr[19:15]), 
	.a2(Instr[24:20]), 
	.a3(Instr[11:7]), 
	.wd3(Result), 
	.rd1(SrcA), 
	.rd2(WriteData));

extend extend(
	.ImmSrc(ImmSrc), 
	.Instr(Instr[31:7]), 
	.ImmExt(ImmExt));

//ALU logic 
mux2x1 srcbmux(
	.in0(WriteData), 
	.in1(ImmExt), 
	.s(ALUSrc), 
	.out(SrcB));

alu alu(
	.SrcA(SrcA), 
	.SrcB(SrcB), 
	.ALUControl(ALUControl), 
	.Zero(Zero), 
	.ALUResult(ALUResult));

mux2x1 resultmux(
	.in0(ALUResult), 
	.in1(ReadData), 
	.s(ResultSrc), 
	.out(Result));

endmodule
