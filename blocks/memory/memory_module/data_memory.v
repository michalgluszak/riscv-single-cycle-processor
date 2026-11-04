`timescale 1ns/1ps

module data_memory(
	input clk,
	input we,
	input [31:0] a,
	input [31:0] wd,
	output [31:0] rd
);

reg [31:0] RAM [63:0];

always @(posedge clk) begin 
	if(we) begin 
		RAM[a[31:2]] <= wd;
	end
end

assign rd = RAM[a[31:2]];

endmodule
