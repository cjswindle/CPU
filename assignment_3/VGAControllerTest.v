`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:08:49 09/14/2017
// Design Name:   VGAController
// Module Name:   /home/rajp/Projects/CS_3710/assignment_3/VGAControllerTest.v
// Project Name:  assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGAController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGAControllerTest;

	// Inputs
	reg clk;
	reg [1:0] mode;

	// Outputs
	wire hsync;
	wire vsync;
	wire [7:0] rgbcolor;

	// Instantiate the Unit Under Test (UUT)
	VGAController uut (
		.clk(clk), 
		.mode(mode), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgbcolor(rgbcolor)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 2'b10;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   
   always begin
      #10 clk= ~clk;
   end
      
endmodule

