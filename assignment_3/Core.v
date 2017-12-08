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
	input						debug_core,
	input						debug_next_inst,
	input			[15:0]	data_from_ram,
	input			[15:0]	mouse_x,
	input			[15:0]	mouse_y,
	input						x_overflow,
	input						y_overflow,
	input						data_ready,
	input						left_click,
	input						right_click,
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
	parameter ADDR 	= 5'b00110;
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
	parameter INCRSR 	= 5'b10001;
	parameter INDRAW	= 5'b10010;
	parameter INERSR	= 5'b10011;
	parameter SETCOLR	= 5'b10100;

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
										.write_data		(write_data),
										.mouse_x			(mouse_x),
										.mouse_y			(mouse_y),
										.x_overflow		(x_overflow),
										.y_overflow		(y_overflow),
										.left_click		(left_click),
										.right_click	(right_click),
										.data_ready		(data_ready));
										
	// Data that needs to persist between instructions
	reg [14:0] program_counter;
	initial program_counter = 15'd19216;	//Start of assembly code (fix address)
	
	reg [14:0] next_program_counter;
	initial next_program_counter = 15'b0;
	
	reg [23:0] program_return_link;
	reg status_ZF;
	reg status_GF;
	reg status_LF;
	reg [3:0] core_state;


	initial status_ZF = 0;
	initial status_GF = 0;
	initial status_LF = 0;	
	initial core_state = 3'b0;

	// Data that needs to persist between cycles
	reg [4:0] 	dest_reg_index;
	reg [10:0] 	immediateL;
	reg [5:0] 	immediateS;
	reg [23:0] 	data_from_reg_1;
	reg [23:0] 	data_from_reg_2;
	reg [3:0]	selected_color = 4'b0100;
	
	reg [4:0] opcode;	// Latch the instruction so we can decode it and guarantee that it is the correct value
	initial opcode = 0;
	
	// Used to calculate the next SF, ZF, and OF for the next assembly instruction to use.
	reg next_status_ZF;
	reg next_status_GF;
	reg next_status_LF;
	reg [3:0] next_selected_color;
	
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
		write_index = dest_reg_index;
		data_to_ram = 16'b0;
		next_status_ZF = 0;
		next_status_LF = 0;
		next_status_GF = 0;
		next_selected_color = 4'b0100;
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
												write_data = data_from_reg_1 + {{10{immediateS[5]}},immediateS};
												write_enable = 1;
											end
								SHLLI:	begin
												write_data = data_from_reg_1 << immediateS;
												write_enable = 1;
											end
								SHRLI:	begin
												write_data = data_from_reg_1 >>> immediateS;
												write_enable = 1;
											end
								JUMP:		begin
												next_program_counter = (program_counter + 1'b1) + {{4{immediateL[10]}},immediateL};
											end
								ADDR:	begin
												write_data = {(data_from_reg_1<<6)+(data_from_reg_1<<4) + (data_from_reg_2>>2)}[23:0];
												write_index = 5'd31;
												write_enable = 1;
											end
								JUMPL:	begin
												if(status_LF) begin													
													next_program_counter = (program_counter + 1'b1) + {{4{immediateL[10]}}, immediateL};
												end
											end
								JUMPG:	begin
												if(status_GF) begin
													next_program_counter = (program_counter + 1'b1) + {{4{immediateL[10]}}, immediateL};
												end
											end
								JUMPE:	begin
												if(status_ZF == 1) begin
													next_program_counter = (program_counter + 1'b1) + {{4{immediateL[10]}},immediateL};
												end
											end
								JUMPNE:	begin
												if(status_ZF == 0) begin
													next_program_counter = (program_counter + 1'b1) + {{4{immediateL[10]}},immediateL};
												end
											end
								CMP:		begin
												next_status_ZF = !(|(data_from_reg_1 - data_from_reg_2));	//or all the bits together and invert for ZF bit 
												if ($signed(data_from_reg_1) < $signed(data_from_reg_2)) begin
													next_status_LF = 1'b1;
												end
												if ($signed(data_from_reg_1) > $signed(data_from_reg_2)) begin
													next_status_GF = 1'b1;
												end
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
								INCRSR: begin
												write_index = 5'd16;
												write_enable = 1'b1;
												case(data_from_reg_1[1:0])
													0 : write_data = {(4'b1111),(data_from_reg_2[11:0])};
													1 : write_data = {(data_from_reg_2[15:12]),(4'b1111),(data_from_reg_2[7:0])};
													2 : write_data = {(data_from_reg_2[15:8]),(4'b1111),(data_from_reg_2[3:0])};
													3 : write_data = {(data_from_reg_2[15:4]),(4'b1111)};
												endcase
											end
								INDRAW: begin
												write_index = 5'd16;
												write_enable =1'b1;
												case(data_from_reg_1[1:0])
													0 : write_data = {4'b0100,(data_from_reg_2[11:0])};
													1 : write_data = {(data_from_reg_2[15:12]),4'b0100,(data_from_reg_2[7:0])};
													2 : write_data = {(data_from_reg_2[15:8]),4'b0100,(data_from_reg_2[3:0])};
													3 : write_data = {(data_from_reg_2[15:4]),4'b0100};
												endcase
											end
								INERSR: begin
												write_index = 5'd16;
												write_enable = 1'b1;
												case(data_from_reg_1[1:0])
													0 : write_data = {(4'b0000),(data_from_reg_2[11:0])};
													1 : write_data = {(data_from_reg_2[15:12]),(4'b0000),(data_from_reg_2[7:0])};
													2 : write_data = {(data_from_reg_2[15:8]),(4'b0000),(data_from_reg_2[3:0])};
													3 : write_data = {(data_from_reg_2[15:4]),(4'b0000)};
												endcase
											end
								SETCOLR:	begin
												case(data_from_reg_1[1:0])
													0: next_selected_color = data_from_reg_2[15:12];
													1:	next_selected_color = data_from_reg_2[11:8];
													2:	next_selected_color = data_from_reg_2[7:4];
													3:	next_selected_color = data_from_reg_2[3:0];
												endcase
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
							if (!debug_core) begin
								core_state <= DECODE;
							end
							else begin
								core_state <= FETCH;
								if (debug_next_inst) begin
									core_state <= DECODE;
								end
							end
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
							status_ZF <= next_status_ZF;
							status_LF <= next_status_LF;
							status_GF <= next_status_GF;
							selected_color <= next_selected_color;
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
