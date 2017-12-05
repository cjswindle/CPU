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
	inout				data_in,
	inout				usb_clk,
	output			left_button,
	output			middle_button,
	output			right_button,
	output			x_overflow,
	output			y_overflow,
	output [7:0]	sev_seg,
	output [3:0]	an
/*	output [7:0]	x,
	output [7:0]	y*/
	);
	
	parameter stream_command = 8'hf4;
	
	// States for sending stream command and start recieving data.
	parameter SEND_STREAM_COMMAND_1	= 3'b000,
				 SEND_STREAM_COMMAND_2 	= 3'b001,
				 ACK_STREAM_COMMAND		= 3'b010,
				 PACKET_1					= 3'b011,
				 PACKET_2					= 3'b100,
				 PACKET_3					= 3'b101,
				 DONE							= 3'b110;
				 
	wire	[15:0] latched_packet;
	assign latched_packet = { current_x[7:0], current_y[7:0] };
	
	assign x_overflow 	= current_x[8];
	assign y_overflow 	= current_y[8];
	assign left_button	= current_btn[0];
	assign right_button	= current_btn[1];
	assign middle_button = current_btn[2];
	
	reg	[2:0]	current_state	= 0;
	reg	[2:0] next_state		= 0;
	reg	[8:0] current_x		= 0;
	reg	[8:0] next_x			= 0;
	reg	[8:0] current_y		= 0;
	reg	[8:0] next_y			= 0;
	reg	[2:0]	current_btn		= 0;
	reg	[2:0]	next_btn			= 0;
	reg			write_to_mouse	= 0;
	wire			done_writing;
	wire			done_reading;
	wire	[7:0]	mouse_data;
	
	wire idle_status;
	
	ReadFromMouse _readFromMouse(.clk					(clk),
										  .data_in				(data_in),
										  .usb_clk				(usb_clk),
										  .read_from_mouse	(idle_status),
										  .done_reading		(done_reading),
										  .data_out				(mouse_data));
	
	WriteToMouse _writeToMouse(.clk					(clk),
										.write_to_mouse	(write_to_mouse),
										.data_to_write		(stream_command),
										.usb_clk				(usb_clk),
										.data_out			(data_in),
										.idle_status		(idle_status),
										.done_writing		(done_writing));
	
	always@(*) begin	
		next_state 		= current_state;
		write_to_mouse = 1'b0;
		next_x			= current_x;
		next_y			= current_y;
		next_btn			= current_btn;
		
		case(current_state)
		
			SEND_STREAM_COMMAND_1: 	begin
				write_to_mouse	= 1'b1;
				next_state		= SEND_STREAM_COMMAND_2;
			end
			
			SEND_STREAM_COMMAND_2: 	begin
				if (done_writing) begin
					next_state	= ACK_STREAM_COMMAND;
				end
			end
			
			ACK_STREAM_COMMAND:		begin
				if (done_reading) begin
					next_state	= PACKET_1;
				end
			end
			
			// First data packet
			PACKET_1:	begin
				if (done_reading) begin
					next_state 	= PACKET_2;
					next_x[8]	= mouse_data[4];
					next_y[8]	= mouse_data[5];
					next_btn		= mouse_data[2:0];
				end
			end
			
			PACKET_2:	begin
				if (done_reading) begin
					next_state	= PACKET_3;
					next_x[7:0]	= mouse_data;
				end
			end
			
			PACKET_3:	begin
				if (done_reading) begin
					next_state	= DONE;
					next_y[7:0]	= mouse_data;
				end			
			end
			
			DONE:			begin
				next_state		= PACKET_1;
			end
		
		endcase
	end
	

	always@(posedge clk) begin
		current_state 	<= next_state;
		current_x		<= next_x;
		current_y		<= next_y;
		current_btn		<= next_btn;
	end

	SevenSeg _sevenSeg(.clk				(clk),
							 .inputNumber	(latched_packet),
							 .sev_seg		(sev_seg),
							 .an				(an));						 

endmodule
