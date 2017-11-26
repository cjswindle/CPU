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
	
/*	reg [] buttonDebounce;
	reg [] counter;
	
	always@(posedge clk) begin  
			  counter <= counter + 1'b1;
			  //Sample user button press
			  if(raw_button) begin
					buttonDebounce <= buttonDebounce + 1'b1;
			  end
			  //Trigger slower clock rate
			  if(counter == 10000000)begin
					counter <= 0;
					 if(raw_button == 0) begin
						  buttonFlag <= 1'b0;
						  buttonDebounce <= 0;
					 end
				end
				else begin
					//timer mode enabled
					if(buttonFlag == 0) begin
							  //check timer stop
							 if(buttonDebounce > 2000000) begin
									buttonFlag <= 1; 
									buttonDebounce <= 0;
							  end
					end
					else begin
							  if(buttonDebounce > 2000000) begin
							  buttonFlag <= 0;
							  buttonDebounce <= 0;
							  end
					end
				 end
		 end*/
endmodule


