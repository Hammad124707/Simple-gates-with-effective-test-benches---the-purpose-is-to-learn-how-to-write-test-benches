module o1_bit_adder (cin,in1,in2,out,cout);
    input cin , in1,in2  ;
    output out,cout ;
     
    assign {cout,out} = in1 + cin + in2 ;
endmodule 


module learning_ge #(
    parameter n = 4
) (
    in1,in2, cin , out , cout 
    
);
    input cin ;
    input [n-1: 0] in1 ;
    input [n-1: 0] in2 ;
    output cout ;
    output [n-1:0] out ;

    wire [n:0] c ;
    assign c[0] = cin ;
    assign cout = c[n];

    genvar k ;

    generate
        for ( k=0 ;k<n ;k = k +1 ) begin
             o1_bit_adder full_1 (.cin(c[k]),
             .in1(in1[k]),
             .in2(in2[k]),

             .out(out[k]),
             .cout(c[k+1])
             );
        
        end
    endgenerate
endmodule




module tb ;
    
    parameter width = 4 ;

    wire cout ;
    wire  [width -1 : 0 ] out ;
    reg cin ;
    reg  [width -1: 0] in1;
    reg [ width-1 :0] in2 ;

    learning_ge #(.n(width)) jj47 (in1,in2 ,cin,out,cout);

    initial begin
        # 5 cin = 1 ;
        in1 = 4'b1110 ;
        in2 = 4'b0101 ;
        #5 in1 = 4'b0111 ;
        in2 = 4'b1000;
        #5 in1 = 4'b0000 ;
        in2 = 4'b1111;

    end


endmodule 






    

