module lab3_Driver;

	wire A, B, C, D, E, F, Y;
	
	// Generate the Stimulus 
	lab3_Stim stim(A, B, C, D, E, F);
	
	// Test the circuit using the stimulus 
	lab3 n0(A, B, C, D, E, F, Y);

	initial begin
		// Will print the values out at the bottom of the Simulation
		$monitor ("@ time=%d A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, Y=%b", $time, A, B, C, D, E, F, Y);
	end 
	
endmodule
