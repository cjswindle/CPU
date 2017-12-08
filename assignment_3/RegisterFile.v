`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:24:37 11/09/2017 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
	input 					clk,
	input 		[4:0] 	read_index_1,
	input 		[4:0] 	read_index_2,
	input 		[4:0] 	write_index,
	input 		[23:0] 	write_data,
	input 					write_enable,
	input						data_ready,
	input						left_click,
	input						right_click,
	input			[15:0]	mouse_x,
	input			[15:0]	mouse_y,
	output reg 	[23:0] 	read_data_1,
	output reg 	[23:0] 	read_data_2
   );

	// 16-bit registers
	reg [15:0] r0		= 16'h0000;
	reg [15:0] r1		= 16'h0000;
	reg [15:0] r2		= 16'h0000;
	reg [15:0] r3		= 16'h0000;
	reg [15:0] r4		= 16'h0000;
	reg [15:0] r5		= 16'h0000;
	reg [15:0] r6		= 16'h0000;
	reg [15:0] r7		= 16'h0000;
	reg [15:0] r8		= 16'h0000;
	reg [15:0] r9		= 16'h0000;
	reg [15:0] r10		= 16'h0000;
	reg [15:0] r11		= 16'h0000;
	reg [15:0] r12		= 16'h0000;
	reg [15:0] r13		= 16'h0000;
	reg [15:0] r14		= 16'h0000;
	reg [15:0] r15		= 16'h0000;
	reg [15:0] r16		= 16'h0000;
	reg [15:0] r17		= 16'h0000;
	reg [15:0] r18		= 16'h0000;
	reg [15:0] r19		= 16'h0000;
	reg [15:0] r20		= 16'h0000;
	
	reg [15:0] r_read_data 	= 16'b0;
	
	reg [15:0] r_mouse_x		= 16'b0;
	reg [15:0] r_mouse_y		= 16'b0;
	reg r_data_ready	= 1'b0;
	reg r_left_click 	= 1'b0;
	reg r_right_click = 1'b0;

	// 24-bit registers
	reg [23:0] lr0		= 24'h000000;
	reg [23:0] lr1		= 24'h000000;
	reg [23:0] lr2		= 24'h000000;
	reg [23:0] lr3		= 24'h000000;
	reg [23:0] lr4		= 24'h000000;

	always@*
	begin
	  case(read_index_1)
		 0 :	 read_data_1 = {{8{r0[15]}}, r0};
		 1 :	 read_data_1 = {{8{r1[15]}}, r1};
		 2 :	 read_data_1 = {{8{r2[15]}}, r2};
		 3 :	 read_data_1 = {{8{r3[15]}}, r3};
		 4 :	 read_data_1 = {{8{r4[15]}}, r4};
		 5 :	 read_data_1 = {{8{r5[15]}}, r5};
		 6 :	 read_data_1 = {{8{r6[15]}}, r6};
		 7 :	 read_data_1 = {{8{r7[15]}}, r7};
		 8 :	 read_data_1 = {{8{r8[15]}}, r8};
		 9 :	 read_data_1 = {{8{r9[15]}}, r9};
		 10 :  read_data_1 = {{8{r10[15]}}, r10};
		 11 :  read_data_1 = {{8{r11[15]}}, r11};
		 12 :  read_data_1 = {{8{r12[15]}}, r12};
		 13 :  read_data_1 = {{8{r13[15]}}, r13};
		 14 :  read_data_1 = {{8{r14[15]}}, r14};
		 15 :  read_data_1 = {{8{r15[15]}}, r15};
		 16 :  read_data_1 = {{8{r16[15]}}, r16};
		 17 :  read_data_1 = {{8{r17[15]}}, r17};
		 18 :  read_data_1 = {{8{r18[15]}}, r18};
		 19 :  read_data_1 = {{8{r19[15]}}, r19};
		 20 :  read_data_1 = {{8{r20[15]}}, r20};
		 
		 21 :  read_data_1 = {8'b0, r_read_data};
		 
		 22 :  read_data_1 = r_mouse_x;
		 23 :  read_data_1 = r_mouse_y;
		 24 :  read_data_1 = {15'b0, r_data_ready};
		 25 :  read_data_1 = {15'b0, r_left_click};
		 26 :  read_data_1 = {15'b0, r_right_click};
		 
		 27 :  read_data_1 = lr0;
		 28 :  read_data_1 = lr1;
		 29 :  read_data_1 = lr2;
		 30 :  read_data_1 = lr3;
		 31 :  read_data_1 = lr4;
	  endcase

	  case(read_index_2)
		 0 :	 read_data_2 = {{8{r0[15]}}, r0};
		 1 :	 read_data_2 = {{8{r1[15]}}, r1};
		 2 :	 read_data_2 = {{8{r2[15]}}, r2};
		 3 :	 read_data_2 = {{8{r3[15]}}, r3};
		 4 :	 read_data_2 = {{8{r4[15]}}, r4};
		 5 :	 read_data_2 = {{8{r5[15]}}, r5};
		 6 :	 read_data_2 = {{8{r6[15]}}, r6};
		 7 :	 read_data_2 = {{8{r7[15]}}, r7};
		 8 :	 read_data_2 = {{8{r8[15]}}, r8};
		 9 :	 read_data_2 = {{8{r9[15]}}, r9};
		 10 :  read_data_2 = {{8{r10[15]}}, r10};
		 11 :  read_data_2 = {{8{r11[15]}}, r11};
		 12 :  read_data_2 = {{8{r12[15]}}, r12};
		 13 :  read_data_2 = {{8{r13[15]}}, r13};
		 14 :  read_data_2 = {{8{r14[15]}}, r14};
		 15 :  read_data_2 = {{8{r15[15]}}, r15};
		 16 :  read_data_2 = {{8{r16[15]}}, r16};
		 17 :  read_data_2 = {{8{r17[15]}}, r17};
		 18 :  read_data_2 = {{8{r18[15]}}, r18};
		 19 :  read_data_2 = {{8{r19[15]}}, r19};
		 20 :  read_data_2 = {{8{r20[15]}}, r20};
		 
		 21 :  read_data_2 = {8'b0, r_read_data};
		 
		 22 :  read_data_2 = r_mouse_x;
		 23 :  read_data_2 = r_mouse_y;
		 24 :  read_data_2 = {15'b0, r_data_ready};
		 25 :  read_data_2 = {15'b0, r_left_click};
		 26 :  read_data_2 = {15'b0, r_right_click};
		 
		 27 :  read_data_2 = lr0;
		 28 :  read_data_2 = lr1;
		 29 :  read_data_2 = lr2;
		 30 :  read_data_2 = lr3;
		 31 :  read_data_2 = lr4;
	  endcase
	end

	always@(posedge clk)
	begin
		r_data_ready <= data_ready;
		if (data_ready) begin
			r_read_data <= 16'd1;
			r_mouse_x 	<= mouse_x;
			r_mouse_y	<= mouse_y;
			r_left_click	<= left_click;
			r_right_click  <= right_click;
		end
	  if(write_enable)
	  begin
		 case(write_index)
			0 : 	r0 <= write_data[15:0];
			1 : 	r1 <= write_data[15:0];
			2 : 	r2 <= write_data[15:0];
			3 : 	r3 <= write_data[15:0];
			4 : 	r4 <= write_data[15:0];
			5 : 	r5 <= write_data[15:0];
			6 : 	r6 <= write_data[15:0];
			7 : 	r7 <= write_data[15:0];
			8 : 	r8 <= write_data[15:0];
			9 : 	r9 <= write_data[15:0];
			10 :  r10 <= write_data[15:0];
			11 :  r11 <= write_data[15:0];
			12 :  r12 <= write_data[15:0];
			13 :  r13 <= write_data[15:0];
			14 :  r14 <= write_data[15:0];
			15 :  r15 <= write_data[15:0];
			16 :  r16 <= write_data[15:0];
			17 :  r17 <= write_data[15:0];
			18 :  r18 <= write_data[15:0];
			19 :  r19 <= write_data[15:0];
			20 :  r20 <= write_data[15:0];
			
			21	:	r_read_data <= write_data[15:0];
			// We don't need to write to 23 - 27 because they're used for mouse data.
			
			27 :  lr0 <= write_data;
			28 :  lr1 <= write_data;
			29 :  lr2 <= write_data;
			30 :  lr3 <= write_data;
			31	:	lr4 <= write_data;
			default: begin
				// Do nothing.
			end
		 endcase
	  end
	end

endmodule
