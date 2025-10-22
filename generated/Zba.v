module ShiftLeft(
  input  [31:0] io_A_in,
  input  [4:0]  io_bits,
  output [31:0] io_A_out
);
  wire [62:0] _GEN_0 = {{31'd0}, io_A_in}; // @[ZbaExt.scala 16:28]
  wire [62:0] A_temp = _GEN_0 << io_bits; // @[ZbaExt.scala 16:28]
  assign io_A_out = A_temp[31:0]; // @[ZbaExt.scala 18:15]
endmodule
module Adder(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_sum
);
  assign io_sum = io_A_in + io_B_in; // @[ZbaExt.scala 29:30]
endmodule
module Zba(
  input         clock,
  input         reset,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [1:0]  io_INSTR_SEL,
  output [31:0] io_rd
);
  wire [31:0] shiftL_io_A_in; // @[ZbaExt.scala 42:22]
  wire [4:0] shiftL_io_bits; // @[ZbaExt.scala 42:22]
  wire [31:0] shiftL_io_A_out; // @[ZbaExt.scala 42:22]
  wire [31:0] add_io_A_in; // @[ZbaExt.scala 43:19]
  wire [31:0] add_io_B_in; // @[ZbaExt.scala 43:19]
  wire [31:0] add_io_sum; // @[ZbaExt.scala 43:19]
  wire [31:0] _GEN_0 = 2'h2 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbaExt.scala 45:18 52:24 68:22]
  wire [1:0] _GEN_1 = 2'h2 == io_INSTR_SEL ? 2'h3 : 2'h0; // @[ZbaExt.scala 46:18 52:24 69:22]
  wire [31:0] _GEN_2 = 2'h2 == io_INSTR_SEL ? shiftL_io_A_out : 32'h0; // @[ZbaExt.scala 47:15 52:24 70:19]
  wire [31:0] _GEN_3 = 2'h2 == io_INSTR_SEL ? io_rs2 : 32'h0; // @[ZbaExt.scala 48:15 52:24 71:19]
  wire [31:0] _GEN_4 = 2'h2 == io_INSTR_SEL ? add_io_sum : 32'h0; // @[ZbaExt.scala 52:24 72:10]
  wire [31:0] _GEN_5 = 2'h1 == io_INSTR_SEL ? io_rs1 : _GEN_0; // @[ZbaExt.scala 52:24 61:22]
  wire [1:0] _GEN_6 = 2'h1 == io_INSTR_SEL ? 2'h2 : _GEN_1; // @[ZbaExt.scala 52:24 62:22]
  wire [31:0] _GEN_7 = 2'h1 == io_INSTR_SEL ? shiftL_io_A_out : _GEN_2; // @[ZbaExt.scala 52:24 63:19]
  wire [31:0] _GEN_8 = 2'h1 == io_INSTR_SEL ? io_rs2 : _GEN_3; // @[ZbaExt.scala 52:24 64:19]
  wire [31:0] _GEN_9 = 2'h1 == io_INSTR_SEL ? add_io_sum : _GEN_4; // @[ZbaExt.scala 52:24 65:10]
  wire [1:0] _GEN_11 = 2'h0 == io_INSTR_SEL ? 2'h1 : _GEN_6; // @[ZbaExt.scala 52:24 55:22]
  ShiftLeft shiftL ( // @[ZbaExt.scala 42:22]
    .io_A_in(shiftL_io_A_in),
    .io_bits(shiftL_io_bits),
    .io_A_out(shiftL_io_A_out)
  );
  Adder add ( // @[ZbaExt.scala 43:19]
    .io_A_in(add_io_A_in),
    .io_B_in(add_io_B_in),
    .io_sum(add_io_sum)
  );
  assign io_rd = 2'h0 == io_INSTR_SEL ? add_io_sum : _GEN_9; // @[ZbaExt.scala 52:24 58:10]
  assign shiftL_io_A_in = 2'h0 == io_INSTR_SEL ? io_rs1 : _GEN_5; // @[ZbaExt.scala 52:24 54:22]
  assign shiftL_io_bits = {{3'd0}, _GEN_11};
  assign add_io_A_in = 2'h0 == io_INSTR_SEL ? shiftL_io_A_out : _GEN_7; // @[ZbaExt.scala 52:24 56:19]
  assign add_io_B_in = 2'h0 == io_INSTR_SEL ? io_rs2 : _GEN_8; // @[ZbaExt.scala 52:24 57:19]
endmodule
