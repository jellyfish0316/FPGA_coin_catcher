module player_ctrl(clk, reset, game_over, btn_l, btn_r, player_x_out);

input clk, reset, game_over, btn_l, btn_r;
output reg [2:0] player_x_out;

always@(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		player_x_out <= 3;
	end
	else if(!game_over)
	begin
		case ({btn_l, btn_r})
			2'b10: begin
				//if (player_x_out > 3'd0) 
				player_x_out <= player_x_out - 3'd1;
				//else                    player_x_out <= player_x_out;
			end
			2'b01: begin
				//if (player_x_out < 3'd7) 
				player_x_out <= player_x_out + 3'd1;
				//else                    player_x_out <= player_x_out;
			end
			default: begin
				player_x_out <= player_x_out;
			end
		endcase
	end
end
endmodule