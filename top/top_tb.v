`timescale 1ns/1ps

module top_tb;
reg clk = 1'b0;
reg reset = 1'b1;

top uut(.clk(clk), .reset(reset));

always #5 clk = ~clk;

integer i = 0;

initial begin 
$monitor({"PC = %0d Instr = %0h ImmExt = %0h SrcA = %0d SrcB = %0d ALUResult = %0d WriteData = %0d ReadData = %0d Result = %0d \n", 
	"op = %b RegWrite = %b ImmSrc = %b ALUSrc = %b MemWrite = %b ResultSrc = %b Branch = %b ALUControl = %b\n"}, 
	uut.PC, uut.Instr, uut.riscvsingle_ins.datapath_ins.ImmExt,  uut.riscvsingle_ins.datapath_ins.SrcA,  uut.riscvsingle_ins.datapath_ins.SrcB, uut.ALUResult, uut.WriteData, uut.ReadData,  
	uut.riscvsingle_ins.datapath_ins.Result, uut.riscvsingle_ins.controller_ins.op, uut.riscvsingle_ins.controller_ins.RegWrite, uut.riscvsingle_ins.controller_ins.ImmSrc, 
	uut.riscvsingle_ins.controller_ins.ALUSrc, uut.riscvsingle_ins.controller_ins.MemWrite, uut.riscvsingle_ins.controller_ins.ResultSrc, uut.riscvsingle_ins.controller_ins.Branch,
	uut.riscvsingle_ins.controller_ins.ALUControl);
#10;
reset = 1'b0;
#60;

	if(uut.riscvsingle_ins.datapath_ins.regfile.rf[18] == 32'd5) begin 
		$display("rf[18] = 5");
		i = i+1;
	end

	if(uut.riscvsingle_ins.datapath_ins.regfile.rf[19] == 32'd6) begin 
		$display("rf[19] = 6");
		i = i+1;
	end

	if(uut.riscvsingle_ins.datapath_ins.regfile.rf[20] == 32'd11) begin 
		$display("rf[20] = 11");
		i = i+1;
	end
	
	if(uut.data_memory_ins.RAM[1] == 32'd11) begin 
		$display("DATA MEMORY RAM[1] = 11");
		i = i+1;
	end

	if(uut.riscvsingle_ins.datapath_ins.regfile.rf[25] == 32'd11) begin 
		$display("rf[25] = 11");
		i = i+1;
	end

	if(i == 5) begin 
		$display("Processor work isucceeded");
	end

$finish();
end

endmodule
