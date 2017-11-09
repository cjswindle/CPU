`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:10 11/08/2017 
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
	input						clk,
	input			[15:0]	data_from_ram,
	output reg	[14:0]	ram_address,
	output reg	[15:0]	data_to_ram,
	output reg				web
	);
	
	// List of parameters for our registers and their associated binary values
	// and the state names with the correlated binary value.
	parameter ADD 		= 5'b00000;
	parameter SUB 		= 5'b00001;
	parameter ADDI 	= 5'b00010;
	parameter SHLLI 	= 5'b00011;
	parameter SHRLI 	= 5'b00100;
	parameter JUMP 	= 5'b00101;
	parameter JUMPLI 	= 5'b00110;
	parameter JUMPL 	= 5'b00111;
	parameter JUMPG 	= 5'b01000;
	parameter JUMPE 	= 5'b01001;
	parameter JUMPNE 	= 5'b01010;
	parameter CMP 		= 5'b01011;
	parameter RET 		= 5'b01100;
	parameter LOAD 	= 5'b01101;
	parameter LOADI 	= 5'b01110;
	parameter STORE 	= 5'b01111;
	parameter MOV 		= 5'b10000;

	parameter FETCH 	= 3'b000;
	parameter DECODE  = 3'b001;
	parameter EXECUTE = 3'b010;
	parameter LOAD1 	= 3'b011;
	parameter LOAD2 	= 3'b100;
	parameter STORE1  = 3'b101;

	// Wires and registers used to communicate with the register file.
	wire [23:0] read_data_1;
	wire [23:0] read_data_2;

	reg [4:0] 	read_index_1; 	// unlatched
	reg [4:0] 	read_index_2; 	// unlatched
	reg [4:0] 	write_index; 	// unlatched
	reg 			write_enable; 	// unlatched
	reg [23:0] 	write_data; 	// unlatched
	
	// Instantiate the register file module
	RegisterFile _RegisterFile(.clk				(clk), 
										.read_data_1	(read_data_1), 
										.read_data_2	(read_data_2), 
										.read_index_1	(read_index_1), 
										.read_index_2	(read_index_2), 
										.write_index	(write_index), 
										.write_enable	(write_enable), 
										.write_data		(write_data));
										
	// Data that needs to persist between instructions
	reg [14:0] program_counter;
	initial program_counter = 15'd9216;	//Start of assembly code (fix address)
	
	reg [14:0] next_program_counter;
	initial next_program_counter = 15'b0;
	
	reg [23:0] program_return_link;
	//reg status_SF;
	reg status_ZF;
	reg status_OF;
	reg [3:0] core_state;


	//initial status_SF = 0;
	initial status_ZF = 0;
	initial status_OF = 0;
	initial core_state = 3'b0;

	// Data that needs to persist between cycles
	reg [4:0] dest_reg_index;
	reg [10:0] immediateL;
	reg [5:0] immediateS;
	reg [23:0] data_from_reg_1;
	reg [23:0] data_from_reg_2;

	reg [4:0] opcode;	// Latch the instruction so we can decode it and guarantee that it is the correct value
	initial opcode = 0;
	
	// Used to calculate the next SF, ZF, and OF for the next assembly instruction to use.
	//reg next_status_SF;
	reg next_status_ZF;
	reg next_status_OF;
	 

	 
	reg [3:0]	next_state;		// Used to determine the next state based on the op-code. (do we need a next state? or can we just assign the state parameter to the next state?)

	always@(*) begin
		web = 1'b0;
		ram_address = 16'b0;
		next_state = 4'b0;
		write_data = 24'b0;
		write_enable = 0;
		next_program_counter = program_counter + 1'b1;
		read_index_1 = 5'b0;
		read_index_2 = 5'b0;
		write_index = 5'b0;
		data_to_ram = 16'b0;
		next_status_ZF = 0;
		
		case(core_state)

			FETCH:	begin
							// Send the address to memory to get the instruction, disable writing.
							ram_address = program_counter;
						end
						
			DECODE:	begin
							// Check to see if the instruction is a load or store instruction
							// If it isn't send to the EXECUTE stage
							read_index_1 = data_from_ram[4:0];
							read_index_2 = data_from_ram[9:5];
							
							if (data_from_ram[15:11] == LOAD)
								next_state = LOAD1;

							else if (data_from_ram[15:11] == STORE)
								next_state = STORE1;

							else
								next_state = EXECUTE;
						end
						
			EXECUTE:	begin
							case(opcode)
								ADD:		begin
												write_data = data_from_reg_1 + data_from_reg_2;
												write_enable = 1;
											end
								SUB:		begin
												write_data = data_from_reg_1 - data_from_reg_2;
												write_enable = 1;
											end
								ADDI:		begin
												write_data = data_from_reg_1 + immediateS;
												write_enable = 1;
											end
								SHLLI:	begin
												write_data = data_from_reg_1 << immediateS;
												write_enable = 1;
											end
								SHRLI:	begin
												write_data = data_from_reg_1 >> immediateS;
												write_enable = 1;
											end
								JUMP:		begin
												next_program_counter = immediateL;
											end
								JUMPLI:	begin
												//next_program_counter = immediateL;
												//next_program_return_link = program_counter + 16; //should this be $reta???
											end
								JUMPL:	begin
												//if(status_SF != status_OF)
												//	next_program_counter = immediateL;
											end
								JUMPG:	begin
												//if(status_SF == status_OF && status_ZF == 0)
												//	next_program_counter = immediateL;
											end
								JUMPE:	begin
												if(status_ZF == 1)
													next_program_counter = immediateL;
											end
								JUMPNE:	begin
												if(status_ZF == 0)
													next_program_counter = immediateL;
											end
								CMP:		begin
												//next_status_SF = ((data_from_reg_1[15])^(data_from_reg_1 - data_from_reg_2))[15];	//
												next_status_ZF = !(|(data_from_reg_1- data_from_reg_2));	//or all the bits together and invert for ZF bit
												next_status_OF = (data_from_reg_1[15] == data_from_reg_2[15]); // THIS IS NOT RIGHT. Need to fix.
											end
								RET:		begin
													//next_program_counter = ;//Insert return address $reta
											end
								MOV:		begin
													write_data = data_from_reg_2;
													write_index = dest_reg_index;
													write_enable = 1;
											end
								LOADI:	begin
												write_index = dest_reg_index;
												write_data = immediateS;
												write_enable = 1;
											end
							endcase
						end
			LOAD1:	begin
							ram_address = data_from_reg_2[14:0]; //load from address register
						end
			LOAD2:	begin
							write_data = data_from_ram;
							write_index = dest_reg_index;
							write_enable = 1;
						end
			STORE1:	begin
							ram_address = data_from_reg_1[14:0];
							data_to_ram = data_from_reg_2[15:0];
							web = 1'b1;
						end
			default:	begin
							// do nothing
						end
		endcase
	end

	always@(posedge clk)	begin
		case(core_state)
			FETCH:	begin
							core_state <= DECODE;
						end
			DECODE:	begin
							// Latch the instruction
							opcode <= data_from_ram[15:11];
							core_state <= next_state;

							//Grab possible inputs i.e. reg, immediate, etc (src, dest)
							dest_reg_index <= data_from_ram[4:0];
							immediateL <= data_from_ram[10:0];
							immediateS <= data_from_ram[10:5];
							data_from_reg_1 <= read_data_1;
							data_from_reg_2 <= read_data_2;
						end
			EXECUTE:	begin
							core_state <= FETCH;
							program_counter <= next_program_counter;
							//status_SF <= next_status_SF;
							status_ZF <= next_status_ZF;
							//status_OF <= next_status_ZF;
						end
			LOAD1:	begin
							core_state <= LOAD2;
						end
			LOAD2:	begin							
							core_state <= FETCH;
							program_counter <= next_program_counter;
						end
			STORE1:	begin
							core_state <= FETCH;
							program_counter <= next_program_counter;
						end
			endcase
	end


endmodule
