`timescale 1ns/1ps

module alu_tb;
reg [31:0] SrcA, SrcB;
reg [2:0] ALUControl;
wire [31:0] ALUResult;

alu alu_ins(
	.SrcA(SrcA), 
	.SrcB(SrcB), 
	.ALUControl(ALUControl), 
	.ALUResult(ALUResult));

initial begin 
$monitor("ALUControl = %b SrcA = %0d SrcB = %0d ALUResult = %0d",ALUControl, SrcA, SrcB, ALUResult);
ALUControl = 3'b000; SrcA = 32'd26; SrcB = 32'd24; //Add
#10;
ALUControl = 3'b001; SrcA = 32'd26; SrcB = 32'd24; //Substract
#10;
ALUControl = 3'b010; SrcA = 32'd26; SrcB = 32'd24; //AND
#10; 
ALUControl = 3'b011; SrcA = 32'd26; SrcB = 32'd24; //OR
#10;
ALUControl = 3'b101; SrcA = 32'd14; SrcB = 32'd8; //SLT SrcA > SrcB
#10;
ALUControl = 3'b101; SrcA = 32'd7; SrcB = 32'd15; //SLT SrcA < SrcB
#10;
ALUControl = 3'b101; SrcA = 32'd26; SrcB = 32'd26; //SLT SrcA == SrcB 
#10;
$finish();
end

endmodule
