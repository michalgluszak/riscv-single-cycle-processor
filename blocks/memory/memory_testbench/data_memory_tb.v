`timescale 1ns/1ps

module data_memory_tb;
reg clk =1'b1;
reg we;
reg [31:0] a;
reg [31:0] wd;
wire [31:0] rd;

always #5 clk = ~clk;

data_memory data_memory_ins(
	.clk(clk), 
	.we(we), 
	.a(a), 
	.wd(wd), 
	.rd(rd));

initial begin 
$monitor("a = %0d wd = %0d we = %b rd = %0d", a, wd, we, rd);
a = 32'd4; wd = 32'd35; we = 1'b1;
#10;
a = 32'd4; wd = 32'bx; we = 1'b0;
#10;
a = 32'd12; wd = 32'd40; we = 1'b1;
#10;
a = 32'd12; wd = 32'bx; we = 1'b0;
#10;
$display("RAM[1] = %0d RAM[3] = %0d", data_memory_ins.RAM[1], data_memory_ins.RAM[3]);
$finish();
end

endmodule
