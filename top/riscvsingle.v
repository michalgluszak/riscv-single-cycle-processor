`timescale 1ns/1ps

module riscvsingle(
	input clk,
	input reset,
	input [31:0] Instr,
	input [31:0] ReadData,
	output [31:0] ALUResult,	
	output [31:0] WriteData,
	output [31:0] PC,
	
);

wire Zero, PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite;
wire [1:0] ImmSrc;
wire [2:0] ALUControl;

controller controller_ins(
	.Zero(Zero), 
	.op(Instr[6:0]), 
	.funct3(Instr[14:12]), 
	.funct7_b5(Instr[30]), 
	.PCSrc(PCSrc), 
	.ResultSrc(ResultSrc), 
	.MemWrite(MemWrite),
	.ALUSrc(ALUSrc), 
	.ImmSrc(ImmSrc), 
	.RegWrite(RegWrite),
	.ALUControl(ALUControl));

datapath datapath_ins(
	.clk(clk), 
	.reset(reset), 
	.PCSrc(PCSrc), 
	.ResultSrc(ResultSrc), 
	.ALUControl(ALUControl), 
	.ALUSrc(ALUSrc), 
	.ImmSrc(ImmSrc), 
	.RegWrite(RegWrite),
	.Instr(Instr), 
	.ReadData(ReadData),
	.Zero(Zero)
	.ALUResult(ALUResult),
	.WriteData(WriteData),
	.PC(PC));

endmodule
