`timescale 1ns/1ps

module extend_tb;
reg [1:0] ImmSrc;
reg [31:0] Instr;
wire [31:0] ImmExt;

extend uut(
	.ImmSrc(ImmSrc), 
	.Instr(Instr[31:7]), 
	.ImmExt(ImmExt));

initial begin 
$monitor("ImmSrc = %b Instr = %0h ImmExt = %0h",ImmSrc, Instr, ImmExt);
ImmSrc = 2'b00; Instr = 32'hFFC4_A303;
#10;
ImmSrc = 2'b01; Instr = 32'h0064_A423;
#10;
ImmSrc = 2'b10; Instr = 32'hFE42_0AE3;
#10;
$finish();
end

endmodule
