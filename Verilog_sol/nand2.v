module nand2(A, B, Y);
	// Initialize Inputs 
	input A, B;
	output Y;

	supply1 vdd; // supply1 is the Vdd 
	supply0 gnd; // supply0 is ground 
	wire net_2;

	// Format: gate_type individual_gate_name(inputs..., outputs...);
	// For nmos and pmos: (drain, source, gate) 
	nmos n0(Y, net_2, A);
	nmos n1(net_2, gnd, B); 
	pmos p0(Y, vdd, B);
	pmos p1(Y, vdd, A); 
	
endmodule