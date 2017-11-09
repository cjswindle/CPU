`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:25 09/14/2017 
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
   input            clk,
   input      [7:0] next_color,
   output     [8:0] row,
   output     [9:0] column, 
   output reg [7:0] rgbcolor,  
   output request_color,
   output reg hsync,
   output reg vsync
    );
    
   // Create and initialize the counters.
   reg [1:0] pixel_counter;
   initial pixel_counter = 0;
   reg [9:0] column_counter;
   initial column_counter = 0;
   reg [9:0] row_counter;
   initial row_counter = 0;
   
   // Wires for next state of counters
   wire [1:0] next_pixel_counter;
   wire [9:0] next_column_counter;
   wire [9:0] next_row_counter;
   
   // Wires for next state of hsync, vsync, & next_rgbcolor.
   wire next_hsync;
   wire next_vsync;
   
   // Boolean wires which keep track of end of pixel count,
   // end of line, and end of frame.
   wire end_of_pixel;
   wire end_of_line;
   wire end_of_frame;
   
   // Sets end of pixel to true if 4 cycles have passed.
   assign end_of_pixel = (pixel_counter == 3);
   
   // Request colors from the pixel generator when pixel ends.
   assign request_color = end_of_pixel && (row < 480 && column < 640);
   
   // The line ends at 799. Rolls over back to 0 when that is reached. 
   assign end_of_line  = ((column_counter == 799) && end_of_pixel);
   // The frame ends at 524. Rolls over back to 0 when that is reached. 
   assign end_of_frame = ((row_counter == 524) && end_of_line);
   
   // Boolean which is true if the column counter or the row counter are in the visible area.
   assign visible_area = ((column_counter < 48) || (column_counter >= 688)) ? 1'b0:
                         ((row_counter    < 33) || (row_counter    >= 513)) ? 1'b0:
                                                                              1'b1;
   // Only set row and column if in the visible area. Also offset row/column counter so (0,0)
   // is in the visible area.
   wire [9:0] calculated_row_output;
   assign calculated_row_output = row_counter - 8'd33;
   
   assign row = calculated_row_output[8:0];
   assign column = column_counter - 8'd46;   // 48 - 2
   
   // Increment the pixel counter.
   assign next_pixel_counter  = pixel_counter + 1'b1;
   
   // Update the next column counter at the end of pixel. 
   // Roll over to 0 if end of line is true.
   assign next_column_counter = !end_of_pixel ? column_counter :
                                 end_of_line  ? 8'b0           : column_counter + 1'b1;
   
   // Update the next row counter at the end of pixel. 
   // Roll over to 0 if end of frame is true.   
   assign next_row_counter    = (!end_of_pixel || !end_of_line) ? row_counter :
                                                   end_of_frame ? 8'b0        : row_counter + 1'b1;
   
   // Only activate hsync if column_counter is in the (799 - 96) range.
   assign next_hsync    = (column_counter > 703) ? 1'b0 : 1'b1;
   
   // Only activate vsync if row_counter is in the (534 - 2) range.
   assign next_vsync    = (row_counter > 522)    ? 1'b0 : 1'b1;
   
   // Set the current counters to the next counters at the positive edge of the clock.
   always@(posedge clk) begin
      pixel_counter <= next_pixel_counter;
      column_counter <= next_column_counter;
      row_counter <= next_row_counter;
      hsync <= next_hsync;
      vsync <= next_vsync;
      rgbcolor <= 8'b0;
      if (visible_area) begin
         rgbcolor <= next_color;
      end
   end


endmodule

