`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:37:38 12/06/2017
// Design Name:   PixelGenerator
// Module Name:   /home/rajp/Projects/CPU/assignment_3/PixelGeneratorTest.v
// Project Name:  assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PixelGenerator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PixelGeneratorTest;

	// Inputs
	reg clk;
	reg [1:0] mode;
	reg request_color;
	reg [8:0] row;
	reg [9:0] column;
	reg [15:0] data_from_ram;

	// Outputs
	wire [7:0] next_color;
	wire [14:0] ram_address;

	// Instantiate the Unit Under Test (UUT)
	PixelGenerator uut (
		.clk(clk), 
		.mode(mode), 
		.request_color(request_color), 
		.row(row), 
		.column(column), 
		.data_from_ram(data_from_ram), 
		.next_color(next_color), 
		.ram_address(ram_address)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 0;
		request_color = 0;
		row = 0;
		column = 0;
		data_from_ram = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

