`timescale 1ns/1ps

module alu(
	input [31:0] SrcA, SrcB,
	input [2:0] ALUControl,
	output Zero,
	output reg [31:0] ALUResult
);

always @(*) begin 
	case(ALUControl)
		3'b000 : ALUResult = SrcA + SrcB; //Add
		3'b001 : ALUResult = SrcA - SrcB; //Substract
		3'b010 : ALUResult = SrcA & SrcB; //AND
		3'b011 : ALUResult = SrcA | SrcB; //OR
	default : ALUResult = 32'bx;
	endcase
end

assign Zero = (ALUControl != 3'b001) ? 1'b0 : (ALUResult == 32'b0) ? 1'b1 : 1'b0;

endmodule
