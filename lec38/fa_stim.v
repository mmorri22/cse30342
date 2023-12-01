module fa_Stim(output a, b, cin); 

    parameter delay = 100;

    // Used for creating three-input binary test 
    reg [2:0] cnt;

    initial begin
        cnt = 0;
        // repeat (8) means do the function 8 times
        // Similar: for(i=0; i < 8; i++) 
		repeat (7) begin
			#delay cnt=cnt+1;
        end
    end

    assign {a,b,cin} = cnt;

endmodule