`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    22:04:47 09/14/2017
// Design Name:
// Module Name:    VGAcontrollerTop
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
module VGAcontrollerTop(
	input clk,
	input [1:0] mode,
	output Hsync,
	output Vsync,
	output [7:0] RGBcolor,
	input [16:0] RAMdata,
	output [23:0] RAMaddress
    );

	wire [8:0] row;
	wire [9:0] column;


	wire req;
	wire [7:0] VGAdata;


	VGAPixelGenerator _VGAPixelGenerator(clk, mode, req, row, column, RAMdata, VGAdata, RAMaddress);
	VGASignalGenerator _VGASignal(clk, VGAdata, req, row, column, Hsync, Vsync, RGBcolor);
endmodule
