//Serial_in_serial_out  code left shift 


// 4 bit siso.
module shift_l (clk,rst,en,data_in,data_out);
    input clk ,rst,en ;
    input data_in ;
    output reg  data_out = 0;
    reg start_up =0 ;
    reg [3:0] temp = 0;
    reg [3:0] count =0 ;

    always@(posedge clk) begin 
        if(rst) begin
            count <= 0;
            start_up <= 0 ;
            
     
            temp <= 0 ;
        end
    
    else if(!start_up) begin
        count <= count + 1;
        if(count == 4)
            start_up <= 1;



    end
    else if (en & start_up) begin
        temp <= temp << 1'b1 ;
        data_out <= temp[3] ;
        temp <= {temp[2:0],data_in} ;


    end
    end
endmodule 




//test_bench

module tb ;
    reg clk,rst,en ,data_in ;
    wire data_out ;
	wire [3:0] temp;  
 
    shift_l abc (clk,rst,en,data_in,data_out);


    initial begin
        clk = 0 ;
        rst = 0 ;
        en = 0 ;
        data_in = 0 ;
    end

        always #2 clk =~ clk ;
    initial  begin
         #35 ;
         rst =1 ;
         #6 ;
         rst = 0 ;
         #10 ;
         en = 1 ;
#8 ;
         data_in = 1;
         #5 ;
         data_in = 0 ;
         #5 ;
         data_in = 1 ;
           #5 ;
         data_in = 0 ;
         #5 ;
         data_in = 0 ;
           #5 ;
         data_in = 0 ;
         #5 ;
         data_in = 1 ;
           #5 ;
         data_in = 1 ;
         #5 ;
         data_in = 1 ;
      #40 ;
      $finish;
    end
endmodule 

        





     











