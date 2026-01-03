module game_timer(clk, reset, seconds, time_up);

// clk is 1 hz
input clk, reset;
output reg [7:0] seconds;
output reg time_up;

always@(posedge clk or negedge reset)
begin
    if(!reset)
    begin
        seconds <= 8'd60;
        time_up <= 1'b0;
    end
    else
    begin
        if (seconds > 0)
        begin
            seconds <= seconds - 1'b1; // count down
            time_up <= 1'b0;
        end
        else
        begin
            seconds <= 8'd0; // stay at 0
            time_up <= 1'b1; // game over
        end
    end
end

endmodule