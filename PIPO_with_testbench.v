//TEST BENCH


module tb;
    reg clk,rst,en ;
    wire [3:0] data_out ;
    reg [3:0] data_in ;
    code abc (clk,rst,en,data_in,data_out);

    initial 
        begin
            clk = 1;
            rst = 0 ;
            en =0 ;
            data_in = 0 ;
        end

        always #5 clk = ~ clk ;

        initial begin
            #1 ;
            rst =1 ;
            #10 rst = 0 ;
            en = 1 ;
            #7 ;
            data_in = 13 ;
            #23 ;
            data_in = 9 ;
            #30 ;
            data_in = 2 ;
            #13 ;
            data_in = 10 ;
            #25 ;
            $finish ;

        end    

    endmodule ;




//code

module code (clk , rst, en,data_in,data_out );
    input clk,rst,en ;
    input [3:0] data_in ;
    output reg  [3:0] data_out  = 0;

    always@(posedge clk ) begin
        if(rst) begin
            data_out <= 0 ;
        end            
        else if(en) begin
            data_out <= data_in ;
            
        end
        
    end
endmodule
 

