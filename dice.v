module dice_roller (
    input  wire clk,        
    input  wire reset,     
    input  wire roll_btn,   
    output wire [3:0] led,  
    output wire led4_r,
    output wire led4_g,
    output wire led4_b,
    output wire led5_r,
    output wire led5_g,
    output wire led5_b
);

 
    assign led4_r = 1'b0;
    assign led4_b = 1'b0;
    assign led5_r = 1'b0;
    assign led5_b = 1'b0;

  
    reg [2:0] rand_cnt;

    always @(posedge clk or posedge reset) begin
        if (reset)
            rand_cnt <= 3'd0;
        else if (rand_cnt == 3'd5)
            rand_cnt <= 3'd0;
        else
            rand_cnt <= rand_cnt + 1'b1;
    end

   
    reg btn_d1, btn_d2;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            btn_d1 <= 1'b0;
            btn_d2 <= 1'b0;
        end else begin
            btn_d1 <= roll_btn;
            btn_d2 <= btn_d1;
        end
    end
    wire roll_pulse = btn_d1 & ~btn_d2;

   
    reg [2:0] dice_value;
    always @(posedge clk or posedge reset) begin
        if (reset)
            dice_value <= 3'd1;             
        else if (roll_pulse)
            dice_value <= rand_cnt + 3'd1;  
    end

   
    wire [5:0] leds_all;
    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : gen_leds
            assign leds_all[i] = (i < dice_value);
        end
    endgenerate

    assign led[0] = leds_all[0];
    assign led[1] = leds_all[1];
    assign led[2] = leds_all[2];
    assign led[3] = leds_all[3];
    assign led4_g = leds_all[4];
    assign led5_g = leds_all[5];

endmodule
