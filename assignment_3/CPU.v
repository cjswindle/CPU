`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:41 11/08/2017 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
	input 				clk,
   input 	[1:0] 	mode,
   output 				hsync,
   output 				vsync,
   output	[7:0] 	rgbcolor
   );

	// RAM wires for VGA
   wire [14:0] ram_address_a;
   wire [15:0] data_to_ram_a;
   wire [15:0] data_from_ram_a;
   wire wea;
	
	// RAM wires for Core
	wire [14:0] ram_address_b;
	wire [15:0] data_to_ram_b;
   wire [15:0] data_from_ram_b;
   wire web;
	
	// This is temp
//	assign ram_address_b = 0;
//	assign data_to_ram_b = 0;
//	assign data_from_ram_b = 0;
//	assign web = 0;
	
	// RAM for the glyphs and text in ascii
   //synthesis attribute box_type VGARAM "black_box"
   VGARAM _vgaRam (.addra		(ram_address_a),
						 .dina		(data_to_ram_a),
						 .douta		(data_from_ram_a),
						 .wea			(wea),
						 .clka		(clk),
						 .addrb		(ram_address_b),
						 .dinb		(data_to_ram_b),
						 .doutb		(data_from_ram_b),
						 .web			(web),
						 .clkb		(clk));
	
	// VGA Controller for the glyphs
	VGAController _vgaController(.clk					(clk),
										  .mode					(mode),
										  .data_from_ram_a	(data_from_ram_a),								
										  .hsync					(hsync),
										  .vsync					(vsync),
										  .rgbcolor				(rgbcolor),
										  .ram_address_a		(ram_address_a),
										  .data_to_ram_a		(data_to_ram_a),
										  .wea					(wea));
										  
	// The Core
	Core _core(.clk				(clk),
				  .data_from_ram	(data_from_ram_b),
				  .ram_address		(ram_address_b),
				  .data_to_ram		(data_to_ram_b),
				  .web				(web));			
										  

endmodule
