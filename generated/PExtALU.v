module ShiftLeft(
  input  [31:0] io_A_in,
  input  [4:0]  io_bits,
  output [31:0] io_A_out
);
  wire [62:0] _GEN_0 = {{31'd0}, io_A_in}; // @[RISCVALU.scala 17:28]
  wire [62:0] A_temp = _GEN_0 << io_bits; // @[RISCVALU.scala 17:28]
  assign io_A_out = A_temp[31:0]; // @[RISCVALU.scala 19:24]
endmodule
module Adder(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_sum
);
  assign io_sum = io_A_in + io_B_in; // @[RISCVALU.scala 30:30]
endmodule
module InvertBits(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  assign io_A_out = ~io_A_in; // @[RISCVALU.scala 42:20]
endmodule
module ANDBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_and
);
  assign io_and = io_A_in & io_B_in; // @[RISCVALU.scala 55:30]
endmodule
module ORBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_or
);
  assign io_or = io_A_in | io_B_in; // @[RISCVALU.scala 68:29]
endmodule
module XORBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_xor
);
  assign io_xor = io_A_in ^ io_B_in; // @[RISCVALU.scala 81:30]
endmodule
module CountLeadingZeros(
  input  [31:0] io_A_in,
  output [5:0]  io_A_out
);
  wire [31:0] _GEN_0 = {{16'd0}, io_A_in[31:16]}; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_3 = _GEN_0 & 32'hffff; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_5 = {io_A_in[15:0], 16'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _reversed_T_7 = _reversed_T_5 & 32'hffff0000; // @[Bitwise.scala 108:80]
  wire [31:0] _reversed_T_8 = _reversed_T_3 | _reversed_T_7; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_1 = {{8'd0}, _reversed_T_8[31:8]}; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_13 = _GEN_1 & 32'hff00ff; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_15 = {_reversed_T_8[23:0], 8'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _reversed_T_17 = _reversed_T_15 & 32'hff00ff00; // @[Bitwise.scala 108:80]
  wire [31:0] _reversed_T_18 = _reversed_T_13 | _reversed_T_17; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_2 = {{4'd0}, _reversed_T_18[31:4]}; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_23 = _GEN_2 & 32'hf0f0f0f; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_25 = {_reversed_T_18[27:0], 4'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _reversed_T_27 = _reversed_T_25 & 32'hf0f0f0f0; // @[Bitwise.scala 108:80]
  wire [31:0] _reversed_T_28 = _reversed_T_23 | _reversed_T_27; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_3 = {{2'd0}, _reversed_T_28[31:2]}; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_33 = _GEN_3 & 32'h33333333; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_35 = {_reversed_T_28[29:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _reversed_T_37 = _reversed_T_35 & 32'hcccccccc; // @[Bitwise.scala 108:80]
  wire [31:0] _reversed_T_38 = _reversed_T_33 | _reversed_T_37; // @[Bitwise.scala 108:39]
  wire [31:0] _GEN_4 = {{1'd0}, _reversed_T_38[31:1]}; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_43 = _GEN_4 & 32'h55555555; // @[Bitwise.scala 108:31]
  wire [31:0] _reversed_T_45 = {_reversed_T_38[30:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [31:0] _reversed_T_47 = _reversed_T_45 & 32'haaaaaaaa; // @[Bitwise.scala 108:80]
  wire [31:0] reversed = _reversed_T_43 | _reversed_T_47; // @[Bitwise.scala 108:39]
  wire [4:0] _io_A_out_T_32 = reversed[30] ? 5'h1e : 5'h1f; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_33 = reversed[29] ? 5'h1d : _io_A_out_T_32; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_34 = reversed[28] ? 5'h1c : _io_A_out_T_33; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_35 = reversed[27] ? 5'h1b : _io_A_out_T_34; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_36 = reversed[26] ? 5'h1a : _io_A_out_T_35; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_37 = reversed[25] ? 5'h19 : _io_A_out_T_36; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_38 = reversed[24] ? 5'h18 : _io_A_out_T_37; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_39 = reversed[23] ? 5'h17 : _io_A_out_T_38; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_40 = reversed[22] ? 5'h16 : _io_A_out_T_39; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_41 = reversed[21] ? 5'h15 : _io_A_out_T_40; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_42 = reversed[20] ? 5'h14 : _io_A_out_T_41; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_43 = reversed[19] ? 5'h13 : _io_A_out_T_42; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_44 = reversed[18] ? 5'h12 : _io_A_out_T_43; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_45 = reversed[17] ? 5'h11 : _io_A_out_T_44; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_46 = reversed[16] ? 5'h10 : _io_A_out_T_45; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_47 = reversed[15] ? 5'hf : _io_A_out_T_46; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_48 = reversed[14] ? 5'he : _io_A_out_T_47; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_49 = reversed[13] ? 5'hd : _io_A_out_T_48; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_50 = reversed[12] ? 5'hc : _io_A_out_T_49; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_51 = reversed[11] ? 5'hb : _io_A_out_T_50; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_52 = reversed[10] ? 5'ha : _io_A_out_T_51; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_53 = reversed[9] ? 5'h9 : _io_A_out_T_52; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_54 = reversed[8] ? 5'h8 : _io_A_out_T_53; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_55 = reversed[7] ? 5'h7 : _io_A_out_T_54; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_56 = reversed[6] ? 5'h6 : _io_A_out_T_55; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_57 = reversed[5] ? 5'h5 : _io_A_out_T_56; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_58 = reversed[4] ? 5'h4 : _io_A_out_T_57; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_59 = reversed[3] ? 5'h3 : _io_A_out_T_58; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_60 = reversed[2] ? 5'h2 : _io_A_out_T_59; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_61 = reversed[1] ? 5'h1 : _io_A_out_T_60; // @[Mux.scala 47:70]
  wire [4:0] _io_A_out_T_62 = reversed[0] ? 5'h0 : _io_A_out_T_61; // @[Mux.scala 47:70]
  assign io_A_out = {{1'd0}, _io_A_out_T_62}; // @[RISCVALU.scala 95:12]
endmodule
module PExtALU(
  input         clock,
  input         reset,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [2:0]  io_ALU_SEL,
  input         io_EXT_SEL,
  output [31:0] io_rd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] Shift_io_A_in; // @[RISCVALU.scala 117:21]
  wire [4:0] Shift_io_bits; // @[RISCVALU.scala 117:21]
  wire [31:0] Shift_io_A_out; // @[RISCVALU.scala 117:21]
  wire [31:0] Add_io_A_in; // @[RISCVALU.scala 119:19]
  wire [31:0] Add_io_B_in; // @[RISCVALU.scala 119:19]
  wire [31:0] Add_io_sum; // @[RISCVALU.scala 119:19]
  wire [31:0] Invert_io_A_in; // @[RISCVALU.scala 121:22]
  wire [31:0] Invert_io_A_out; // @[RISCVALU.scala 121:22]
  wire [31:0] AND_io_A_in; // @[RISCVALU.scala 123:19]
  wire [31:0] AND_io_B_in; // @[RISCVALU.scala 123:19]
  wire [31:0] AND_io_and; // @[RISCVALU.scala 123:19]
  wire [31:0] OR_io_A_in; // @[RISCVALU.scala 125:18]
  wire [31:0] OR_io_B_in; // @[RISCVALU.scala 125:18]
  wire [31:0] OR_io_or; // @[RISCVALU.scala 125:18]
  wire [31:0] XOR_io_A_in; // @[RISCVALU.scala 127:19]
  wire [31:0] XOR_io_B_in; // @[RISCVALU.scala 127:19]
  wire [31:0] XOR_io_xor; // @[RISCVALU.scala 127:19]
  wire [31:0] CLZ_io_A_in; // @[RISCVALU.scala 129:19]
  wire [5:0] CLZ_io_A_out; // @[RISCVALU.scala 129:19]
  reg [31:0] RD; // @[RISCVALU.scala 113:15]
  wire [31:0] _GEN_0 = 3'h2 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 133:17 155:24 179:23]
  wire [1:0] _GEN_1 = 3'h2 == io_ALU_SEL ? 2'h3 : 2'h0; // @[RISCVALU.scala 134:17 155:24 180:23]
  wire [31:0] _GEN_2 = 3'h2 == io_ALU_SEL ? Shift_io_A_out : 32'h0; // @[RISCVALU.scala 136:15 155:24 182:21]
  wire [31:0] _GEN_3 = 3'h2 == io_ALU_SEL ? io_rs2 : 32'h0; // @[RISCVALU.scala 137:15 155:24 183:21]
  wire [31:0] _GEN_5 = 3'h1 == io_ALU_SEL ? io_rs1 : _GEN_0; // @[RISCVALU.scala 155:24 169:23]
  wire [1:0] _GEN_6 = 3'h1 == io_ALU_SEL ? 2'h2 : _GEN_1; // @[RISCVALU.scala 155:24 170:23]
  wire [31:0] _GEN_7 = 3'h1 == io_ALU_SEL ? Shift_io_A_out : _GEN_2; // @[RISCVALU.scala 155:24 172:21]
  wire [31:0] _GEN_8 = 3'h1 == io_ALU_SEL ? io_rs2 : _GEN_3; // @[RISCVALU.scala 155:24 173:21]
  wire [31:0] _GEN_10 = 3'h0 == io_ALU_SEL ? io_rs1 : _GEN_5; // @[RISCVALU.scala 155:24 159:23]
  wire [1:0] _GEN_11 = 3'h0 == io_ALU_SEL ? 2'h1 : _GEN_6; // @[RISCVALU.scala 155:24 160:23]
  wire [31:0] _GEN_12 = 3'h0 == io_ALU_SEL ? Shift_io_A_out : _GEN_7; // @[RISCVALU.scala 155:24 162:21]
  wire [31:0] _GEN_13 = 3'h0 == io_ALU_SEL ? io_rs2 : _GEN_8; // @[RISCVALU.scala 155:24 163:21]
  wire [31:0] _GEN_15 = 3'h6 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 150:15 191:23 225:21]
  wire [5:0] _GEN_16 = 3'h6 == io_ALU_SEL ? CLZ_io_A_out : 6'h0; // @[RISCVALU.scala 191:23 226:12 115:6]
  wire [31:0] _GEN_17 = 3'h5 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 147:15 191:23 216:20]
  wire [31:0] _GEN_18 = 3'h5 == io_ALU_SEL ? io_rs2 : 32'h0; // @[RISCVALU.scala 148:15 191:23 217:20]
  wire [31:0] _GEN_19 = 3'h5 == io_ALU_SEL ? XOR_io_xor : 32'h0; // @[RISCVALU.scala 139:18 191:23 219:23]
  wire [31:0] _GEN_20 = 3'h5 == io_ALU_SEL ? Invert_io_A_out : {{26'd0}, _GEN_16}; // @[RISCVALU.scala 191:23 220:11]
  wire [31:0] _GEN_21 = 3'h5 == io_ALU_SEL ? 32'h0 : _GEN_15; // @[RISCVALU.scala 150:15 191:23]
  wire [31:0] _GEN_22 = 3'h4 == io_ALU_SEL ? io_rs2 : _GEN_19; // @[RISCVALU.scala 191:23 206:23]
  wire [31:0] _GEN_23 = 3'h4 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 144:14 191:23 208:19]
  wire [31:0] _GEN_24 = 3'h4 == io_ALU_SEL ? Invert_io_A_out : 32'h0; // @[RISCVALU.scala 145:14 191:23 209:19]
  wire [31:0] _GEN_26 = 3'h4 == io_ALU_SEL ? 32'h0 : _GEN_17; // @[RISCVALU.scala 147:15 191:23]
  wire [31:0] _GEN_27 = 3'h4 == io_ALU_SEL ? 32'h0 : _GEN_18; // @[RISCVALU.scala 148:15 191:23]
  wire [31:0] _GEN_28 = 3'h4 == io_ALU_SEL ? 32'h0 : _GEN_21; // @[RISCVALU.scala 150:15 191:23]
  wire [31:0] _GEN_29 = 3'h3 == io_ALU_SEL ? io_rs2 : _GEN_22; // @[RISCVALU.scala 191:23 197:23]
  wire [31:0] _GEN_30 = 3'h3 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 141:15 191:23 199:20]
  wire [31:0] _GEN_31 = 3'h3 == io_ALU_SEL ? Invert_io_A_out : 32'h0; // @[RISCVALU.scala 142:15 191:23 200:20]
  wire [31:0] _GEN_33 = 3'h3 == io_ALU_SEL ? 32'h0 : _GEN_23; // @[RISCVALU.scala 144:14 191:23]
  wire [31:0] _GEN_34 = 3'h3 == io_ALU_SEL ? 32'h0 : _GEN_24; // @[RISCVALU.scala 145:14 191:23]
  wire [31:0] _GEN_35 = 3'h3 == io_ALU_SEL ? 32'h0 : _GEN_26; // @[RISCVALU.scala 147:15 191:23]
  wire [31:0] _GEN_36 = 3'h3 == io_ALU_SEL ? 32'h0 : _GEN_27; // @[RISCVALU.scala 148:15 191:23]
  wire [31:0] _GEN_37 = 3'h3 == io_ALU_SEL ? 32'h0 : _GEN_28; // @[RISCVALU.scala 150:15 191:23]
  wire [31:0] _GEN_38 = io_EXT_SEL ? _GEN_29 : 32'h0; // @[RISCVALU.scala 139:18 189:42]
  wire [31:0] _GEN_39 = io_EXT_SEL ? _GEN_30 : 32'h0; // @[RISCVALU.scala 141:15 189:42]
  wire [31:0] _GEN_40 = io_EXT_SEL ? _GEN_31 : 32'h0; // @[RISCVALU.scala 142:15 189:42]
  wire [31:0] _GEN_42 = io_EXT_SEL ? _GEN_33 : 32'h0; // @[RISCVALU.scala 144:14 189:42]
  wire [31:0] _GEN_43 = io_EXT_SEL ? _GEN_34 : 32'h0; // @[RISCVALU.scala 145:14 189:42]
  wire [31:0] _GEN_44 = io_EXT_SEL ? _GEN_35 : 32'h0; // @[RISCVALU.scala 147:15 189:42]
  wire [31:0] _GEN_45 = io_EXT_SEL ? _GEN_36 : 32'h0; // @[RISCVALU.scala 148:15 189:42]
  wire [31:0] _GEN_46 = io_EXT_SEL ? _GEN_37 : 32'h0; // @[RISCVALU.scala 150:15 189:42]
  wire [1:0] _GEN_48 = ~io_EXT_SEL ? _GEN_11 : 2'h0; // @[RISCVALU.scala 134:17 153:38]
  ShiftLeft Shift ( // @[RISCVALU.scala 117:21]
    .io_A_in(Shift_io_A_in),
    .io_bits(Shift_io_bits),
    .io_A_out(Shift_io_A_out)
  );
  Adder Add ( // @[RISCVALU.scala 119:19]
    .io_A_in(Add_io_A_in),
    .io_B_in(Add_io_B_in),
    .io_sum(Add_io_sum)
  );
  InvertBits Invert ( // @[RISCVALU.scala 121:22]
    .io_A_in(Invert_io_A_in),
    .io_A_out(Invert_io_A_out)
  );
  ANDBits AND ( // @[RISCVALU.scala 123:19]
    .io_A_in(AND_io_A_in),
    .io_B_in(AND_io_B_in),
    .io_and(AND_io_and)
  );
  ORBits OR ( // @[RISCVALU.scala 125:18]
    .io_A_in(OR_io_A_in),
    .io_B_in(OR_io_B_in),
    .io_or(OR_io_or)
  );
  XORBits XOR ( // @[RISCVALU.scala 127:19]
    .io_A_in(XOR_io_A_in),
    .io_B_in(XOR_io_B_in),
    .io_xor(XOR_io_xor)
  );
  CountLeadingZeros CLZ ( // @[RISCVALU.scala 129:19]
    .io_A_in(CLZ_io_A_in),
    .io_A_out(CLZ_io_A_out)
  );
  assign io_rd = RD; // @[RISCVALU.scala 231:9]
  assign Shift_io_A_in = ~io_EXT_SEL ? _GEN_10 : 32'h0; // @[RISCVALU.scala 133:17 153:38]
  assign Shift_io_bits = {{3'd0}, _GEN_48};
  assign Add_io_A_in = ~io_EXT_SEL ? _GEN_12 : 32'h0; // @[RISCVALU.scala 136:15 153:38]
  assign Add_io_B_in = ~io_EXT_SEL ? _GEN_13 : 32'h0; // @[RISCVALU.scala 137:15 153:38]
  assign Invert_io_A_in = ~io_EXT_SEL ? 32'h0 : _GEN_38; // @[RISCVALU.scala 139:18 153:38]
  assign AND_io_A_in = ~io_EXT_SEL ? 32'h0 : _GEN_39; // @[RISCVALU.scala 141:15 153:38]
  assign AND_io_B_in = ~io_EXT_SEL ? 32'h0 : _GEN_40; // @[RISCVALU.scala 142:15 153:38]
  assign OR_io_A_in = ~io_EXT_SEL ? 32'h0 : _GEN_42; // @[RISCVALU.scala 144:14 153:38]
  assign OR_io_B_in = ~io_EXT_SEL ? 32'h0 : _GEN_43; // @[RISCVALU.scala 145:14 153:38]
  assign XOR_io_A_in = ~io_EXT_SEL ? 32'h0 : _GEN_44; // @[RISCVALU.scala 147:15 153:38]
  assign XOR_io_B_in = ~io_EXT_SEL ? 32'h0 : _GEN_45; // @[RISCVALU.scala 148:15 153:38]
  assign CLZ_io_A_in = ~io_EXT_SEL ? 32'h0 : _GEN_46; // @[RISCVALU.scala 150:15 153:38]
  always @(posedge clock) begin
    if (~io_EXT_SEL) begin // @[RISCVALU.scala 153:38]
      if (3'h0 == io_ALU_SEL) begin // @[RISCVALU.scala 155:24]
        RD <= Add_io_sum; // @[RISCVALU.scala 164:12]
      end else if (3'h1 == io_ALU_SEL) begin // @[RISCVALU.scala 155:24]
        RD <= Add_io_sum; // @[RISCVALU.scala 174:12]
      end else if (3'h2 == io_ALU_SEL) begin // @[RISCVALU.scala 155:24]
        RD <= Add_io_sum; // @[RISCVALU.scala 184:12]
      end else begin
        RD <= 32'h0; // @[RISCVALU.scala 115:6]
      end
    end else if (io_EXT_SEL) begin // @[RISCVALU.scala 189:42]
      if (3'h3 == io_ALU_SEL) begin // @[RISCVALU.scala 191:23]
        RD <= AND_io_and; // @[RISCVALU.scala 201:11]
      end else if (3'h4 == io_ALU_SEL) begin // @[RISCVALU.scala 191:23]
        RD <= OR_io_or; // @[RISCVALU.scala 210:11]
      end else begin
        RD <= _GEN_20;
      end
    end else begin
      RD <= 32'h0; // @[RISCVALU.scala 115:6]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  RD = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
