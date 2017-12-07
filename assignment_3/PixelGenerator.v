`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:04 09/14/2017 
// Design Name: 
// Module Name:    PixelGenerator 
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
module PixelGenerator(
   input clk,
   input [1:0] mode,
   input request_color,
   input [8:0] row,
   input [9:0] column,
   input [15:0] data_from_ram,
   output reg [7:0] next_color,
   output reg [14:0] ram_address
   );
   
   // Latched row and column so they only change when req is high.
   reg [7:0] latched_row;
   reg [9:0] latched_column;
   
   reg [30:0] random_number;
   initial random_number = 30'd250000;
   
   // Keeps track of the pixel state.
   reg [1:0] pixel_state;
   initial pixel_state = 0;
   
   // Latch data so we know it wont change. 
   reg [15:0] latched_data_in;
   initial latched_data_in = 0;
   
   // Calculates the address of the letter. 
   wire [14:0] pixel_address;
   //assign ascii_address = { 4'b0, latched_row[8:3], latched_column[9:3] };
	assign pixel_address = {((latched_row<<6)+(latched_row<<4)) + {8'h00, latched_column[9:3]}}[14:0];	//paint pixel address

   
   // Calculates the row of the letter. 
   wire [14:0] color_address;
   //assign letter_address = 14'h2000 + {latched_data_in[7:0], latched_row[2:1]};
   assign color_address = 15'h4B00 + color_index;
	
	reg [3:0] color_index;

   
   always@(*) begin
	
		color_index = 3'b0;
      case (latched_column[2:1]) 
			0: begin
				color_index = latched_data_in[15:12];
			end
			1: begin
				color_index = latched_data_in[11:8];
			end
			2: begin
				color_index = latched_data_in[7:4];
			end
			3: begin
				color_index = latched_data_in[3:0];
			end
		endcase
		
      
      // Case statements for get the data out of the ram. 
      case (pixel_state)
         0: begin
               ram_address = pixel_address;
            end
         default: begin 
               ram_address = color_address;
            end
      endcase
   end

   always@(posedge clk) begin
      // Update the random number
      random_number <= random_number << 2;
      random_number <= { random_number[29:0], random_number[30]^random_number[27] };
      
      pixel_state <= pixel_state + 1'b1;
      
      // Only latch when the request is high. 
      if (request_color) begin
         pixel_state <= 1'b0;
         latched_row <= row[8:1];
         latched_column <= column;
         case (mode)
            0: next_color <= data_from_ram[7:0];
            1: next_color <= random_number[7:0];
            2: next_color <= {8{latched_column[5] ^ latched_row[4]}};
            default: next_color <= 8'b00010010;
         endcase
      end
      latched_data_in <= 15'b0;
      if (pixel_state == 1) begin
         latched_data_in <= data_from_ram;
      end
   end
   

endmodule
