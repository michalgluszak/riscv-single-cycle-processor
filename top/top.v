`timescale 1ns/1ps

module top(
	input clk,
	input reset
);

wire [31:0] Instr, PC, ReadData, ALUResult, WriteData;
wire MemWrite;

riscvsingle riscvsingle_ins(
	.clk(clk), 
	.reset(reset), 
	.Instr(Instr), 
	.ReadData(ReadData), 
	.ALUResult(ALUResult),
	.MemWrite(MemWrite), 
	.WriteData(WriteData), 
	.PC(PC));

instruction_memory instruction_memory_ins(
	.a(PC), 
	.rd(Instr));

data_memory data_memory_ins(
	.clk(clk), 
	.we(MemWrite), 
	.a(ALUResult), 
	.wd(WriteData), 
	.rd(ReadData));

endmodule
