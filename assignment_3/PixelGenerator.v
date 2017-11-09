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
   reg [8:0] latched_row;
   reg [9:0] latched_column;
   
   reg [30:0] random_number;
   initial random_number = 30'd250000;
   
   // Keeps track of the glyph state.
   reg [1:0] glyph_state;
   initial glyph_state = 0;
   
   
   reg glyph;
   // Latch data so we know it wont change. 
   reg [15:0] latched_data_in;
   initial latched_data_in = 0;
   
   // Upper bits of the data coming from the RAM
   wire [7:0] upper_bits;
   assign upper_bits = data_from_ram[15:8];

   // Upper bits of the data coming from the RAM  
   wire [7:0] lower_bits;
   assign lower_bits = data_from_ram[7:0];
   
   // Calculates the address of the letter. 
   wire [14:0] ascii_address;
   assign ascii_address = { 4'b0, latched_row[8:3], latched_column[9:3] };
   
   // Calculates the row of the letter. 
   wire [14:0] letter_address;
   assign letter_address = 14'h2000 + {latched_data_in[7:0], latched_row[2:1]};
   
   always@(*) begin
      // Set the glyph depending on if we need upper bits or lower bits.
      if (!latched_row[0]) begin
         glyph = upper_bits[latched_column[2:0]];
      end
      else begin
         glyph = lower_bits[latched_column[2:0]];
      end  
      
      // Case statements for get the data out of the ram. 
      case (glyph_state)
         0: begin
               ram_address = ascii_address;
            end
         default: begin 
               ram_address = letter_address;
            end
      endcase
   end

   always@(posedge clk) begin
      // Update the random number
      random_number <= random_number << 2;
      random_number <= { random_number[29:0], random_number[30]^random_number[27] };
      
      glyph_state <= glyph_state + 1'b1;
      
      // Only latch when the request is high. 
      if (request_color) begin
         glyph_state <= 1'b0;
         latched_row <= row;
         latched_column <= column;
         case (mode)
            0: next_color <= {8{latched_column[5] ^ latched_row[5]}};
            1: next_color <= random_number[7:0];
            2: next_color <= {8{glyph}};
            default: next_color <= 8'b11111111;
         endcase
      end
      latched_data_in <= 15'b0;
      if (glyph_state == 1) begin
         latched_data_in <= data_from_ram;
      end
   end
   

endmodule
