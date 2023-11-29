module lab3(A, B, C, D, E, F, Y);

	// Initialize Inputs 
	input A, B, C, D, E, F; 
	output Y;

	supply1 vdd; // supply1 is the Vdd 
	supply0 gnd; // supply0 is ground 
	
	wire net_0, net_1, net_2, net_3, net_4, net_5;

	// Format: gate_type individual_gate_name(inputs..., outputs...);
	// For nmos and pmos: (drain, source, gate) 
	nmos nA(Y, net_3, A);
	nmos nB(Y, net_3, B);
	nmos nC(net_3, net_4, C);
	nmos nD(net_4, gnd, D);
	nmos nE(net_3, net_5, E);
	nmos nF(net_5, gnd, F);
	pmos pA(net_0, vdd, A);
	pmos pB(Y, net_0, B);
	pmos pC(net_1, vdd, C); 
	pmos pD(net_1, vdd, D); 
	pmos pE(Y, net_1, E); 
	pmos pF(Y, net_1, F); 
	
endmodule

