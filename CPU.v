`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:58:41 11/07/2017 
// Design Name: 
// Module Name:    Core 
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
		input clk,
		input [1:0] mode,
		output Hsync,
		output Vsync,
		output [7:0] RGBColor
    );

	wire [15:0] ram_to_core_data;
	wire [15:0] core_to_ram_data;
	wire [23:0] core_to_ram_address;
	wire core_to_ram_write_enable;
	
	wire [23:0] vga_to_mem_address;
	wire [15:0] mem_to_vga_data;
	
	
	Core _Core(.clk(clk), 
				  .mem_to_core_data(ram_to_core_data), 
				  .core_to_mem_addr(core_to_ram_address), 
				  .core_to_mem_data(core_to_ram_data),
				  .core_to_mem_write_enable(core_to_ram_write_enable));
	
	MemoryController _MemoryController(.vga_address(vga_to_mem_address), 
												  .vga_data(mem_to_vga_data),
												  .core_RAMaddress(core_to_ram_address), 
												  .clk(clk), 
												  .mem_to_core_data(ram_to_core_data), 
												  .write_enable(core_to_ram_write_enable), 
												  .core_write_data(core_to_ram_data));
	
	VGAcontrollerTop _VGAcontrollerTop(.Hsync(Hsync), 
												  .Vsync(Vsync), 
												  .mode(mode), 
												  .RGBcolor(RGBColor), 
												  .clk(clk), 
												  .RAMaddress(vga_to_mem_address), 
												  .RAMdata(mem_to_vga_data));

endmodule
