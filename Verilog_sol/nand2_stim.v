/**********************************************
*    Module name: NAND2_Stim
*    Pre-Conditions: none
*    Post-Conditions: A, B
*    
*    This function generates binary values to
*    stimulate the 2-input NAND gate
*********************************************/ 
module nand2_Stim(A, B); 

	output A, B;

    parameter delay = 100;

    // Used for creating two-input binary test 
    reg [1:0] cnt;

    initial begin
        cnt = 0;
        // repeat (3) means do the function 4 times
        // Similar: for(i=0; i < 4; i++) 
		repeat (3) begin
			#delay cnt=cnt+1;
        end
    end

    // Automaticaly convert 'cnt' this to binary
    // 0 -> A = '0', B = '0'
    // 1 -> A = '0', B = '1'... and so on. 
    assign {A,B} = cnt;

endmodule