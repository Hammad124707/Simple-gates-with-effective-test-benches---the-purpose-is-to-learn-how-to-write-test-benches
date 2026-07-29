module knight_rider_rgb (
    input  wire clk,        
    input  wire reset,      
    output wire [3:0] led, 
    output wire led4_r,
    output wire led4_g,
    output wire led4_b,
    output wire led5_r,
    output wire led5_g,
    output wire led5_b
);

    
    reg [23:0] clk_div;
    wire step_tick = clk_div[23];   

    always @(posedge clk or posedge reset) begin
        if (reset)
            clk_div <= 24'd0;
        else
            clk_div <= clk_div + 1'b1;
    end

    reg step_tick_d;
    wire step_pulse = step_tick & ~step_tick_d;

    always @(posedge clk or posedge reset) begin
        if (reset)
            step_tick_d <= 1'b0;
        else
            step_tick_d <= step_tick;
    end

   
    reg [2:0] pos;
    reg direction;          
    reg journey_done;       

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pos          <= 3'd0;
            direction    <= 1'b0;
            journey_done <= 1'b0;
        end
        else begin
            journey_done <= 1'b0;   

            if (step_pulse) begin
                if (!direction) begin
                    if (pos == 3'd5) begin
                        direction <= 1'b1;
                        pos       <= pos - 1'b1;
                    end else
                        pos <= pos + 1'b1;
                end
                else begin
                    if (pos == 3'd0) begin
                        direction    <= 1'b0;
                        pos          <= pos + 1'b1;
                        journey_done <= 1'b1;   
                    end else
                        pos <= pos - 1'b1;
                end
            end
        end
    end

   
    reg [1:0] round;

    always @(posedge clk or posedge reset) begin
        if (reset)
            round <= 2'd0;
        else if (journey_done)
            round <= (round == 2'd2) ? 2'd0 : round + 1'b1;
    end

   
    assign led[0] = (pos == 3'd0);
    assign led[1] = (pos == 3'd1);
    assign led[2] = (pos == 3'd2);
    assign led[3] = (pos == 3'd3);

    wire led4_on = (pos == 3'd4);
    wire led5_on = (pos == 3'd5);

  
    assign led4_g = led4_on & (round == 2'd0);
    assign led4_b = led4_on & (round == 2'd1);
    assign led4_r = led4_on & (round == 2'd2);

    assign led5_g = led5_on & (round == 2'd0);
    assign led5_b = led5_on & (round == 2'd1);
    assign led5_r = led5_on & (round == 2'd2);

endmodule
