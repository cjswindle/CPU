`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:45 11/19/2017 
// Design Name: 
// Module Name:    SevenSeg 
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
module SevenSeg(
	input clk,
	input [15:0] inputNumber,
	output reg [7:0] sev_seg,
	output [3:0] an
   );
	
   // 7 seg variable states.
	parameter num0 = 8'b11000000, // 0
				 num1 = 8'b11111001, // 1
				 num2 = 8'b10100100, // 2
				 num3 = 8'b10110000, // 3
				 num4 = 8'b10011001, // 4
				 num5 = 8'b10010010, // 5
				 num6 = 8'b10000010, // 6
				 num7 = 8'b11111000, // 7
				 num8 = 8'b10000000, // 8
				 num9 = 8'b10010000; // 9
	
	reg [19:0] counter;				// Counter for the clock.
	reg [1:0] anode_counter;		// Keeps track of which anode to update.
	reg [3:0] tempNumber;			// Holds the extracted bits from the input number.
	initial counter = 0;				//
	initial anode_counter = 0;    // INITIALIZE variables.
	initial tempNumber = 0;       //
	
	// The refresh rate of the 7 seg displays.
	always@ (posedge clk) begin
		counter <= counter + 1'b1;
		// 1/4th of 60Hz.
		if (counter == 416666) begin
			counter <= 0;
		end
		if (counter == 0) begin
			// Update the anode counter on a "pulse"
			anode_counter <= anode_counter + 1'b1;
		end
	end
	
   // Set which anode to update.
	assign an = (anode_counter == 0) ? 4'b1110: // Update the first 7 seg display
					(anode_counter == 1) ? 4'b1101: // Update the second.
					(anode_counter == 2) ? 4'b1011: // Update the third.
												  4'b0111; // Update the last.
					 
	always @ (*) begin
      // Extract the numbers that need to be shown on 7 seg display based on which
      // anode we're on.
		case (anode_counter)
			0:	tempNumber = inputNumber[3:0];
			1: tempNumber = inputNumber[7:4];
			2: tempNumber = inputNumber[11:8];
			3: tempNumber = inputNumber[15:12];
		endcase
		
		// Set the LED depending on what number to show.
		case (tempNumber)
			0:  sev_seg = num0;
			1:  sev_seg = num1;
			2:  sev_seg = num2;
			3:  sev_seg = num3;
			4:  sev_seg = num4;
			5:  sev_seg = num5;
			6:  sev_seg = num6;
			7:  sev_seg = num7;
			8:  sev_seg = num8;
			9:  sev_seg = num9;
			default : sev_seg = 8'b10111111; //dash
		endcase
	end

endmodule
