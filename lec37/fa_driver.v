module fa_Driver;

	wire a, b, cin, sum, cout;
	
	// Generate the Stimulus 
	fa_Stim stim(a,b,cin);
	
	// Test the circuit using the stimulus 
	fulladd fa0(a,b,cin,sum,cout);

	initial begin
		// Will print the values out at the bottom of the Simulation
		$monitor ("@ time=%d, a=%b, b=%b, cin=%b, cout=%b, sum=%b", $time, a, b, cin, cout, sum);
	end 
	
endmodule