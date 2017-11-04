`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:56 11/03/2017 
// Design Name: 
// Module Name:    Core 
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
module Core(
	input [15:0] 			mem_to_core_data,
	output reg [23:0] 	core_to_mem_addr,
	output reg [15:0] 	core_to_mem_data,
	output reg				core_to_mem_write_enable,
	output reg 				write_enable_core_to_mem
	
	
    );
	 
	 // List of parameters for our registers and their associated binary values
	 // and the state names with the correlated binary value.
	 parameter ADD = 5'b00000;
	 parameter SUB = 5'b00001;
	 parameter ADDI = 5'b00010;
	 parameter SHLLI = 5'b00011;
	 parameter SHRLI = 5'b00100;
	 parameter JUMP = 5'b00101;
	 parameter JUMPLI = 5'b00110;
	 parameter JUMPL = 5'b00111;
	 parameter JUMPG = 5'b01000;
	 parameter JUMPE = 5'b01001;
	 parameter JUMPNE = 5'b01010;
	 parameter CMP = 5'b01011;
	 parameter RET = 5'b01100;
	 parameter LOAD = 5'b01101;
	 parameter LOADI = 5'b01110;
	 parameter STORE = 5'b01111;
	 parameter MOV = 5'b10000;
	 
	 parameter FETCH = 3'b000;
	 parameter DECODE = 3'b001;
	 parameter EXEXUTE = 3'b010;
	 parameter LOAD1 = 3'b011;
	 parameter LOAD2 = 3'b100;
	 parameter STORE1 = 3'b101;
	 parameter STORE2 = 3'b110;
	 
	 // Wires and registers usd to communicate with the register file.
	 wire [23:0] read_data_1;
	 wire [23:0] read_data_2;
	 
	 reg [4:0] read_index_1; // unlatched
	 reg [4:0] read_index_2; // unlatched
	 reg [4:0] write_index; // unlatched
	 reg write_enable; // unlatched
	 reg [23:0] write_data; // unlatched
	 
	 // Instantiate the register file module
	 RegisterFile _RegisterFile (.read_data_1(read_data_1), .read_data_2(read_data_2), .read_index_1(read_index_1), .read_index_2(read_index_2), .write_index(write_index), .write_enable(write_enable), .write_data(write_data));
	 
	 // Data that needs to persist between instructions
	 reg [23:0] program_counter;
	 reg status_SF;
	 reg status_ZF;
	 reg status_OF; 
	 reg [3:0] core_state;
	 
	 // Data that needs to persist between cycles
	 reg [4:0] dest_reg_index;
	 reg [10:0] immediate;
	 reg [23:0] data_from_reg_1;
	 reg [23:0] data_from_reg_2;
	 reg [4:0] op_code;
	 
	 reg [15:0] instruction;	// Latch the instruction so we can deocde it and guarantee that it is the correct value
	 
	 reg [4:0]	next_state;		// Used to determine the next state based on the op-code.
	 
	 always@*
	 begin
		case(core_state)
			FETCH:	begin
							// Send the address to memory to get the instruction, disable writing.
							core_to_mem_addr = program_counter;
							core_to_mem_write_enable = 0;
						end				
			DECODE:	begin
							// Check to see if the instruction is a load or store instruction
							// If it isn't send to the EXECUTE stage
							
							if (mem_to_core_data[15:11] == 5'b01101 || mem_to_core_data[15:11] == 5'b01110)
								next_state = LOAD1;
							
							else if (mem_to_core_data[15:11] == 5'b01111)
								next_state = STORE1;
								
							else
								next_state = EXECUTE;
						end
			EXECUTE:	begin
							case(instruction[15:11])
								ADD:		begin
								
											end
								SUB:		begin
								
											end
								ADDI:		begin
								
											end
								SHLLI:	begin
								
											end
								SHRLI:	begin
								
											end
								JUMP:		begin
								
											end
								JUMPLI:	begin
								
											end
								JUMPL:	begin
								
											end
								JUMPG:	begin
								
											end
								JUMPE:	begin
								
											end
								JUMPNE:	begin
								
											end
								CMP:		begin
								
											end
								RET:		begin
										
											end
								MOV:		begin
								
											end
								default:	begin
								
											end
							endcase
						end
			LOAD1:	begin
			
						end
			LOAD2:	begin
			
						end
			STORE1:	begin
			
						end
			STORE2:	begin
			
						end
			default:	begin
							// do nothing
						end
		endcase
	 end
	 
	 always@(posedge clk)
	 begin
		// Change the core state.
		//	Change the PC (increment/jump/etc.)
		case(core_state)
			FETCH:	begin
							core_state <= DECODE;
						end				
			DECODE:	begin
							// Latch the instruction
							instruction <= mem_to_core_data;
							core_state <= next_state;
						end
			EXECUTE:	begin
			
						end
			LOAD1:	begin
			
						end
			LOAD2:	begin
			
						end
			STORE1:	begin
			
						end
			STORE2:	begin
			
						end
			default:	begin
							// do nothing
						end
			endcase
	 end


endmodule
