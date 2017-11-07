`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:06:44 09/14/2017
// Design Name:
// Module Name:    VGAPixelGenerator
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
 module VGAPixelGenerator(
	input clk,
	input [1:0] mode,
	input req,
	input [8:0] row,
	input [9:0] column,
	input [15:0] RAMdata,
	output reg [7:0] VGAdata,
	output reg [23:0] RAMaddress
    );

	reg [8:0] latchedRow;
	reg [9:0] latchedColumn;

	reg [30:0] randomNumber;
	initial randomNumber = 30'd3;

	//State machine for RAM
	reg [1:0] Glyphstate;
	reg [13:0] TextAddress;
	reg [7:0] GlyphData;
	reg PixelData;

	initial RAMaddress = 14'h0000;
	initial GlyphData = 8'h00;
	initial PixelData = 1'b0;

	always@(*) begin
		if(!latchedRow[0]) begin
			GlyphData = RAMdata[15:8];
		end
		else begin
			GlyphData = RAMdata[7:0];
		end
		PixelData = GlyphData[latchedColumn[2:0]];

		case(Glyphstate)
			0	:	RAMaddress = {12'b0, ({1'b0,{latchedRow[8:3],latchedColumn[9:3]}})};
			1	:	RAMaddress = {12'b0, (14'h2000 + {TextAddress[7:0], latchedRow[2:1]})};
			2	:	RAMaddress = {12'b0, (14'h2000 + {TextAddress[7:0], latchedRow[2:1]})};
			3	:	RAMaddress = {12'b0, (14'h2000 + {TextAddress[7:0], latchedRow[2:1]})};
		endcase

	end
	//State machine for RAM

	always@(posedge clk) begin
		Glyphstate <= Glyphstate + 1'b1;
		TextAddress <= 14'h0000;
		if(Glyphstate ==1) begin
			TextAddress <= RAMdata[13:0];
		end

		randomNumber <= {randomNumber[28:0], randomNumber[30]^randomNumber[28], randomNumber[29]^randomNumber[26]};

		if(req) begin
			Glyphstate <= 2'b00;
			latchedRow <= row;
			latchedColumn <= column;
			case(mode)
				0	: 	VGAdata <= {2'b01, {3{latchedColumn[5]^latchedRow[5]}}, 3'b110};
				1	:	VGAdata <= randomNumber[7:0];
				2	:	begin
							if(PixelData)begin
								VGAdata <= 8'b11111111;
							end
							else begin
								VGAdata <= 8'd0;
							end
						end
				3	:	VGAdata <= {2'b11, {3{latchedColumn[5]^latchedRow[5]}}, 3'b10} & (randomNumber[7:0]);
			endcase
		end
	end
endmodule
