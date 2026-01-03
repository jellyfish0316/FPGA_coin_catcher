module coin_catcher_game(
	clk, 
	reset,
	btn_left, btn_right, // Controller inputs
	dot_row, dot_col,// Dot matrix outputs
	HEX_0, HEX_1, HEX_2, HEX_3, HEX_4, HEX_5// 7-Seg outputs
);

input clk, reset, btn_left, btn_right;
output [7:0] dot_row;
output [15:0] dot_col; // The dot matrix has 8 rows and 16 columns
output [6:0] HEX_0, HEX_1, HEX_2, HEX_3, HEX_4, HEX_5;

//---Internal wires---
wire clk_timer;// For timer (1 hz)
wire clk_scan; // For dot matrix(10k hz)
wire clk_game; // For gaming speed (5 hz)

wire db_btn_left, db_btn_right; // Debounce controller signals

wire [7:0] score, seconds;
wire coin_type, game_over;

// Coordinates of the objects
wire [2:0] player_x, coin_x;// Range 0~7
wire [3:0] coin_y;// Range 0~15

//---Frequency Divider--- 
freq_div Clocks(
	.clk_in(clk), 
	.reset(reset), 
	.clk_timer(clk_timer), 
	.clk_scan(clk_scan), 
	.clk_game(clk_game)
);

//---Debounce---
debounce BtnL(.clk(clk), .btn_in(btn_left), .btn_out(db_btn_left));
debounce BtnR(.clk(clk), .btn_in(btn_right), .btn_out(db_btn_right));

//---Game Logic---
game_core Game(
	.clk(clk_game), 
	.reset(reset),
	.btn_l(db_btn_left), 
	.btn_r(db_btn_right),
	.time_up(game_over),
	.player_x(player_x),
	.coin_x(coin_x),
	.coin_y(coin_y),
	.coin_type(coin_type),
	.score(score)
);

//---Countdown Timer---
game_timer Timer(
	.clk(clk_timer),
	.reset(reset),
	.seconds(seconds),
	.time_up(game_over)
);

//---Matrix Driver---
matrix_driver Matrix(
	.clk(clk_scan),
	.reset(reset),
	.player_x(player_x),
	.coin_x(coin_x),
	.coin_y(coin_y),
	.coin_type(coin_type),
	.row_out(dot_row),
	.col_out(dot_col)
);

//---7-Seg Decoder---

// Score Display (Right side)
seg_decoder Hex0(.in(score % 10), .out(HEX_0));// Units digit
seg_decoder Hex1(.in(score / 10), .out(HEX_1));// Tens digit

// Time Display (Left side)
seg_decoder Hex4(.in(seconds % 10), .out(HEX_4));// Units digit
seg_decoder Hex5(.in(seconds / 10), .out(HEX_5));// Tens degit


// Turn off unused middle displays
assign HEX_2 = 7'b1111111;
assign HEX_3 = 7'b1111111;

endmodule
