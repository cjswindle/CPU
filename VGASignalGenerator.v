`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CS3710
// Engineer: Christopher Swindle
// 
// Create Date:    12:20:23 09/14/2017 
// Design Name: 
// Module Name:    VGASignalGenerator 
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
module VGASignalGenerator(
	input clk,
	input [7:0] nextVGAdata,
	output req,
	output [8:0] row,
	output [9:0] column,
   output reg Hsync,
   output reg Vsync,
   output reg [7:0] VGAcolor
    );


	reg [1:0] pixelCounter = 0;	
	reg [9:0] columnCounter = 0;
	reg [9:0] rowCounter = 0;
	
	wire [1:0] nextPixel;
	wire [9:0] nextColumn;
	wire [9:0] nextRow; 
	
	wire endPixel;
	wire endLine;
	wire endFrame;
	wire visibleArea;
	
	wire nextHsync;
	wire nextVsyn;
	wire [7:0] nextVGAcolor;
	//800x525 Display---640x480 viewable   25.125Mhz (25Mhz actual)
	//////////combinational logic///////////////////////
	assign endPixel = &pixelCounter;
	assign endLine = ((columnCounter == 799) && endPixel) ? 1'b1 : 1'b0;	//if End of row generate end of line signal
	assign endFrame = ((rowCounter == 524) && endLine) ? 1'b1 : 1'b0;		//if end of line and last row generate end of frame signal
	assign visibleArea =  ((columnCounter > 47) && (columnCounter <= (48 + 640))) && ((rowCounter > 32) && (rowCounter <= (33 + 480)));
	
	
	assign nextPixel = pixelCounter + 1'b1;
	//Only increment on every fourth pixel count & reset when end of row
	assign nextColumn = !endPixel ? columnCounter : 
								endLine ? 8'b0 : columnCounter + 1'b1;
	//Only increment at end of column and on fourth pixel count & reset when at end of frame
	assign nextRow =    !endPixel ? rowCounter :
								!endLine ? rowCounter :
								endFrame ? 8'b0 : rowCounter + 1'b1; 
	
	assign req = endPixel && (row < 480 && column < 640);
	assign row = {rowCounter - 8'd33}[8:0];						
	assign column = columnCounter - 8'd46;
	
	//receives data from Pixel generator unless outside visible region
	assign nextVGAcolor = visibleArea ? nextVGAdata : 8'b0;
	
	//Signal Hsync active low when colum counter is at end of display(not visible)
	assign nextHsync = (columnCounter > (799-96)) ? 1'b0 : 1'b1;
	//Signal Vsync active low when row is at end of display (not visible)
	assign nextVsync = (rowCounter > (524 -2)) ? 1'b0 : 1'b1;

	//latch next value determined by combinitorial logic to ensure all data is sent at the
	//same time in the next clock cycle
	always@(posedge clk) begin
		Hsync <= nextHsync;
		Vsync <= nextVsync;
		VGAcolor <= nextVGAcolor;
		pixelCounter <= nextPixel;
		columnCounter <= nextColumn;
		rowCounter <= nextRow;
	end
	
endmodule
