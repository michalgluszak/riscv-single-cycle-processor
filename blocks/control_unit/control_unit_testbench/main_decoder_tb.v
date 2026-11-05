`timescale 1ns/1ps

module main_decoder_tb();
reg [6:0] op;
wire Branch;
wire ResultSrc;
wire MemWrite;
wire ALUSrc;
wire [1:0] ImmSrc;
wire RegWrite;
wire [1:0] ALUOp;

main_decoder uut(
	.op(op), 
	.Branch(Branch), 
	.ResultSrc(ResultSrc), 
	.MemWrite(MemWrite), 
	.ALUSrc(ALUSrc), 
	.ImmSrc(ImmSrc), 
	.RegWrite(RegWrite), 
	.ALUOp(ALUOp));

initial begin 
$monitor("op = %b RegWrite = %b ImmSrc = %b ALUSrc = %b MemWrite = %b ResultSrc = %b Branch = %b ALUOp = %b", op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);
op = 7'b0000011;
#10;
op = 7'b0100011;
#10;
op = 7'b0110011;
#10;
op = 7'b1100011;
#10;
op = 7'b0010011;
#10;
op = 7'b0000000;
#10;
$finish();
end

endmodule
