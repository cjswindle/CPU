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
	input					debug_core,
	//input					raw_next_inst,
	inout					mouse_data,
	inout					mouse_clk,
   output 				hsync,
   output 				vsync,
	output				x_overflow,
	output				y_overflow,
	output				left_button,
	output				middle_button,
	output				right_button,
   output	[7:0] 	rgbcolor,
	output	[7:0]		sev_seg,
	output	[3:0]		an
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
	
	// Debouncer wires
	wire debounced_next_inst;
	assign debounced_next_inst = 0;
	
	// Debounce the next instruction button
/*	Debouncer _debouncer(.clk						(clk),
								.raw_button				(raw_next_inst),
								.debounced_button		(debounced_next_inst));*/
	
	wire	[15:0]	x;
	wire	[15:0] 	y;
	wire				data_ready;
	wire				left_click;
	wire				right_click;

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
	Core _core(.clk					(clk),
				  .debug_core			(debug_core),
				  .debug_next_inst	(debounced_next_inst),
				  .data_from_ram		(data_from_ram_b),
				  .x						(x),
				  .y						(y),
				  .data_ready			(data_ready),
				  .left_click			(left_click),
				  .right_click			(right_click),
				  .ram_address			(ram_address_b),
				  .data_to_ram			(data_to_ram_b),
				  .web					(web));	


	IOController _ioController(.clk					(clk),
										.data_in				(mouse_data),
										.usb_clk				(mouse_clk),
										.x_overflow			(x_overflow),
										.y_overflow			(y_overflow),
										.left_button		(left_button),
										.middle_button		(middle_button),
										.right_button		(right_button),
										.sev_seg				(sev_seg),
										.an					(an),
										.data_ready			(data_ready),
										.x						(x),
										.y						(y),
										.right_click		(right_click),
										.left_click			(left_click));
										  

endmodule
