`timescale 1ns/1ps

module alu(
	input [31:0] SrcA, SrcB,
	input [2:0] ALUControl,
	output reg [31:0] ALUResult
);

always @(*) begin 
	case(ALUControl)
		3'b000 : ALUResult = SrcA + SrcB; //Add
		3'b001 : ALUResult = SrcA - SrcB; //Substract
		3'b010 : ALUResult = SrcA & SrcB; //AND
		3'b011 : ALUResult = SrcA | SrcB; //OR
		3'b101 : 
			begin
				if(SrcA > SrcB) begin 
					ALUResult = SrcA;
				end else if (SrcB > SrcA) begin 
					ALUResult = SrcB;
				end else begin 
					ALUResult = 32'b0;
				end
			end
		default : ALUResult = 32'bx;
	endcase
end

endmodule
