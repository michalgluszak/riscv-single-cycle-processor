`timescale 1ns/1ps

module top_tb;
reg clk = 1'b0;
reg reset = 1'b1;

top uut(.clk(clk), .reset(reset));

always #5 clk = ~clk;

initial begin 
$monitor("Instr = %0h", uut.Instr);
#10;
reset = 1'b0;
#30;
$finish();
end

endmodule
