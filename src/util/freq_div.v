`define TimeTimer 32'd25000000
`define TimeScan 32'd2500
`define TimeGame 32'd5000000
module freq_div(clk_in, reset, clk_timer, clk_scan, clk_game);

input clk_in, reset;
output reg clk_timer, clk_scan, clk_game;

reg [31:0] cnt_t, cnt_s, cnt_g;

always@(posedge clk_in or negedge reset)
begin
	if(!reset)
	begin
		cnt_t <= 32'd0; clk_timer <= 1'b0;
		cnt_s <= 32'd0; clk_scan <= 1'b0;
		cnt_g <= 32'd0; clk_game <= 1'b0;
	end
	else
	begin
		if(cnt_t >= `TimeTimer)
		begin
			cnt_t <= 32'd0;
			clk_timer <= ~clk_timer;
		end
		else
		begin
			cnt_t <= cnt_t + 32'd1;
		end
		
		if(cnt_s >= `TimeScan)
		begin
			cnt_s <= 32'd0;
			clk_scan <= ~clk_scan;
		end
		else
		begin
			cnt_s <= cnt_s + 32'd1;
		end
		
		if(cnt_g >= `TimeGame)
		begin
			cnt_g <= 32'd0;
			clk_game <= ~clk_game;
		end
		else
		begin
			cnt_g <= cnt_g + 32'd1;
		end
	end
end

endmodule

		