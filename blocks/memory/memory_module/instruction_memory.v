`timescale 1ns/1ps

module instruction_memory(
	input [31:0] a,
	output [31:0] rd
);

reg [31:0] RAM [0:63];

initial begin 
	$readmemh("programs/riscvtest.mem", RAM);
end

assign rd = RAM[a[31:2]];

endmodule
