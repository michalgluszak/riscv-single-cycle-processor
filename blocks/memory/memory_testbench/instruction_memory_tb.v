`timescale 1ns/1ps

module instruction_memory_tb;
reg [31:0] a;
wire [31:0] rd;

instruction_memory instruction_memory_tb(
	.a(a), 
	.rd(rd));

initial begin 
$monitor("a = %0d rd = %0h", a, rd);
a = 32'd0;
#10;
a = 32'd1;
#10;
a = 32'd2;
#10;
a = 32'd3;
#10;
a = 32'd4;
#10;
a = 32'd8;
#10;
$finish();
end

endmodule
