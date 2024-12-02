module halfadd( input a, b, output sum, carry );

	assign sum = a ^ b;
	assign carry = a & b;

endmodule


module fulladd( input a, b, cin, output sum, cout );

	wire n_sum, n_carry1, n_carry2;
	
	halfadd U1( a, b, n_sum, n_carry1 );
	halfadd U2( n_sum, cin, sum, n_carry2 );
	
	assign cout = n_carry1 | n_carry2;

endmodule