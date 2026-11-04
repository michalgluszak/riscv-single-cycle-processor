`timescale 1ns/1ps

module register_file(
	input clk,
	input we3,
	input [4:0] a1, a2, a3,
	input [31:0] wd3,
	output [31:0] rd1, rd2
);

reg [31:0] rf [31:0];

always @(posedge clk) begin 
	if(we3) begin 
		rf[a3] <= wd3;
	end		
end

assign rd1 = (a1 != 1'b0) ? rf[a1] : 1'b0; 
assign rd2 = (a2 != 1'b0) ? rf[a2] : 1'b0; 

endmodule
