`timescale 1ns / 1ps

module Controller(
	input Zero,
	input [6:0] op,
	input [2:0] funct3,
	input funct7_b5,
	input [1:0] ALUOp,
	output PCSrc,
	output Branch,
	output ResultSrc,
	output MemWrite,
	output ALUSrc,
	output [1:0] ImmSrc,
	output RegWrite,
	output [2:0] ALUControl
);

assign PCSrc = Zero & Branch;

main_decoder main_decoder_ins(
	.op(op), 
	.Branch(Branch), 
	.ResultSrc(ResultSrc), 
	.MemWrite(MemWrite), 
	.ALUSrc(ALUSrc), 
	.ImmSrc(ImmSrc), 
	.RegWrite(RegWrite), 
	.ALUOp(ALUOp));

ALU_Decoder ALU_Decoder_ins(
	.funct3(funct3), 
	.funct7_b5(funct7_b5), 
	.op_b5(op[5]), 
	.ALUOp(ALUOp), 
	.ALUControl(ALUControl));

endmodule
