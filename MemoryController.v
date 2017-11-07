`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:14:41 11/03/2017
// Design Name:
// Module Name:    MemoryController
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
module MemoryController(
    input [23:0] RAMaddress,
    input clk,
    output [15:0] RAMdata,
    input write_enable,
    input [15:0] write_data,
    );


	// still in VGA controller. Needs to be passed back and fort


	//synthesis attribute box_type VGARAM "black_box"
	VGARAM	_VGARAM(.clka(clk),.addra(RAMaddress),.douta(RAMdata), .wea(write_enable), .dina(write_data));
endmodule
