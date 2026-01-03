module coin_generator(clk, reset, game_over, coin_caught, coin_x_out, coin_y_out, type_out);

// clk is 5 hz
input clk, reset, game_over, coin_caught;

output reg [2:0] coin_x_out;// Range 0~7
output reg [3:0] coin_y_out;// Range 0~15
output reg type_out;//0 = 1x1, 1 = 2x1

// TODO: Define your random number variables here (for the generation of coins)

reg [15:0] random_val; // Example variable (modifiable)

always@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		coin_x_out <= 4;
		coin_y_out <= 0;// Coins fall from y = 0
		// TODO: Reset your random seed here
		random_val <= 16'h1234; // Invalid, please modify it with your logic
	end
	else if(!game_over)
	begin
		// TODO: Implement random nuber logic
		//	Update your random value every cycle.
		random_val <= {random_val[14:0], random_val[15] ^ random_val[13] ^ random_val[12] ^ random_val[10]};
		// TODO: Falling and Reset logic
		//	1. check reset conditions (Caught or Bottom)
		if(coin_caught || coin_y_out == 15)
		begin
			coin_y_out <= 0; // Coins fall from y = 0
			
			// 2. Generate new random x (coin_x_out) using your random_val
			//		-Range must be 0~7
			coin_x_out <= random_val[2:0];
			// 3. Generate new random coin type (type_out)
			//		-If type is 2x1, ensure coin_x_out is not 7 (boundary error)
			type_out <= random_val[3];
			if (random_val[3] == 1 && random_val[2:0] == 3'd7)
			begin
                coin_x_out <= 3'd6; 
            end
		end
		else
		begin
			// Normal falling
			coin_y_out <= coin_y_out + 1;
		end
	end
end

endmodule

			