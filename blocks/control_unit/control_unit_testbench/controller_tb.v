`timescale 1ns/1ps

module controller_tb;
reg Zero;
reg [6:0] op;
reg [2:0] funct3;
reg funct7_b5;
wire PCSrc; 
wire ResultSrc;
wire MemWrite;
wire ALUSrc;
wire [1:0] ImmSrc;
wire RegWrite;
wire [2:0] ALUControl;

controller uut(
	.Zero(Zero), 
	.op(op), 
	.funct3(funct3), 
	.funct7_b5(funct7_b5), 
	.PCSrc(PCSrc), 
	.ResultSrc(ResultSrc), 
	.MemWrite(MemWrite), 
	.ALUSrc(ALUSrc), 
	.ImmSrc(ImmSrc), 
	.RegWrite(RegWrite), 
	.ALUControl(ALUControl));

initial begin 
$monitor("op = %b RegWrite = %b ImmSrc = %b ALUSrc = %b MemWrite = %b ResultSrc = %b Branch = %b ALUOp = %b funct3 = %b op[5] = %b funct7_b5 = %b ALUControl = %b Zero = %b", 
op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, uut.Branch, uut.ALUOp, funct3, op[5], funct7_b5, ALUControl, Zero);
op = 7'b0000011; funct3 = 3'bxxx; funct7_b5 = 1'bx; Zero = 1'b0; //lw
#10;
op = 7'b0100011; funct3 = 3'bxxx; funct7_b5 = 1'bx; Zero = 1'b0; //sw
#10;
op = 7'b0110011; funct3 = 3'b000; funct7_b5 = 1'b1; Zero = 1'b0; //add
#10;
op = 7'b0010011; funct3 = 3'b000; funct7_b5 = 1'b1; Zero = 1'b0; //add
#10;
$finish();
end

endmodule
