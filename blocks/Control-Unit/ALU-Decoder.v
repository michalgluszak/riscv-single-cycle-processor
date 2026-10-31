`timescale 1ns / 1ps

module ALU_Decoder(
	input [2:0] funct3,
	input funct7_b5,
	input op_b5,
	input [1:0] ALUOp,
	output reg [2:0] ALUControl
);

wire [6:0] controls;
assign controls = {ALUOp, funct3, op_b5, funct7_b5};

always @(*) begin 
	casez(controls)
		7'b00_???_?? : ALUControl = 3'b000; //add (lw, sw)
		7'b01_???_?? : ALUControl = 3'b001; //substract (beq)
		7'b10_000_00 : ALUControl = 3'b000; //add (addi)
		7'b10_000_01 : ALUControl = 3'b000; //add (addi)
		7'b10_000_10 : ALUControl = 3'b000; //add (add)
		7'b10_000_11 : ALUControl = 3'b001; //substract (sub)
		7'b10_010_?? : ALUControl = 3'b101; //set less than (slt)
		7'b10_110_?? : ALUControl = 3'b011; //or (or)
		7'b10_111_?? : ALUControl = 3'b010; //and (and)
		default : ALUControl = 3'b???;
	endcase
end

endmodule
