module score_keeper(clk, reset, player_x, coin_x, coin_y, coin_type, caught, score_out);

//clk is 5 hz
input clk, reset, coin_type;
input [2:0] player_x, coin_x;
input [3:0] coin_y;

output reg caught;// Signal to reset the coin
output reg [7:0] score_out;

always@(posedge clk or negedge reset)
begin
 if(!reset)
 begin
  score_out <= 0;
  caught <= 0;
 end
 else
 begin
  caught <= 0; // Default = 0
  
  // TODO: Collision logic (Coin catch)
  
  // 1. Check if the coin is at the bottom (coin_y == 15)
  //    (Only check collision when it hits the ground/player level)
  if (coin_y == 4'd15) 
        begin
  // 2. Compare Player X and Coin X
  //  -Case 1x1 coin: (player_x == coin_x)
  //  -Case 2x1 coin: (player_x == coin_x) or (player_x == coin_x + 1)
  // 3. If collided:
  //  -Increase score_out.(Decide what you like, notice the max score is 99)
  //  -Set 'caught' to 1 (to tell coin_generator to reset)
   if (coin_type == 0) 
   begin
    // Case 1x1 coin: Exact match required
    if (player_x == coin_x) 
    begin
      caught <= 1;
      // 3. If collided: Increase score (Cap at 99)
      if (score_out < 99)
       score_out <= score_out + 1;
    end
   end
   else 
   begin
    // Case 2x1 coin: Player can be at coin_x OR coin_x + 1
    if ((player_x == coin_x) || (player_x == coin_x + 1)) 
    begin
      caught <= 1;
      // 3. If collided: Increase score (Cap at 99)
      if (score_out < 99)
       score_out <= score_out + 2;
    end
   end
  
  end
 end
end

endmodule