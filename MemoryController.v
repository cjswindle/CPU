`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:14:41 11/03/2017
// Design Name:
// Module Name:    MemoryController
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
module MemoryController(
    input 	[23:0] 	core_RAMaddress,
    input 				clk,
    output 	[15:0] 	mem_to_core_data,
    input 				write_enable,
    input 	[15:0] 	core_write_data,
	 input 	[23:0] 	vga_address,
	 output 	[15:0] 	vga_data
    );


	//synthesis attribute box_type VGARAM "black_box"
	VGARAM	_VGARAM(.clkb		(clk), 
						  .dinb		(16'b0), 
						  .web		(1'b0), 
						  .addrb		(vga_address[14:0]), 
						  .doutb		(vga_data), 
						  .clka		(clk),
						  .addra		(core_RAMaddress[14:0]),
						  .douta		(mem_to_core_data), 
						  .wea		(write_enable), 
						  .dina		(core_write_data));
endmodule
