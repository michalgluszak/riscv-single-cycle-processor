`timescale 1ns/1ps

module d_flipflop #(parameter WIDTH = 1)(
	input clk,
	input reset,
	input [WIDTH-1:0] d,
	output reg [WIDTH-1:0] q
);

always @(posedge clk) begin 
	if(reset) begin 
		q <= 0;
	end else begin 
		q <= d;
	end
end

endmodule
