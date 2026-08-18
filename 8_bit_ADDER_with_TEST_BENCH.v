//1 BIT ADDER 


module o_b (a,b,cin,sum,carry);
    input a ,b ,cin ;
    output carry , sum ;
    assign sum = a^b^cin ;
    assign carry = (a&b) | (b&cin) | (a&cin);
endmodule 



// 8 BIT ADDER 

module e_b (a,b,cin,sum,carry);
    input [7:0] a ;
    input [7:0] b ;
    input cin ;
    output [7:0] sum ;
    output carry ;
    wire [6:0] c_o ;

    o_b h1 (a[0],b[0],cin,sum[0],c_o[0]);
     o_b h2 (a[1],b[1],c_o[0],sum[1],c_o[1]);
       o_b h3 (a[2],b[2],c_o[1],sum[2],c_o[2]);
         o_b h4 (a[3],b[3],c_o[2],sum[3],c_o[3]);
           o_b h5 (a[4],b[4],c_o[3],sum[4],c_o[4]);
             o_b h6 (a[5],b[5],c_o[4],sum[5],c_o[5]);
               o_b h7 (a[6],b[6],c_o[5],sum[6],c_o[6]);
                 o_b h8 (a[7],b[7],c_o[6],sum[7],carry);
endmodule 
      


    	/*  generation and won't be available during simulation
	genvar i;

	// Generate for loop to instantiate N times
	generate
		for (i = 0; i < N; i = i + 1) begin
          ha u0 (a[i], b[i], sum[i], cout[i]);
		end
	endgenerate
endmodule
*/



//TEST BENCH


module tb ;
    reg [7:0] a ,b ;
    reg cin ;
    wire [7:0] sum ;
    wire carry ;
    e_b tba (a,b,cin,sum,carry);
    
    initial begin
        a<= 0 ;
        b <= 0 ;
        cin <= 0 ;
    end

    initial begin 
        #5
        a = 5 ;
        b = 10 ;
        cin = ~ cin ;

           #10
        a = 6 ;
        b = 0 ;
        cin = ~ cin ;
           #5
        a = 4 ;
        b = 8 ;
        cin = ~ cin ;
           #5
        a = 9 ;
        b = 2 ;
        cin = ~ cin ;
           #5
        a = 6 ;
        b =6 ;
        cin = ~ cin ;
        
        
    end
endmodule 


