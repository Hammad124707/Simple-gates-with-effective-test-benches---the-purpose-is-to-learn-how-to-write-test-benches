module sipo (clk,reset,enable,data_in,data_out);

input clk,reset,enable,data_in ;
output reg [3:0] data_out = 1 ;
reg [3:0] temp =0;
reg start_up =0;
reg  [2:0] count=0 ;

always@(posedge clk) begin
    if(reset) begin
        temp<= 0 ;
        start_up <=0 ;
        count <= 0 ;
        data_out <= 0 ;
    end

    else if(!start_up) begin
        if(enable) begin
            count <= count + 1 ;
            if(count == 4) begin
                start_up <= 1 ;
                count<= 0 ;
            end
    end
end
    else if (enable) begin
        if(count == 4) begin
            data_out <= temp ;
            count <=0 ;
            temp <= 0 ;
        end
        else begin 
            temp[count] <= data_in ;
            count <= count +1 ;

        end
    end
end
endmodule




//TEST BENCH


`timescale 1ns/1ps
module tb ;
    reg clk,reset,en,data_in ;
    wire [3:0]data_out ;

    sipo asd (clk,reset,en,data_in,data_out);
    initial begin
        clk = 1 ;
        reset =0 ;
        en = 0 ;
        data_in = 0 ;
    end

    always #5 clk = ~ clk ;

    initial begin
        #1 reset = 1 ;
        #10 reset = 0 ;
        en = 1;
        #60 ;
        data_in = 1;
        #10 ;
        data_in = 1 ;
        #10 ;
        data_in = 0 ;
          #10 ;
        data_in = 1 ;
        #10 ;
        data_in = 0 ;
          #10 ;
        data_in = 1 ;
        #10 ;
        data_in = 0 ;
          #10 ;
        data_in = 1 ;
        #10 ;
        data_in = 0 ;
          #10 ;
        data_in = 1 ;
        #10 ;
        data_in = 0 ;
        #10 $finish ;

    end
endmodule 




