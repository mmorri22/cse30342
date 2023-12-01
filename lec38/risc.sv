module multiplexor
#(
  parameter WIDTH=5
 )
 (
  input  wire             sel  ,
  input  wire [WIDTH-1:0] in0  ,
  input  wire [WIDTH-1:0] in1  ,
  output reg  [WIDTH-1:0] mux_out
 );

  always @*
    if ( sel )
      mux_out = in1 ;
    else
      mux_out = in0 ;

endmodule


module driver
#(
  parameter WIDTH=8
 )
 (
  input  wire             data_en ,
  input  wire [WIDTH-1:0] data_in ,
  output wire [WIDTH-1:0] data_out 
 );
  assign data_out = data_en ? data_in : 'bz;
endmodule


module alu
#(
  parameter WIDTH=8
 )
 (
  input  wire [      2:0] opcode    ,
  input  wire [WIDTH-1:0] in_a      ,
  input  wire [WIDTH-1:0] in_b      ,
  output reg              a_is_zero ,
  output reg  [WIDTH-1:0] alu_out    
 );

  localparam PASS0=0, PASS1=1, ADD=2, AND=3, XOR=4, PASSB=5, PASS6=6, PASS7=7;

  always @*
    begin
      a_is_zero = (in_a == 0);
      if ( opcode == ADD   ) alu_out = in_a + in_b; else
      if ( opcode == AND   ) alu_out = in_a & in_b; else
      if ( opcode == XOR   ) alu_out = in_a ^ in_b; else
      if ( opcode == PASSB ) alu_out = in_b ; else
                             alu_out = in_a ;
    end

endmodule


module controller
(
  input  wire [2:0] opcode ,
  input  wire [2:0] phase  ,
  input  wire       zero   , // accumulator is zero
  output reg        sel    , // select instruction address to memory
  output reg        rd     , // enable memory output onto data bus
  output reg        ld_ir  , // load instruction register
  output reg        inc_pc , // increment program counter
  output reg        halt   , // halt machine
  output reg        ld_pc  , // load program counter
  output reg        data_e , // enable accumulator output onto data bus
  output reg        ld_ac  , // load accumulator from data bus
  output reg        wr       // write data bus to memory
);

  localparam integer HLT=0, SKZ=1, ADD=2, AND=3, XOR=4, LDA=5, STO=6, JMP=7;

  reg H,A,Z,J,S;

  always @* begin
      H = (opcode == HLT);
      A = (opcode == ADD || opcode == AND || opcode == XOR || opcode == LDA);
      Z = (opcode == SKZ && zero);
      J = (opcode == JMP);
      S = (opcode == STO);
      case ( phase )
  0:begin sel=1;rd=0;ld_ir=0;inc_pc=0;halt=0;ld_pc=0;data_e=0;ld_ac=0;wr=0;end
  1:begin sel=1;rd=1;ld_ir=0;inc_pc=0;halt=0;ld_pc=0;data_e=0;ld_ac=0;wr=0;end
  2:begin sel=1;rd=1;ld_ir=1;inc_pc=0;halt=0;ld_pc=0;data_e=0;ld_ac=0;wr=0;end
  3:begin sel=1;rd=1;ld_ir=1;inc_pc=0;halt=0;ld_pc=0;data_e=0;ld_ac=0;wr=0;end
  4:begin sel=0;rd=0;ld_ir=0;inc_pc=1;halt=H;ld_pc=0;data_e=0;ld_ac=0;wr=0;end
  5:begin sel=0;rd=A;ld_ir=0;inc_pc=0;halt=0;ld_pc=0;data_e=0;ld_ac=0;wr=0;end
  6:begin sel=0;rd=A;ld_ir=0;inc_pc=Z;halt=0;ld_pc=J;data_e=S;ld_ac=0;wr=0;end
  7:begin sel=0;rd=A;ld_ir=0;inc_pc=0;halt=0;ld_pc=J;data_e=S;ld_ac=A;wr=S;end
      endcase
    end
endmodule


module memory
#(
  parameter integer AWIDTH=5,
  parameter integer DWIDTH=8
 )
 (
  input  wire              clk  ,
  input  wire              wr   ,
  input  wire              rd   ,
  input  wire [AWIDTH-1:0] addr ,
  inout  wire [DWIDTH-1:0] data  
 );
  reg [DWIDTH-1:0] array [0:2**AWIDTH-1];
  always @(posedge clk)
    if ( wr ) array[addr] = data;
  assign data = rd ? array[addr] : 'bz;
endmodule


module register
#(
  parameter integer WIDTH=8
 )
 (
  input  wire clk  ,
  input  wire rst  ,
  input  wire load ,
  input  wire [WIDTH-1:0] data_in,
  output reg  [WIDTH-1:0] data_out
 );
  always @(posedge clk)
    if ( rst  ) data_out <= 0; else
    if ( load ) data_out <= data_in;
endmodule


module counter
#(
  parameter integer WIDTH=5
 )
 (
  input  wire clk  ,
  input  wire rst  ,
  input  wire load ,
  input  wire enab ,
  input  wire [WIDTH-1:0] cnt_in ,
  output reg  [WIDTH-1:0] cnt_out 
 );

  reg [WIDTH-1:0] cnt_tmp;

  always @*
    if ( rst  ) cnt_tmp = 0; else
    if ( load ) cnt_tmp = cnt_in; else
    if ( enab ) cnt_tmp = cnt_out + 1; else
                cnt_tmp = cnt_out;

  always @(posedge clk)
    cnt_out <= cnt_tmp;

endmodule


module risc
(
  input  wire clk,
  input  wire rst,
  output wire halt
);

  localparam integer AWIDTH=5, DWIDTH=8 ;


  /////////////////////
  // CLOCK GENERATOR //
  /////////////////////

  wire [2:0] phase ;

  counter
  #(
    .WIDTH   ( 3  ) 
   )
    counter_clk
   (
    .clk     ( clk   ),
    .rst     ( rst   ),
    .load    ( 1'b0  ),
    .enab    ( !halt ),
    .cnt_in  ( 3'b0  ),
    .cnt_out ( phase ) 
   ) ;


  ////////////////
  // CONTROLLER //
  ////////////////

  wire [2:0] opcode ;

  controller controller_inst
  (
    .opcode  ( opcode ), // operation code
    .phase   ( phase  ), // instruction phase
    .zero    ( zero   ), // accumulator is zero
    .sel     ( sel    ), // select instruction address to memory
    .rd      ( rd     ), // enable memory output onto data bus
    .ld_ir   ( ld_ir  ), // load instruction register
    .inc_pc  ( inc_pc ), // increment program counter
    .halt    ( halt   ), // halt machine
    .ld_pc   ( ld_pc  ), // load program counter
    .data_e  ( data_e ), // enable accumulator output onto data bus
    .ld_ac   ( ld_ac  ), // load accumulator from data bus
    .wr      ( wr     )  // write data bus to memory
  ) ;


  /////////////////////
  // PROGRAM COUNTER //
  /////////////////////

  wire [AWIDTH-1:0] ir_addr, pc_addr ;

  counter
  #(
    .WIDTH   ( AWIDTH  ) 
   )
    counter_pc
   (
    .clk     ( clk     ),
    .rst     ( rst     ),
    .load    ( ld_pc   ),
    .enab    ( inc_pc  ),
    .cnt_in  ( ir_addr ),
    .cnt_out ( pc_addr ) 
   ) ;


  /////////////////////
  // ADDESS SELECTOR //
  /////////////////////

  wire [AWIDTH-1:0] addr ;

  multiplexor
  #(
    .WIDTH   ( AWIDTH  ) 
   )
    address_mux
   (
    .sel     ( sel     ),
    .in0     ( ir_addr ),
    .in1     ( pc_addr ),
    .mux_out ( addr    ) 
   ) ;


  /////////////////////////
  // DATA/PROGRAM MEMORY //
  /////////////////////////

  wire [DWIDTH-1:0] data ;

  memory
  #(
    .AWIDTH ( AWIDTH ),
    .DWIDTH ( DWIDTH ) 
   )
    memory_inst
   (
    .clk    ( clk    ),
    .wr     ( wr     ),
    .rd     ( rd     ),
    .addr   ( addr   ),
    .data   ( data   ) 
   ) ;


  //////////////////////////
  // INSTRUCTION REGISTER //
  //////////////////////////

  register
  #(
    .WIDTH    ( DWIDTH ) 
   )
    register_ir
   (
    .clk      ( clk    ),
    .rst      ( rst    ),
    .load     ( ld_ir  ),
    .data_in  ( data   ),
    .data_out ( {opcode,ir_addr} )
   ) ;


  ////////////////////////
  // ARITHMETIC & LOGIC //
  ////////////////////////

  wire [DWIDTH-1:0] acc_out, alu_out ;

  alu
  #(
    .WIDTH     ( DWIDTH ) 
   )
    alu_inst
   (
    .opcode    ( opcode  ),
    .in_a      ( acc_out ),
    .in_b      ( data    ),
    .a_is_zero ( zero    ),
    .alu_out   ( alu_out ) 
   ) ;


  //////////////////////////
  // ACCUMULATOR REGISTER //
  //////////////////////////

  register
  #(
    .WIDTH    ( DWIDTH  ) 
   )
    register_ac
   (
    .clk      ( clk     ),
    .rst      ( rst     ),
    .load     ( ld_ac   ),
    .data_in  ( alu_out ),
    .data_out ( acc_out ) 
   ) ;


  //////////////////////////
  // BUS DRIVER           //
  //////////////////////////

  driver
  #(
    .WIDTH    ( DWIDTH  ) 
   )
    driver_inst
   (
    .data_en  ( data_e  ),
    .data_in  ( alu_out ),
    .data_out ( data    ) 
   ) ;

endmodule
