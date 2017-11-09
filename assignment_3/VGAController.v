`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:06 09/14/2017 
// Design Name: 
// Module Name:    VGAController 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGAController(
   input 				clk,
   input 	[1:0] 	mode,
	input		[15:0]	data_from_ram_a,
   output 				hsync,
   output 				vsync,
   output 	[7:0] 	rgbcolor,
	output 	[14:0]	ram_address_a,
	output 	[15:0]	data_to_ram_a,
	output				wea
   );
    
   // Wires for connecting Pixel Generator and VGA Signal Generator together. 
   wire request_color;
   wire [9:0] column;
   wire [8:0] row;
   wire [7:0] next_color;
   
	// We dont want to write to RAM.
   assign data_to_ram_a = 0;
   assign wea = 0;
    
   // Connect the pixel generator module with the wires.
   PixelGenerator _pixelGenerator (.clk				(clk), 
											  .mode				(mode), 
											  .request_color	(request_color), 
											  .row				(row), 
											  .column			(column), 
											  .data_from_ram	(data_from_ram_a), 
											  .next_color		(next_color), 
											  .ram_address		(ram_address_a));  
    
   // Connect the VGA Signal Generator with the wire. 
   VGASignalGenerator _vgaSignalGenerator (.clk					(clk),
														 .next_color		(next_color), 
														 .row					(row), 
														 .column				(column), 
														 .rgbcolor			(rgbcolor), 
														 .request_color	(request_color), 
														 .hsync				(hsync), 
														 .vsync				(vsync));

endmodule
