module matrix_driver(
    input clk,          // 10kHz
    input reset, 
    input [2:0] player_x, 
    input [2:0] coin_x, 
    input [3:0] coin_y,
    input coin_type,    // 0 = 1x1, 1 = 2x1
    output reg [7:0] row_out,
    output reg [15:0] col_out
);

    reg [2:0] scan_x;

    always @(posedge clk or negedge reset) begin
        if(!reset) begin
            scan_x <= 0;
            row_out <= 8'hFF;
            col_out <= 16'h0000;
        end
        else begin
            // 1. 掃描 X 軸 (每一瞬間只選通一列 Row)
            scan_x <= scan_x + 1;

            // 2. 根據圖片：Row 第 i 個 bit 為 0 時選通
            // 使用反相位移，例如 scan_x=4 時，row_out = 11101111
            row_out <= ~(8'b00000001 << scan_x);

            // 3. 根據圖片：Column 第 j 個 bit 為 1 時點亮
            // 先將所有 Col 重置為 0 (不亮)
            col_out <= 16'h0000; 

            // --- 顯示玩家 (Player) ---
            // 玩家常駐在底部 Y=15 (對應 col_out[15])
            if(scan_x == player_x) begin
                col_out[15] <= 1'b1; // 設定為 1 點亮
            end
				if(scan_x == player_x + 3'd1) begin
					col_out[15] <= 1'b1;
					col_out[14] <= 1'b1;
				end
				if(scan_x == player_x - 3'd1) begin
					col_out[15] <= 1'b1;
					col_out[14] <= 1'b1;
				end
            
            // --- 顯示金幣 (Coin) ---
            if (coin_type == 1'b0) begin
                // 類型 0: 1x1
                if (scan_x == coin_x) begin
                    col_out[coin_y] <= 1'b1;
                end
            end
            else begin
                // 類型 1: 2x1 (橫向佔據兩個 X 位置)
                if ((scan_x == coin_x) || (scan_x == coin_x + 3'd1)) begin
                    col_out[coin_y] <= 1'b1;
                end
            end
        end
    end
endmodule