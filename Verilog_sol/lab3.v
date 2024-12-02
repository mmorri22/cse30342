module lab3( a, b, c, d, e, f, y );

	input a, b, c, d, e, f;
	output y;
	
	supply1 vdd; // supply1 is the Vdd 
	supply0 gnd; // supply0 is ground 

	// Wires 
	wire net_0, net_1, net_2, net_3, net_4;
	
	// Transistors
	pmos pa( net_0, vdd, a );
	pmos pb( y, net_0, b );
	pmos pc( net_1, vdd, c );
	pmos pd( net_1, vdd, d );
	pmos pe( y, net_1, e );
	pmos pf( y, net_1, f );

	nmos na( y, net_4, a );
	nmos nb( y, net_4, b );
	nmos nc( net_4, net_2, c );
	nmos nd( net_2, gnd, d );
	nmos ne( net_4, net_3, e );
	nmos nf( net_3, gnd, f );
	
endmodule