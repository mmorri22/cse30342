/**********************************************
*	Module name: nand_Driver
*	Pre-Conditions: none
*	Post-Conditions: none
*	
*	This is the main driver function for generating
*	stimulus and simulating the NAND gate.
*********************************************/ 
module nand2_Driver;

	wire A, B, Y;
	
	// Generate the Stimulus 
	nand2_Stim stim(A,B);
	
	// Test the circuit using the stimulus 
	nand2 n0(A,B,Y);

	initial begin
		// Will print the values out at the bottom of the Simulation
		$monitor ("@ time=%d A=%b, B=%b, Y=%b", $time, A, B, Y);
	end 
	
endmodule
