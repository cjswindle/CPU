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
	input				usb_clk,
	output [7:0]	sev_seg,
	output [3:0]	an
/*	output [7:0]	x,
	output [7:0]	y*/
	);
	
	// Cases used for when the SB (status byte) is first being received.
	parameter SB_L 	= 1;
	parameter SB_R 	= 2;
	parameter SB_0 	= 3;
	parameter SB_1 	= 4;
	parameter SB_XS 	= 5;
	parameter SB_YS 	= 6;
	parameter SB_XY 	= 7;
	parameter SB_YY 	= 8;


	// Cases used for when the XB (X-direction byte) is first being received.
	parameter XB_0 = 12;
	parameter XB_1 = 13;
	parameter XB_2 = 14;
	parameter XB_3 = 15;
	parameter XB_4 = 16;
	parameter XB_5 = 17;
	parameter XB_6 = 18;
	parameter XB_7 = 19;

	// Cases used for the XY (Y-direction byte) is first being received.
	parameter YB_0 = 23;
	parameter YB_1 = 24;
	parameter YB_2 = 25;
	parameter YB_3 = 26;
	parameter YB_4 = 27;
	parameter YB_5 = 28;
	parameter YB_6 = 29;
	parameter YB_7 = 30;

	// Used to store X-direction byte.
	reg [7:0]	x_data = 0;

	// Used to store the Y-direction byte.
	reg [7:0]	y_data = 0;

	wire 	[10:0] 	next_counter;
	wire 				usb_ready;
	wire				usb_input_received;
	reg 	[10:0] 	counter 			= 0;
	reg 	[5:0]		current_state 	= 0;
	reg 	[5:0]		next_state		= 0;
	
	wire	[15:0]	latched_packet;
	assign latched_packet = { 16 {data_in} };

	// If the start bit received is a 0, then we will start receiving data.
	assign usb_input_received = (data_in == 1'b0) ? 1'b1 : 1'b0;

	// Divide the clock down to 25kHz
	assign usb_ready		= (counter == 2000);
	assign next_counter 	= usb_ready ? 11'b0 : counter + 1'b1;

	// Used to store our mouse status byte.
	reg L			= 0;
	reg R			= 0;
	reg zero		= 0;
	reg one		= 0;
	reg XS		= 0;
	reg YS		= 0;
	reg XY		= 0;
	reg YY		= 0;
	reg P_1		= 0;


	always@* begin	
		next_state = 6'b0;
		if (usb_ready && usb_input_received && current_state == 6'b0) begin
			next_state = SB_L;
		end
		case(current_state)
			SB_L:	begin
						next_state = current_state + 1'b1;
					end

			SB_R:	begin
						next_state = current_state + 1'b1;
					end

			SB_0:	begin
						next_state = current_state + 1'b1;
					end

			SB_1:	begin
						next_state = current_state + 1'b1;
					end

			SB_XS: begin
						next_state = current_state + 1'b1;
					end

			SB_YS: begin
						next_state = current_state + 1'b1;
					end

			SB_XY: begin
						next_state = current_state + 1'b1;
					end

			SB_YY: begin
						next_state = current_state + 1'b1;
					end
					
			// First parity bit
			9 : 	 begin
						next_state = current_state + 1'b1;
					end
				
			// First stop bit of 1
			10 :	 begin
						next_state = current_state + 1'b1;
					end
				
			// First start bit of 0
			11 : 	 begin
						next_state = current_state + 1'b1;
					end
				
			XB_0:	 begin
						next_state = current_state + 1'b1;
					end
			
			XB_1:	 begin
						next_state = current_state + 1'b1;
					end

			XB_2:	 begin
						next_state = current_state + 1'b1;
					end

			XB_3:	 begin
						next_state = current_state + 1'b1;
					end

			XB_4:	 begin
						next_state = current_state + 1'b1;
					end

			XB_5:	 begin
						next_state = current_state + 1'b1;
					end
			
			XB_6:	 begin
						next_state = current_state + 1'b1;
					end
				
			XB_7:	 begin
						next_state = current_state + 1'b1;
					end
			
			// Second parity bit
			20 :	 begin
						next_state = current_state + 1'b1;
					end
			
			// Second stop bit (1)
			21 :	 begin
						next_state = current_state + 1'b1;
					end
			
			// Second start bit (0)
			22 :	 begin
						next_state = current_state + 1'b1;
					end
					
			YB_0:  begin
						next_state = current_state + 1'b1;
					end
			YB_1:	 begin
						next_state = current_state + 1'b1;
					end
					 
			YB_2:  begin
						next_state = current_state + 1'b1;
					end
					
			YB_3:  begin
						next_state = current_state + 1'b1;
					end
					
			YB_4:	 begin
						next_state = current_state + 1'b1;
					end
					
			YB_5:	 begin
						next_state = current_state + 1'b1;
					end
					
			YB_6:	 begin
						next_state = current_state + 1'b1;
					end
					
			YB_7:	 begin
						next_state = current_state + 1'b1;
					end
					
			31 :	 begin
						next_state = current_state + 1'b1;
					end
					
			32 :	 begin
						next_state = 6'b0;
					end 
		endcase
	end

	always@(posedge clk) begin
		counter <= next_counter;
		current_state <= next_state;
		case(current_state)
			SB_L:	begin
						L <= data_in;
					end
			SB_R:	begin
						R <= data_in;
					end
			SB_0:	begin
						zero <= data_in;
					end
			SB_1:	begin
						one <= data_in;
					end
			SB_XS:	begin
						XS <= data_in;
					end
			SB_YS: begin
						YS <= data_in;
					end
			SB_XY: begin
						XY <= data_in;
					end
			SB_YY: begin
						YY <= data_in;
					 end
			XB_0:	begin
						x_data[0]	<= data_in;
					end
			XB_1:	begin
						x_data[1]	<= data_in;
					end
			XB_2:	begin
						x_data[2]	<= data_in;
					end
			XB_3:	begin
						x_data[3]	<= data_in;
					end
			XB_4:	begin
						x_data[4]	<= data_in;
					end
			XB_5:	begin
						x_data[5]	<= data_in;
					end
			XB_6:	begin
						x_data[6]	<= data_in;
					end
			XB_7:	begin
						x_data[7] 	<= data_in;
					end
			YB_0: begin
						y_data[0] 	<= data_in;
					end
			YB_1:	begin
						y_data[1] 	<= data_in;
					end
			YB_2: begin
						y_data[2] 	<= data_in;
					end
			YB_3: begin
						y_data[3] 	<= data_in;
					end
			YB_4:	begin
						y_data[4] 	<= data_in;
					end
			YB_5:	begin
						y_data[5] 	<= data_in;
					end
			YB_6:	begin
						y_data[6] 	<= data_in;
					end
			YB_7:	begin
						y_data[7] 	<= data_in;
					end
		endcase
	end

	SevenSeg _sevenSeg(.clk				(clk),
							 .inputNumber	(latched_packet),
							 .sev_seg		(sev_seg),
							 .an				(an));

endmodule
