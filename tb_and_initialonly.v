module tbi ;
reg i1 , i2 ;
wire o1 ;

a u2 (.i1(i1) , .i2(i2) ,.o1(o1));

initial begin  
i2 = 0 ;
i1 = 0 ;
#10;
i1 = 0 ;
i2 = 1;
#20 ;
i1 = 1 ;
i2 =1 ;
#30;
end
endmodule 
 