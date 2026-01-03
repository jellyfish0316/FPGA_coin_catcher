module debounce(clk, btn_in, btn_out);


input clk, btn_in;
output reg btn_out;

reg [3:0] shift_reg;

always@(posedge clk)
begin
	// TODO: Implement debounce logic
	// Note: DE10-Lite KEYs are active low (Pressed = 0, Released = 1)

    shift_reg <= {shift_reg[2:0], btn_in}; // 1. Shift btn_in into shift_reg

	 if (shift_reg == 4'b0000) begin //2. Output Logic (Level Detection)
        btn_out <= 1; 
    end
    else begin
        btn_out <= 0; 
    end
end

endmodule
