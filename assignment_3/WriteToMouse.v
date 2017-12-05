`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:56 12/03/2017 
// Design Name: 
// Module Name:    WriteToMouse 
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
module WriteToMouse(
	input				clk,
	input				write_to_mouse,
	input	[7:0]		data_to_write,
	inout				usb_clk,
	inout				data_out,
	output	reg	idle_status,
	output	reg	done_writing
	);
	
	parameter IDLE				= 3'b000,
				 SEND_REQUEST	= 3'b001,
				 START			= 3'b010,
				 SEND_DATA		= 3'b011,
				 STOP				= 3'b100;

	reg	[2:0]	current_state	= 0;
	reg	[2:0] next_state		= 0;
	reg	[7:0] current_filter	= 0;
	wire	[7:0] next_filter;
	reg	current_filter_clk	= 0;
	wire	next_filter_clk;	
	
   reg 	[3:0]	current_data_counter	= 0;
	reg	[3:0] next_data_counter		= 0;
	
	reg	[8:0] current_data_buffer		= 0;
	reg	[8:0] next_data_buffer			= 0;

	reg 	[12:0] current_clk_counter	= 0;
	reg	[12:0] next_clk_counter		= 0;
	
   wire 		parity_bit;
	assign	parity_bit = ~(^data_to_write);
	
	wire	fall_edge;	
   reg 	current_usb_clk;
	reg 	current_data_out;
   reg 	tri_state_clk;
	reg 	tri_state_data;
	
	assign	usb_clk	= (tri_state_clk)  ? current_usb_clk  : 1'bz;
	assign	data_out	= (tri_state_data) ? current_data_out : 1'bz;
	
	assign	next_filter			= { usb_clk, current_filter[7:1] };
	
	assign	next_filter_clk 	= (current_filter == 8'b11111111) ? 1'b1 :
										  (current_filter == 8'b00000000) ? 1'b0 :
										  current_filter_clk;
											
	assign	fall_edge			= current_filter_clk & ~next_filter_clk;
	
	always@(*) begin
		next_state 				= current_state;
		next_clk_counter		= current_clk_counter;
		next_data_counter 	= current_data_counter;
		next_data_buffer		= current_data_buffer;
		done_writing			= 1'b0;
		current_usb_clk		= 1'b1;
		current_data_out		= 1'b1;
		tri_state_clk			= 1'b0;
		tri_state_data			= 1'b0;
		idle_status				= 1'b0;
		
		case(current_state)
		
			IDLE:	begin
				idle_status	= 1'b1;
				
				if (write_to_mouse) begin
					next_data_buffer		= {parity_bit, data_to_write};
					next_clk_counter		= 13'h1fff; // 2^13-1
               next_state				= SEND_REQUEST;
				end
			end
			
			SEND_REQUEST: begin
				current_usb_clk	= 1'b0;
				tri_state_clk 		= 1'b1;
				next_clk_counter	= current_clk_counter - 1'b1;
				
				if (current_clk_counter == 0) begin
					next_state	= START;
				end
			end
			
			START: begin	// Send enable writing.
				current_data_out	= 1'b0;
				tri_state_data		= 1'b1;
				if (fall_edge) begin // Data is only valid on a falling edge.
					next_data_counter = 4'h8;
					next_state 			= SEND_DATA;
				end
			end
			
			SEND_DATA: begin
				current_data_out	= current_data_buffer[0];
				tri_state_data		= 1'b1;
				if (fall_edge) begin
					next_data_buffer	= {1'b0, current_data_buffer[8:1]};
					if (current_data_counter == 0) begin
						next_state	= STOP;
					end
					else begin
						next_data_counter = current_data_counter - 1'b1; 
					end
				end
			end
			
			STOP: begin
				if (fall_edge) begin
					next_state		= IDLE;
					done_writing	= 1'b1;
				end
			end			
			
		endcase
	end
	
	always@(posedge clk) begin
		current_state 			<= next_state;
		current_clk_counter 	<= next_clk_counter;
		current_data_buffer	<= next_data_buffer;
		current_data_counter	<= next_data_counter;
		
		current_filter			<= next_filter;
		current_filter_clk	<= next_filter_clk;
	end

endmodule
