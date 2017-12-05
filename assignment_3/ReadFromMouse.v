`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:44:10 12/03/2017 
// Design Name: 
// Module Name:    ReadFromMouse 
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
module ReadFromMouse(
	input				clk,
	input				data_in,
	input				usb_clk,
	input				read_from_mouse,
	output	reg	done_reading,
	output	[7:0]	data_out
	);
	
	parameter IDLE				= 2'b00,
				 RECIEVE_DATA	= 2'b01,
				 DONE				= 2'b10;
				 
			
	reg	[1:0]	current_state 	= 0;
	reg	[1:0] next_state		= 0;
	reg	[7:0]	current_filter	= 0;
	wire	[7:0] next_filter;
	
	reg		current_filter_clk	= 0;
	wire		next_filter_clk;
	
	reg	[3:0] current_data_counter = 0;
	reg	[3:0] next_data_counter		= 0;
	
	reg	[10:0] current_buffer	= 0;
	reg	[10:0] next_buffer		= 0;
	
	wire	fall_edge;
	assign fall_edge = current_filter_clk & ~next_filter_clk;
	
	assign next_filter	= { usb_clk, current_filter[7:1] };
	
	assign next_filter_clk	= (current_filter == 8'b11111111) ? 1'b1 :
									  (current_filter == 8'b00000000) ? 1'b0 :
										current_filter_clk;
										
	assign data_out = current_buffer[8:1];
										
	always@(posedge clk) begin
		current_filter 		<= next_filter;
		current_filter_clk	<= next_filter_clk;
		
		current_state			<= next_state;
		current_data_counter	<= next_data_counter;
		current_buffer			<= next_buffer;
	end	
	
	always@(*) begin
		next_state 			= current_state;
		done_reading 		= 1'b0;
		next_data_counter	= current_data_counter;
		next_buffer			= current_buffer;
		
		case(current_state)
			IDLE: begin
				if (fall_edge & read_from_mouse) begin
					next_buffer 		= { data_in, current_buffer[10:1] };
               next_data_counter = 4'b1001;
               next_state 			= RECIEVE_DATA;				
				end
			end
			
			RECIEVE_DATA: begin
				if (fall_edge) begin
					next_buffer		= { data_in, current_buffer[10:1] };
					if (current_data_counter == 0) begin
						next_state = DONE;
					end
					else begin
						next_data_counter = current_data_counter - 1'b1;
					end
				end
			end
			
			DONE: begin
				next_state 		= IDLE;
				done_reading 	= 1'b1;
			end
		endcase
	end
	
endmodule
