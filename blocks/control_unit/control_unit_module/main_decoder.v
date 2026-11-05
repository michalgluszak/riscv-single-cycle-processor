`timescale 1ns/1ps

module main_decoder(
	input [6:0] op,
	output Branch,
	output ResultSrc,
	output MemWrite,
	output ALUSrc,
	output [1:0] ImmSrc,
	output RegWrite,
	output [1:0] ALUOp
);

reg [8:0] controls;
assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp} = controls;

always @(*) begin
	casez(op)
		7'b0000011 : controls = 9'b1_00_1_0_1_0_00; //lw
		7'b0100011 : controls = 9'b0_01_1_1_?_0_00; //sw
		7'b0110011 : controls = 9'b1_??_0_0_0_0_10; //R-type
		7'b1100011 : controls = 9'b0_10_0_0_?_1_01; //beq
		7'b0010011 : controls = 9'b1_00_1_0_0_0_10; //addi
		default : controls = 9'b?_??_?_?_?_?_??;
	endcase
end

endmodule
