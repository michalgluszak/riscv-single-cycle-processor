`timescale 1ns/1ps

module ALU_Decoder_tb();
reg [2:0] funct3;
reg funct7_b5;
reg op_b5;
reg [1:0] ALUOp;
wire [2:0] ALUControl;

ALU_Decoder uut(
	.funct3(funct3), 
	.funct7_b5(funct7_b5), 
	.op_b5(op_b5), 
	.ALUOp(ALUOp), 
	.ALUControl(ALUControl));


initial begin 
$monitor("ALUOp = %b funct3 = %b op_b5 = %b funct7_b5 = %b ALUControl = %b", ALUOp, funct3, op_b5, funct7_b5, ALUControl);
ALUOp = 2'b00; funct3 = 3'bxxx; op_b5 = 1'bx; funct7_b5 = 1'bx; //add (lw, sw)
#10;
ALUOp = 2'b01; funct3 = 3'bxxx; op_b5 = 1'bx; funct7_b5 = 1'bx; //substract (beq)
#10;
ALUOp = 2'b10; funct3 = 3'b000; op_b5 = 1'b0; funct7_b5 = 1'b0; //add (addi)
#10;
ALUOp = 2'b10; funct3 = 3'b000; op_b5 = 1'b0; funct7_b5 = 1'b1; //add (addi)
#10;
ALUOp = 2'b10; funct3 = 3'b000; op_b5 = 1'b1; funct7_b5 = 1'b0; //add (add)
#10;
ALUOp = 2'b10; funct3 = 3'b000; op_b5 = 1'b1; funct7_b5 = 1'b1; //substract (sub)
#10;
ALUOp = 2'b10; funct3 = 3'b010; op_b5 = 1'bx; funct7_b5 = 1'bx; //set less than (slt)
#10;
ALUOp = 2'b10; funct3 = 3'b110; op_b5 = 1'bx; funct7_b5 = 1'bx; //or (or)
#10;
ALUOp = 2'b10; funct3 = 3'b111; op_b5 = 1'bx; funct7_b5 = 1'bx; //and (and)
#10;
ALUOp = 2'b11; funct3 = 3'b111; op_b5 = 1'b1; funct7_b5 = 1'b1; //default
#10;
$finish();
end

endmodule
