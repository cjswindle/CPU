`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:18 11/09/2017 
// Design Name: 
// Module Name:    Debouncer 
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
module Debouncer(
	input			clk,
	input			raw_button,
	output		debounced_button
	);
	
	wire slow_clk_en;
	wire Q1,Q2,Q2_bar;
	
	clock_enable u1(clk,raw_button,slow_clk_en);
	
	Dflipflop d1(clk,slow_clk_en,raw_button,Q1);
	
	Dflipflop d2(clk,slow_clk_en,Q1,Q2);
	
	assign Q2_bar = ~Q2;
	assign debounced_button = Q1 & Q2_bar;
	
endmodule


// Slow clock enable for debouncing button 
module clock_enable(
	input 		Clk_100M,
	input			pb_1, 
	output 		slow_clk_en
	);
	
   reg [17:0] counter = 18'b0;
   always @(posedge Clk_100M, negedge pb_1) begin
     if(pb_1==0)
			counter <= 0;
      else
       counter <= (counter >= 249999) ? 18'b0 : counter + 1'b1;
   end
   assign slow_clk_en = (counter == 249999) ? 1'b1 : 1'b0;
	
endmodule

// D-flip-flop with clock enable signal for debouncing module 
module Dflipflop(
	input 		DFF_CLOCK,
	input 		clock_enable,
	input			D, 
	output reg 	Q
	);
	
	initial Q = 0;
	always @ (posedge DFF_CLOCK) begin
		if(clock_enable==1) 
			Q <= D;
	end
	 
endmodule
