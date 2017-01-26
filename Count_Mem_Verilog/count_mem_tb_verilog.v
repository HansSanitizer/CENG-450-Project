`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:18:10 01/18/2008
// Design Name:   count_mem
// Module Name:   M:/Lab1/Count_Mem_Verilog/count_mem_tb_verilog.v
// Project Name:  Count_Mem_Verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: count_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module count_mem_tb_verilog_v;

	// Inputs
	reg clk;
	reg reset;
	reg en;

	// Outputs
	wire [7:0] dout;

	// Instantiate the Unit Under Test (UUT)
	count_mem uut (
		.clk(clk), 
		.reset(reset), 
		.en(en), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		en = 0;
		#170000;
		reset = 0;
		#40000;
		en = 1;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

	always begin
		clk = 0;
		#40000;
		clk = 1;
		#40000;
	end
	
endmodule
