module lab3_Driver;

	wire a, b, c, d, e, f, y;
	
	// Generate the Stimulus 
	lab3_Stim stim(a, b, c, d, e, f);
	
	// Test the circuit using the stimulus 
	lab3 n0(a, b, c, d, e, f, y);

	initial begin
		// Will print the values out at the bottom of the Simulation
		$monitor ("@ time=%d A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, Y=%b", $time, a, b, c, d, e, f, y);
	end 
	
endmodule
