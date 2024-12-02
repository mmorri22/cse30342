module lab3_Stim(a, b, c, d, e, f); 

	output a, b, c, d, e, f;

    parameter delay = 100;

    // Used for creating six-input binary test 
    reg [5:0] cnt;

    //initial begin
        //cnt = 0;
        // repeat (64) means do the function 64 times
        // Similar: for(i=0; i < 64; i++) 
		//repeat (64) begin
			//#delay cnt=cnt+1;
        //end
    //end
	
    initial begin
        cnt = 63;
        // repeat (64) means do the function 64 times
        // Similar: for(i=63; i >= 0; i--) 
		repeat (64) begin
			#delay cnt=cnt-1;
        end
    end

    // Automaticaly convert 'cnt' this to binary
    // 0 -> A = '0', B = '0'
    // 1 -> A = '0', B = '1'... and so on. 
    assign {a,b,c,d,e,f} = cnt;

endmodule