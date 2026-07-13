module tb ;
reg i1 , i2 ;
wire o1 ;

a u1 (.i1(i1) , .i2(i2) ,.o1(o1));

initial i2= 0 ;

always begin
i1 = 1'b1;
i2 = ~ i2 ;
#10 ;
end

endmodule  


