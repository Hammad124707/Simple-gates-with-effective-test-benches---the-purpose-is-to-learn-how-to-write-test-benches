module flipflop(D,Q,clk,reset,set,asrst,next_state);
  /*this flopflop has asyncronous reset , syncronous set
   and syncronous reset

  

  */
  input D , clk,reset,set,asrst ;
  output reg Q ;
  output reg next_state ;
  
  always@(posedge clk or negedge asrst) begin 

    if(!asrst)
        Q <= 0 ;
    else
         Q<= next_state ;

  end

  always@(D)
    begin
        if(set)
            next_state = 1 ;
        else if(reset)
            next_state = 0 ;
        else 
            next_state = D ;

            
    end
  
  
endmodule 





//testbench

module tb ;
  
  wire Q ,next_state;
  reg clk,D,reset ,set,asrst;
  
  flipflop abc(D,Q,clk,reset,set,asrst) ;
  
  initial begin
    clk = 0 ;
    D = 1 ;
    asrst = 0 ;

  end
  
  always #10 clk = ~ clk ;
  
  
  always begin
    #3  D = 0 ;
    #10 D = 0 ;
    #10 D =1 ;
    #9 set = 1 ;
    # 3 asrst = 0 ;
    #5 D = 0 ;
    #2 asrst = 1 ;
    #8 D = 1 ;
  end
endmodule
    
    

