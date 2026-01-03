module game_core(
    clk, reset,
    btn_l, btn_r,
    time_up,
    player_x,// X range: 0~7
    coin_x, coin_y,// X range: 0~7, Y range: 0~15
    coin_type,
    score
);

//clk is 5 hz
input clk, reset, btn_l, btn_r, time_up;

output coin_type;
output [2:0] player_x, coin_x;
output [3:0] coin_y;
output [7:0] score;
    
wire coin_caught;// High when coin is caught

// 1. Instantiate Player Control
player_ctrl Player(
	.clk(clk), .reset(reset), .game_over(time_up),
	.btn_l(btn_l), .btn_r(btn_r),
	.player_x_out(player_x)
);

// 2. Instantiate Coin Generator
coin_generator Coin(
	.clk(clk), .reset(reset), .game_over(time_up),
	.coin_caught(coin_caught),
	.coin_x_out(coin_x), .coin_y_out(coin_y), .type_out(coin_type)
);

// 3. Instantiate Score Keeper
score_keeper Score(
	.clk(clk), .reset(reset),
	.player_x(player_x), .coin_x(coin_x), .coin_y(coin_y), .coin_type(coin_type),
	.caught(coin_caught),
	.score_out(score)
);

endmodule
