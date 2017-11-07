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
	 parameter EXECUTE = 3'b010;
	 parameter LOAD1 = 3'b011;
	 parameter LOAD2 = 3'b100;
	 parameter STORE1 = 3'b101;

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
	 reg [23:0] program_return_link;
	 reg status_SF;
	 reg status_ZF;
	 reg status_OF;
	 reg [3:0] core_state;

	 initial program_counter = 0;	//Start of assembly code (fix address)
	 initial status_SF = 0;
	 initial status_ZF = 0;
	 initial status_OF = 0;
	 initial core_state = 0;

	 // Data that needs to persist between cycles
	 reg [4:0] dest_reg_index;
	 reg [10:0] immediateL;
	 reg [5:0] immediateS;
	 reg [23:0] data_from_reg_1;
	 reg [23:0] data_from_reg_2;
	 reg [4:0] op_code;

	 reg [15:0] instruction;	// Latch the instruction so we can decode it and guarantee that it is the correct value

	 reg [4:0]	next_state;		// Used to determine the next state based on the op-code. (do we need a next state? or can we just assign the state parameter to the next state?)

	 always@*
	 begin
		core_to_mem_write_enable = 0;
		case(core_state)
			FETCH:	begin
							// Send the address to memory to get the instruction, disable writing.
							core_to_mem_addr = program_counter;
							
						end
			DECODE:	begin
							// Check to see if the instruction is a load or store instruction
							// If it isn't send to the EXECUTE stage
							if (mem_to_core_data[15:11] == LOAD)
								next_state = LOAD1;

							else if (mem_to_core_data[15:11] == STORE)
								next_state = STORE1;

							else
								next_state = EXECUTE; 
						end
			EXECUTE:	begin
							//Grab register values
							read_index_1 = mem_to_core_data [4:0];
							read_index_2 = mem_to_core_data [9:5];
							immediatS = mem_to_core_data [10:5];
							dest_reg_index = read_index_1;
							
							case(instruction[15:11])
								ADD:		begin
												write_data = data_reg_1 + data_reg_2;
												write_enable = 1;
											end
								SUB:		begin
												write_data = data_reg_1 - data_reg_2;
												write_enable = 1;
											end
								ADDI:		begin
												write_data = data_reg_1 + immediateS;
												write_enable = 1;
											end
								SHLLI:	begin
												write_data = data_reg_1 << immediateS;
												write_enable = 1;
											end
								SHRLI:	begin
												write_data = data_reg_1 >> immediateS;
												write_enable = 1;
											end
								JUMP:		begin
												program_counter = immediateL;
											end
								JUMPLI:	begin
												program_counter = immediateL;
												program_return_link = program_counter + 16; //should this be $reta???
											end
								JUMPL:	begin
												if(status_SF != status_OF)
														program_counter = immediateL;
											end
								JUMPG:	begin
												if(status_SF == status_OF && status_ZF == 0)
													program_counter = immediateL;
											end
								JUMPE:	begin
												if(status_ZF == 1)
													program_counter = immediateL << 4;
											end
								JUMPNE:	begin
												if(status_ZF == 0)
													program_counter = immediateL;<< 4;
											end
								CMP:		begin
												status_SF = (data_reg_1[15])^(data_reg_1 - data_reg_2)[15];	//
												status_ZF = !(|(data_reg_1- data_reg_2));	//or all the bits together and invert for ZF bit
												status_OF = ;//????
											end
								RET:		begin
													program_counter = ;//Insert return address $reta
											end
								MOV:		begin
													write_data = data_reg_2;
													write_enable = 1;
											end
								LOADI:	begin
												write_data = immediateS;
												write_enable = 1;
											end
								default:	begin

											end
							endcase
						end
			LOAD1:	begin							
								core_to_mem_addr = data_reg_2; //load from address register		
						end
			LOAD2:	begin
							data_reg_1 = mem_to_core_data;
							write_enable = 1;
						end
			STORE1:	begin
							core_to_mem_addr = data_reg_1;
							core_to_mem_data = data_reg_2;
	output reg			core_to_mem_write_enable = 1;
						end
			default:	begin
							// do nothing
						end
		endcase
	 end

	 always@(posedge clk)
	 begin
		case(core_state)
			FETCH:	begin
							core_state <= DECODE;
						end
			DECODE:	begin
							// Latch the instruction
							instruction <= mem_to_core_data;
							core_state <= next_state;

							//Grab possible inputs i.e. reg, immediate, etc (src, dest)
							dest_reg_index <= mem_to_core_data[4:0];
							immediateL <= mem_to_core_data[10:0];
							immediateS <= mem_to_core_data[10:5];
							data_from_reg_1 <= read_data_1;
							data_from_reg_2 <= read_data_2;
							op_code <= mem_to_core_data[15:11];
						end
			EXECUTE:	begin
							core_state <= FETCH;
						end
			LOAD1:	begin
							core_state <= LOAD2;
						end
			LOAD2:	begin
							core_state <= FETCH;
						end
			STORE1:	begin
							core_state <= FETCH;
						end
			endcase
	 end


endmodule
