`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:32:33 11/08/2017
// Design Name:   CPU
// Module Name:   /home/rajp/Projects/CS_3710/assignment_3/CoreTest.v
// Project Name:  assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CoreTest;

	// Inputs
	reg clk;
	reg [1:0] mode;

	// Outputs
	wire hsync;
	wire vsync;
	wire [7:0] rgbcolor;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.mode(mode), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgbcolor(rgbcolor)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
      #10 clk= ~clk;
   end
      
endmodule

