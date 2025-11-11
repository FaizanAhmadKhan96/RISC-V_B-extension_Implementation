module ShiftLeft(
  input  [31:0] io_A_in,
  input  [4:0]  io_bits,
  output [31:0] io_A_out
);
  wire [62:0] _GEN_0 = {{31'd0}, io_A_in}; // @[ZbsExt.scala 16:28]
  wire [62:0] A_temp = _GEN_0 << io_bits; // @[ZbsExt.scala 16:28]
  assign io_A_out = A_temp[31:0]; // @[ZbsExt.scala 18:15]
endmodule
module ShiftRight(
  input  [31:0] io_A_in,
  input  [4:0]  io_bits,
  output [31:0] io_A_out
);
  assign io_A_out = io_A_in >> io_bits; // @[ZbsExt.scala 29:28]
endmodule
module InvertBits(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  assign io_A_out = ~io_A_in; // @[ZbsExt.scala 41:20]
endmodule
module ANDBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_and
);
  assign io_and = io_A_in & io_B_in; // @[ZbsExt.scala 54:30]
endmodule
module ORBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_or
);
  assign io_or = io_A_in | io_B_in; // @[ZbsExt.scala 67:29]
endmodule
module XORBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_xor
);
  assign io_xor = io_A_in ^ io_B_in; // @[ZbsExt.scala 80:30]
endmodule
module Zbs(
  input         clock,
  input         reset,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [2:0]  io_INSTR_SEL,
  output [31:0] io_rd
);
  wire [31:0] ShiftL_io_A_in; // @[ZbsExt.scala 96:22]
  wire [4:0] ShiftL_io_bits; // @[ZbsExt.scala 96:22]
  wire [31:0] ShiftL_io_A_out; // @[ZbsExt.scala 96:22]
  wire [31:0] ShiftR_io_A_in; // @[ZbsExt.scala 98:22]
  wire [4:0] ShiftR_io_bits; // @[ZbsExt.scala 98:22]
  wire [31:0] ShiftR_io_A_out; // @[ZbsExt.scala 98:22]
  wire [31:0] Invert_io_A_in; // @[ZbsExt.scala 100:22]
  wire [31:0] Invert_io_A_out; // @[ZbsExt.scala 100:22]
  wire [31:0] AND_io_A_in; // @[ZbsExt.scala 102:19]
  wire [31:0] AND_io_B_in; // @[ZbsExt.scala 102:19]
  wire [31:0] AND_io_and; // @[ZbsExt.scala 102:19]
  wire [31:0] OR_io_A_in; // @[ZbsExt.scala 104:18]
  wire [31:0] OR_io_B_in; // @[ZbsExt.scala 104:18]
  wire [31:0] OR_io_or; // @[ZbsExt.scala 104:18]
  wire [31:0] XOR_io_A_in; // @[ZbsExt.scala 106:19]
  wire [31:0] XOR_io_B_in; // @[ZbsExt.scala 106:19]
  wire [31:0] XOR_io_xor; // @[ZbsExt.scala 106:19]
  wire [4:0] shamt = io_rs2[4:0]; // @[ZbsExt.scala 111:18]
  wire [4:0] _GEN_1 = 3'h7 == io_INSTR_SEL ? shamt : 5'h0; // @[ZbsExt.scala 114:18 132:24 204:22]
  wire [31:0] _GEN_2 = 3'h7 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbsExt.scala 124:14 132:24 206:18]
  wire [31:0] _GEN_3 = 3'h7 == io_INSTR_SEL ? ShiftL_io_A_out : 32'h0; // @[ZbsExt.scala 125:14 132:24 207:18]
  wire [31:0] _GEN_4 = 3'h7 == io_INSTR_SEL ? OR_io_or : 32'h0; // @[ZbsExt.scala 132:24 209:10]
  wire  _GEN_5 = 3'h6 == io_INSTR_SEL | 3'h7 == io_INSTR_SEL; // @[ZbsExt.scala 132:24 193:22]
  wire [4:0] _GEN_6 = 3'h6 == io_INSTR_SEL ? shamt : _GEN_1; // @[ZbsExt.scala 132:24 194:22]
  wire [31:0] _GEN_7 = 3'h6 == io_INSTR_SEL ? io_rs1 : _GEN_2; // @[ZbsExt.scala 132:24 196:18]
  wire [31:0] _GEN_8 = 3'h6 == io_INSTR_SEL ? ShiftL_io_A_out : _GEN_3; // @[ZbsExt.scala 132:24 197:18]
  wire [31:0] _GEN_9 = 3'h6 == io_INSTR_SEL ? OR_io_or : _GEN_4; // @[ZbsExt.scala 132:24 199:10]
  wire  _GEN_10 = 3'h5 == io_INSTR_SEL | _GEN_5; // @[ZbsExt.scala 132:24 184:22]
  wire [4:0] _GEN_11 = 3'h5 == io_INSTR_SEL ? shamt : _GEN_6; // @[ZbsExt.scala 132:24 185:22]
  wire [31:0] _GEN_12 = 3'h5 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbsExt.scala 127:15 132:24 187:19]
  wire [31:0] _GEN_13 = 3'h5 == io_INSTR_SEL ? ShiftL_io_A_out : 32'h0; // @[ZbsExt.scala 128:15 132:24 188:19]
  wire [31:0] _GEN_14 = 3'h5 == io_INSTR_SEL ? XOR_io_xor : _GEN_9; // @[ZbsExt.scala 132:24 190:10]
  wire [31:0] _GEN_15 = 3'h5 == io_INSTR_SEL ? 32'h0 : _GEN_7; // @[ZbsExt.scala 124:14 132:24]
  wire [31:0] _GEN_16 = 3'h5 == io_INSTR_SEL ? 32'h0 : _GEN_8; // @[ZbsExt.scala 125:14 132:24]
  wire  _GEN_17 = 3'h4 == io_INSTR_SEL | _GEN_10; // @[ZbsExt.scala 132:24 174:22]
  wire [4:0] _GEN_18 = 3'h4 == io_INSTR_SEL ? shamt : _GEN_11; // @[ZbsExt.scala 132:24 175:22]
  wire [31:0] _GEN_19 = 3'h4 == io_INSTR_SEL ? io_rs1 : _GEN_12; // @[ZbsExt.scala 132:24 177:19]
  wire [31:0] _GEN_20 = 3'h4 == io_INSTR_SEL ? ShiftL_io_A_out : _GEN_13; // @[ZbsExt.scala 132:24 178:19]
  wire [31:0] _GEN_21 = 3'h4 == io_INSTR_SEL ? XOR_io_xor : _GEN_14; // @[ZbsExt.scala 132:24 180:10]
  wire [31:0] _GEN_22 = 3'h4 == io_INSTR_SEL ? 32'h0 : _GEN_15; // @[ZbsExt.scala 124:14 132:24]
  wire [31:0] _GEN_23 = 3'h4 == io_INSTR_SEL ? 32'h0 : _GEN_16; // @[ZbsExt.scala 125:14 132:24]
  wire [31:0] _GEN_24 = 3'h3 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbsExt.scala 116:18 132:24 166:22]
  wire [4:0] _GEN_25 = 3'h3 == io_INSTR_SEL ? shamt : 5'h0; // @[ZbsExt.scala 117:18 132:24 167:22]
  wire [31:0] _GEN_26 = 3'h3 == io_INSTR_SEL ? ShiftR_io_A_out : 32'h0; // @[ZbsExt.scala 121:15 132:24 169:19]
  wire [31:0] _GEN_28 = 3'h3 == io_INSTR_SEL ? AND_io_and : _GEN_21; // @[ZbsExt.scala 132:24 171:10]
  wire  _GEN_29 = 3'h3 == io_INSTR_SEL ? 1'h0 : _GEN_17; // @[ZbsExt.scala 113:18 132:24]
  wire [4:0] _GEN_30 = 3'h3 == io_INSTR_SEL ? 5'h0 : _GEN_18; // @[ZbsExt.scala 114:18 132:24]
  wire [31:0] _GEN_31 = 3'h3 == io_INSTR_SEL ? 32'h0 : _GEN_19; // @[ZbsExt.scala 127:15 132:24]
  wire [31:0] _GEN_32 = 3'h3 == io_INSTR_SEL ? 32'h0 : _GEN_20; // @[ZbsExt.scala 128:15 132:24]
  wire [31:0] _GEN_33 = 3'h3 == io_INSTR_SEL ? 32'h0 : _GEN_22; // @[ZbsExt.scala 124:14 132:24]
  wire [31:0] _GEN_34 = 3'h3 == io_INSTR_SEL ? 32'h0 : _GEN_23; // @[ZbsExt.scala 125:14 132:24]
  wire [31:0] _GEN_35 = 3'h2 == io_INSTR_SEL ? io_rs1 : _GEN_24; // @[ZbsExt.scala 132:24 156:22]
  wire [4:0] _GEN_36 = 3'h2 == io_INSTR_SEL ? shamt : _GEN_25; // @[ZbsExt.scala 132:24 157:22]
  wire [31:0] _GEN_37 = 3'h2 == io_INSTR_SEL ? ShiftR_io_A_out : _GEN_26; // @[ZbsExt.scala 132:24 159:19]
  wire  _GEN_38 = 3'h2 == io_INSTR_SEL | 3'h3 == io_INSTR_SEL; // @[ZbsExt.scala 132:24 160:19]
  wire [31:0] _GEN_39 = 3'h2 == io_INSTR_SEL ? AND_io_and : _GEN_28; // @[ZbsExt.scala 132:24 162:10]
  wire  _GEN_40 = 3'h2 == io_INSTR_SEL ? 1'h0 : _GEN_29; // @[ZbsExt.scala 113:18 132:24]
  wire [4:0] _GEN_41 = 3'h2 == io_INSTR_SEL ? 5'h0 : _GEN_30; // @[ZbsExt.scala 114:18 132:24]
  wire [31:0] _GEN_42 = 3'h2 == io_INSTR_SEL ? 32'h0 : _GEN_31; // @[ZbsExt.scala 127:15 132:24]
  wire [31:0] _GEN_43 = 3'h2 == io_INSTR_SEL ? 32'h0 : _GEN_32; // @[ZbsExt.scala 128:15 132:24]
  wire [31:0] _GEN_44 = 3'h2 == io_INSTR_SEL ? 32'h0 : _GEN_33; // @[ZbsExt.scala 124:14 132:24]
  wire [31:0] _GEN_45 = 3'h2 == io_INSTR_SEL ? 32'h0 : _GEN_34; // @[ZbsExt.scala 125:14 132:24]
  wire  _GEN_46 = 3'h1 == io_INSTR_SEL | _GEN_40; // @[ZbsExt.scala 132:24 146:22]
  wire [4:0] _GEN_47 = 3'h1 == io_INSTR_SEL ? shamt : _GEN_41; // @[ZbsExt.scala 132:24 147:22]
  wire [31:0] _GEN_48 = 3'h1 == io_INSTR_SEL ? ShiftL_io_A_out : 32'h0; // @[ZbsExt.scala 119:18 132:24 149:22]
  wire [31:0] _GEN_49 = 3'h1 == io_INSTR_SEL ? io_rs1 : _GEN_37; // @[ZbsExt.scala 132:24 151:19]
  wire [31:0] _GEN_50 = 3'h1 == io_INSTR_SEL ? Invert_io_A_out : {{31'd0}, _GEN_38}; // @[ZbsExt.scala 132:24 152:19]
  wire [31:0] _GEN_51 = 3'h1 == io_INSTR_SEL ? AND_io_and : _GEN_39; // @[ZbsExt.scala 132:24 153:10]
  wire [31:0] _GEN_52 = 3'h1 == io_INSTR_SEL ? 32'h0 : _GEN_35; // @[ZbsExt.scala 116:18 132:24]
  wire [4:0] _GEN_53 = 3'h1 == io_INSTR_SEL ? 5'h0 : _GEN_36; // @[ZbsExt.scala 117:18 132:24]
  wire [31:0] _GEN_54 = 3'h1 == io_INSTR_SEL ? 32'h0 : _GEN_42; // @[ZbsExt.scala 127:15 132:24]
  wire [31:0] _GEN_55 = 3'h1 == io_INSTR_SEL ? 32'h0 : _GEN_43; // @[ZbsExt.scala 128:15 132:24]
  wire [31:0] _GEN_56 = 3'h1 == io_INSTR_SEL ? 32'h0 : _GEN_44; // @[ZbsExt.scala 124:14 132:24]
  wire [31:0] _GEN_57 = 3'h1 == io_INSTR_SEL ? 32'h0 : _GEN_45; // @[ZbsExt.scala 125:14 132:24]
  wire  _GEN_58 = 3'h0 == io_INSTR_SEL | _GEN_46; // @[ZbsExt.scala 132:24 134:22]
  ShiftLeft ShiftL ( // @[ZbsExt.scala 96:22]
    .io_A_in(ShiftL_io_A_in),
    .io_bits(ShiftL_io_bits),
    .io_A_out(ShiftL_io_A_out)
  );
  ShiftRight ShiftR ( // @[ZbsExt.scala 98:22]
    .io_A_in(ShiftR_io_A_in),
    .io_bits(ShiftR_io_bits),
    .io_A_out(ShiftR_io_A_out)
  );
  InvertBits Invert ( // @[ZbsExt.scala 100:22]
    .io_A_in(Invert_io_A_in),
    .io_A_out(Invert_io_A_out)
  );
  ANDBits AND ( // @[ZbsExt.scala 102:19]
    .io_A_in(AND_io_A_in),
    .io_B_in(AND_io_B_in),
    .io_and(AND_io_and)
  );
  ORBits OR ( // @[ZbsExt.scala 104:18]
    .io_A_in(OR_io_A_in),
    .io_B_in(OR_io_B_in),
    .io_or(OR_io_or)
  );
  XORBits XOR ( // @[ZbsExt.scala 106:19]
    .io_A_in(XOR_io_A_in),
    .io_B_in(XOR_io_B_in),
    .io_xor(XOR_io_xor)
  );
  assign io_rd = 3'h0 == io_INSTR_SEL ? AND_io_and : _GEN_51; // @[ZbsExt.scala 132:24 142:10]
  assign ShiftL_io_A_in = {{31'd0}, _GEN_58};
  assign ShiftL_io_bits = 3'h0 == io_INSTR_SEL ? shamt : _GEN_47; // @[ZbsExt.scala 132:24 135:22]
  assign ShiftR_io_A_in = 3'h0 == io_INSTR_SEL ? 32'h0 : _GEN_52; // @[ZbsExt.scala 116:18 132:24]
  assign ShiftR_io_bits = 3'h0 == io_INSTR_SEL ? 5'h0 : _GEN_53; // @[ZbsExt.scala 117:18 132:24]
  assign Invert_io_A_in = 3'h0 == io_INSTR_SEL ? ShiftL_io_A_out : _GEN_48; // @[ZbsExt.scala 132:24 137:22]
  assign AND_io_A_in = 3'h0 == io_INSTR_SEL ? io_rs1 : _GEN_49; // @[ZbsExt.scala 132:24 139:19]
  assign AND_io_B_in = 3'h0 == io_INSTR_SEL ? Invert_io_A_out : _GEN_50; // @[ZbsExt.scala 132:24 140:19]
  assign OR_io_A_in = 3'h0 == io_INSTR_SEL ? 32'h0 : _GEN_56; // @[ZbsExt.scala 124:14 132:24]
  assign OR_io_B_in = 3'h0 == io_INSTR_SEL ? 32'h0 : _GEN_57; // @[ZbsExt.scala 125:14 132:24]
  assign XOR_io_A_in = 3'h0 == io_INSTR_SEL ? 32'h0 : _GEN_54; // @[ZbsExt.scala 127:15 132:24]
  assign XOR_io_B_in = 3'h0 == io_INSTR_SEL ? 32'h0 : _GEN_55; // @[ZbsExt.scala 128:15 132:24]
endmodule
