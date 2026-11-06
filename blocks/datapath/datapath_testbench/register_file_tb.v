`timescale 1ns/1ps

module register_file_tb;
reg clk = 1'b0;
reg we3;
reg [4:0] a1, a2, a3;
reg [31:0] wd3;
wire [31:0] rd1, rd2;

always #5 clk = ~clk;

register_file uut(
	.clk(clk), 
	.we3(we3), 
	.a1(a1), 
	.a2(a2), 
	.a3(a3), 
	.wd3(wd3), 
	.rd1(rd1), 
	.rd2(rd2));

initial begin 
$monitor("a1 = %0d a2 = %0d a3 = %0d we3 = %b wd3 = %0d rd1 = %0d rd2 = %0d", a1, a2, a3, we3, wd3, rd1, rd2);
we3 = 1'b1; a3 = 5'd18; wd3 = 32'd31;
#10;
we3 = 1'b1; a3 = 5'd19; wd3 = 32'd39;
#10;
we3 = 1'b1; a3 = 5'd21; wd3 = 32'd45;
#10;
we3 = 1'b0; a1 = 5'd21; a2 = 5'd18;
#10;
we3 = 1'b0; a1 = 5'd21; a2 = 5'd19;
#10;
$display("RF[18] = %0d RF[19] = %0d RF[21] = %0d", uut.rf[18], uut.rf[19], uut.rf[21]);
$finish();
end

endmodule
