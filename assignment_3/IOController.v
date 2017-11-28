`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:55 11/19/2017 
// Design Name: 
// Module Name:    IOController 
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
module IOController(
	input				clk,
	input				data_in,
	output			usb_clk,
	output [7:0]	sev_seg,
	output [3:0]	an
/*	output [7:0]	x,
	output [7:0]	y*/
	);
	
	assign usb_clk = clk;
	
	reg [11:0] 	counter 			= 0;
	reg [11:0] 	next_counter	= 0;
	reg 			usb_ready;
	
	reg [15:0]	latched_packet	= 0;
	
	
	assign usb_ready		= (counter == 4000);
	assign next_counter 	= usb_ready ? 12'b0 : counter + 1'b1;
	
	
	always@(*) begin
	
	end
	
	always@(posedge clk) begin
		counter <= next_counter;
	end

	SevenSeg _sevenSeg(.clk				(clk),
							 .inputNumber	(latched_packet),
							 .sev_seg		(sev_seg),
							 .an				(an));

endmodule
