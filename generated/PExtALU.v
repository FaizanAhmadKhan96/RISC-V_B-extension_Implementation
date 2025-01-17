module ShiftLeft(
  input  [31:0] io_A_in,
  input  [4:0]  io_bits,
  output [31:0] io_A_out
);
  wire [62:0] _GEN_0 = {{31'd0}, io_A_in}; // @[RISCVALU.scala 17:28]
  wire [62:0] A_temp = _GEN_0 << io_bits; // @[RISCVALU.scala 17:28]
  assign io_A_out = A_temp[31:0]; // @[RISCVALU.scala 19:15]
endmodule
module ShiftRight(
  input  [31:0] io_A_in,
  input  [4:0]  io_bits,
  output [31:0] io_A_out
);
  assign io_A_out = io_A_in >> io_bits; // @[RISCVALU.scala 30:28]
endmodule
module Adder(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_sum
);
  assign io_sum = io_A_in + io_B_in; // @[RISCVALU.scala 43:30]
endmodule
module InvertBits(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  assign io_A_out = ~io_A_in; // @[RISCVALU.scala 55:20]
endmodule
module ANDBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_and
);
  assign io_and = io_A_in & io_B_in; // @[RISCVALU.scala 68:30]
endmodule
module ORBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_or
);
  assign io_or = io_A_in | io_B_in; // @[RISCVALU.scala 81:29]
endmodule
module XORBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_xor
);
  assign io_xor = io_A_in ^ io_B_in; // @[RISCVALU.scala 94:30]
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
  wire [4:0] _leadingZeros_T_32 = reversed[30] ? 5'h1e : 5'h1f; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_33 = reversed[29] ? 5'h1d : _leadingZeros_T_32; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_34 = reversed[28] ? 5'h1c : _leadingZeros_T_33; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_35 = reversed[27] ? 5'h1b : _leadingZeros_T_34; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_36 = reversed[26] ? 5'h1a : _leadingZeros_T_35; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_37 = reversed[25] ? 5'h19 : _leadingZeros_T_36; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_38 = reversed[24] ? 5'h18 : _leadingZeros_T_37; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_39 = reversed[23] ? 5'h17 : _leadingZeros_T_38; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_40 = reversed[22] ? 5'h16 : _leadingZeros_T_39; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_41 = reversed[21] ? 5'h15 : _leadingZeros_T_40; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_42 = reversed[20] ? 5'h14 : _leadingZeros_T_41; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_43 = reversed[19] ? 5'h13 : _leadingZeros_T_42; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_44 = reversed[18] ? 5'h12 : _leadingZeros_T_43; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_45 = reversed[17] ? 5'h11 : _leadingZeros_T_44; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_46 = reversed[16] ? 5'h10 : _leadingZeros_T_45; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_47 = reversed[15] ? 5'hf : _leadingZeros_T_46; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_48 = reversed[14] ? 5'he : _leadingZeros_T_47; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_49 = reversed[13] ? 5'hd : _leadingZeros_T_48; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_50 = reversed[12] ? 5'hc : _leadingZeros_T_49; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_51 = reversed[11] ? 5'hb : _leadingZeros_T_50; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_52 = reversed[10] ? 5'ha : _leadingZeros_T_51; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_53 = reversed[9] ? 5'h9 : _leadingZeros_T_52; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_54 = reversed[8] ? 5'h8 : _leadingZeros_T_53; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_55 = reversed[7] ? 5'h7 : _leadingZeros_T_54; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_56 = reversed[6] ? 5'h6 : _leadingZeros_T_55; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_57 = reversed[5] ? 5'h5 : _leadingZeros_T_56; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_58 = reversed[4] ? 5'h4 : _leadingZeros_T_57; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_59 = reversed[3] ? 5'h3 : _leadingZeros_T_58; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_60 = reversed[2] ? 5'h2 : _leadingZeros_T_59; // @[Mux.scala 47:70]
  wire [4:0] _leadingZeros_T_61 = reversed[1] ? 5'h1 : _leadingZeros_T_60; // @[Mux.scala 47:70]
  wire [4:0] leadingZeros = reversed[0] ? 5'h0 : _leadingZeros_T_61; // @[Mux.scala 47:70]
  assign io_A_out = io_A_in == 32'h0 ? 6'h20 : {{1'd0}, leadingZeros}; // @[RISCVALU.scala 111:18]
endmodule
module CountTrailingZeros(
  input  [31:0] io_A_in,
  output [5:0]  io_A_out
);
  wire [4:0] _trailingZeros_T_32 = io_A_in[30] ? 5'h1e : 5'h1f; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_33 = io_A_in[29] ? 5'h1d : _trailingZeros_T_32; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_34 = io_A_in[28] ? 5'h1c : _trailingZeros_T_33; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_35 = io_A_in[27] ? 5'h1b : _trailingZeros_T_34; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_36 = io_A_in[26] ? 5'h1a : _trailingZeros_T_35; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_37 = io_A_in[25] ? 5'h19 : _trailingZeros_T_36; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_38 = io_A_in[24] ? 5'h18 : _trailingZeros_T_37; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_39 = io_A_in[23] ? 5'h17 : _trailingZeros_T_38; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_40 = io_A_in[22] ? 5'h16 : _trailingZeros_T_39; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_41 = io_A_in[21] ? 5'h15 : _trailingZeros_T_40; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_42 = io_A_in[20] ? 5'h14 : _trailingZeros_T_41; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_43 = io_A_in[19] ? 5'h13 : _trailingZeros_T_42; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_44 = io_A_in[18] ? 5'h12 : _trailingZeros_T_43; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_45 = io_A_in[17] ? 5'h11 : _trailingZeros_T_44; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_46 = io_A_in[16] ? 5'h10 : _trailingZeros_T_45; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_47 = io_A_in[15] ? 5'hf : _trailingZeros_T_46; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_48 = io_A_in[14] ? 5'he : _trailingZeros_T_47; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_49 = io_A_in[13] ? 5'hd : _trailingZeros_T_48; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_50 = io_A_in[12] ? 5'hc : _trailingZeros_T_49; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_51 = io_A_in[11] ? 5'hb : _trailingZeros_T_50; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_52 = io_A_in[10] ? 5'ha : _trailingZeros_T_51; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_53 = io_A_in[9] ? 5'h9 : _trailingZeros_T_52; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_54 = io_A_in[8] ? 5'h8 : _trailingZeros_T_53; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_55 = io_A_in[7] ? 5'h7 : _trailingZeros_T_54; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_56 = io_A_in[6] ? 5'h6 : _trailingZeros_T_55; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_57 = io_A_in[5] ? 5'h5 : _trailingZeros_T_56; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_58 = io_A_in[4] ? 5'h4 : _trailingZeros_T_57; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_59 = io_A_in[3] ? 5'h3 : _trailingZeros_T_58; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_60 = io_A_in[2] ? 5'h2 : _trailingZeros_T_59; // @[Mux.scala 47:70]
  wire [4:0] _trailingZeros_T_61 = io_A_in[1] ? 5'h1 : _trailingZeros_T_60; // @[Mux.scala 47:70]
  wire [4:0] trailingZeros = io_A_in[0] ? 5'h0 : _trailingZeros_T_61; // @[Mux.scala 47:70]
  assign io_A_out = io_A_in == 32'h0 ? 6'h20 : {{1'd0}, trailingZeros}; // @[RISCVALU.scala 125:18]
endmodule
module CountPopulation(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [1:0] _io_A_out_T_32 = io_A_in[0] + io_A_in[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_34 = io_A_in[2] + io_A_in[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _io_A_out_T_36 = _io_A_out_T_32 + _io_A_out_T_34; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_38 = io_A_in[4] + io_A_in[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_40 = io_A_in[6] + io_A_in[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _io_A_out_T_42 = _io_A_out_T_38 + _io_A_out_T_40; // @[Bitwise.scala 51:90]
  wire [3:0] _io_A_out_T_44 = _io_A_out_T_36 + _io_A_out_T_42; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_46 = io_A_in[8] + io_A_in[9]; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_48 = io_A_in[10] + io_A_in[11]; // @[Bitwise.scala 51:90]
  wire [2:0] _io_A_out_T_50 = _io_A_out_T_46 + _io_A_out_T_48; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_52 = io_A_in[12] + io_A_in[13]; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_54 = io_A_in[14] + io_A_in[15]; // @[Bitwise.scala 51:90]
  wire [2:0] _io_A_out_T_56 = _io_A_out_T_52 + _io_A_out_T_54; // @[Bitwise.scala 51:90]
  wire [3:0] _io_A_out_T_58 = _io_A_out_T_50 + _io_A_out_T_56; // @[Bitwise.scala 51:90]
  wire [4:0] _io_A_out_T_60 = _io_A_out_T_44 + _io_A_out_T_58; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_62 = io_A_in[16] + io_A_in[17]; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_64 = io_A_in[18] + io_A_in[19]; // @[Bitwise.scala 51:90]
  wire [2:0] _io_A_out_T_66 = _io_A_out_T_62 + _io_A_out_T_64; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_68 = io_A_in[20] + io_A_in[21]; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_70 = io_A_in[22] + io_A_in[23]; // @[Bitwise.scala 51:90]
  wire [2:0] _io_A_out_T_72 = _io_A_out_T_68 + _io_A_out_T_70; // @[Bitwise.scala 51:90]
  wire [3:0] _io_A_out_T_74 = _io_A_out_T_66 + _io_A_out_T_72; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_76 = io_A_in[24] + io_A_in[25]; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_78 = io_A_in[26] + io_A_in[27]; // @[Bitwise.scala 51:90]
  wire [2:0] _io_A_out_T_80 = _io_A_out_T_76 + _io_A_out_T_78; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_82 = io_A_in[28] + io_A_in[29]; // @[Bitwise.scala 51:90]
  wire [1:0] _io_A_out_T_84 = io_A_in[30] + io_A_in[31]; // @[Bitwise.scala 51:90]
  wire [2:0] _io_A_out_T_86 = _io_A_out_T_82 + _io_A_out_T_84; // @[Bitwise.scala 51:90]
  wire [3:0] _io_A_out_T_88 = _io_A_out_T_80 + _io_A_out_T_86; // @[Bitwise.scala 51:90]
  wire [4:0] _io_A_out_T_90 = _io_A_out_T_74 + _io_A_out_T_88; // @[Bitwise.scala 51:90]
  wire [5:0] _io_A_out_T_92 = _io_A_out_T_60 + _io_A_out_T_90; // @[Bitwise.scala 51:90]
  assign io_A_out = {{26'd0}, _io_A_out_T_92}; // @[RISCVALU.scala 136:12]
endmodule
module MaxInstruction(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_max
);
  assign io_max = $signed(io_A_in) < $signed(io_B_in) ? $signed(io_B_in) : $signed(io_A_in); // @[RISCVALU.scala 148:54]
endmodule
module MaxUInstruction(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_maxu
);
  assign io_maxu = io_A_in < io_B_in ? io_B_in : io_A_in; // @[RISCVALU.scala 160:17]
endmodule
module MinInstruction(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_min
);
  assign io_min = $signed(io_A_in) < $signed(io_B_in) ? $signed(io_A_in) : $signed(io_B_in); // @[RISCVALU.scala 172:54]
endmodule
module MinUInstruction(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_minu
);
  assign io_minu = io_A_in < io_B_in ? io_A_in : io_B_in; // @[RISCVALU.scala 184:17]
endmodule
module SextB(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [7:0] byte_ = io_A_in[7:0]; // @[RISCVALU.scala 195:21]
  wire [23:0] _signExtended_T_2 = byte_[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  assign io_A_out = {_signExtended_T_2,byte_}; // @[Cat.scala 33:92]
endmodule
module SextH(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [15:0] halfword = io_A_in[15:0]; // @[RISCVALU.scala 212:25]
  wire [15:0] _signExtendedH_T_2 = halfword[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  assign io_A_out = {_signExtendedH_T_2,halfword}; // @[Cat.scala 33:92]
endmodule
module ZextH(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  assign io_A_out = {{16'd0}, io_A_in[15:0]}; // @[RISCVALU.scala 229:37]
endmodule
module OrcB(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [7:0] inputBytes_0 = io_A_in[7:0]; // @[RISCVALU.scala 245:29]
  wire [7:0] inputBytes_1 = io_A_in[15:8]; // @[RISCVALU.scala 245:29]
  wire [7:0] inputBytes_2 = io_A_in[23:16]; // @[RISCVALU.scala 245:29]
  wire [7:0] inputBytes_3 = io_A_in[31:24]; // @[RISCVALU.scala 245:29]
  wire [7:0] outputBytes_0 = inputBytes_0 == 8'h0 ? 8'h0 : 8'hff; // @[RISCVALU.scala 253:33 254:22 256:22]
  wire [7:0] outputBytes_1 = inputBytes_1 == 8'h0 ? 8'h0 : 8'hff; // @[RISCVALU.scala 253:33 254:22 256:22]
  wire [7:0] outputBytes_2 = inputBytes_2 == 8'h0 ? 8'h0 : 8'hff; // @[RISCVALU.scala 253:33 254:22 256:22]
  wire [7:0] outputBytes_3 = inputBytes_3 == 8'h0 ? 8'h0 : 8'hff; // @[RISCVALU.scala 253:33 254:22 256:22]
  wire [15:0] io_A_out_lo = {outputBytes_1,outputBytes_0}; // @[RISCVALU.scala 261:27]
  wire [15:0] io_A_out_hi = {outputBytes_3,outputBytes_2}; // @[RISCVALU.scala 261:27]
  assign io_A_out = {io_A_out_hi,io_A_out_lo}; // @[RISCVALU.scala 261:27]
endmodule
module Rev8(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [7:0] ByteOrder_0 = io_A_in[7:0]; // @[RISCVALU.scala 277:28]
  wire [7:0] ByteOrder_1 = io_A_in[15:8]; // @[RISCVALU.scala 277:28]
  wire [7:0] ByteOrder_2 = io_A_in[23:16]; // @[RISCVALU.scala 277:28]
  wire [7:0] ByteOrder_3 = io_A_in[31:24]; // @[RISCVALU.scala 277:28]
  wire [15:0] io_A_out_lo = {ByteOrder_2,ByteOrder_3}; // @[RISCVALU.scala 284:37]
  wire [15:0] io_A_out_hi = {ByteOrder_0,ByteOrder_1}; // @[RISCVALU.scala 284:37]
  assign io_A_out = {io_A_out_hi,io_A_out_lo}; // @[RISCVALU.scala 284:37]
endmodule
module PExtALU(
  input         clock,
  input         reset,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [4:0]  io_ALU_SEL,
  input  [1:0]  io_EXT_SEL,
  output [31:0] io_rd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] ShiftL_io_A_in; // @[RISCVALU.scala 344:22]
  wire [4:0] ShiftL_io_bits; // @[RISCVALU.scala 344:22]
  wire [31:0] ShiftL_io_A_out; // @[RISCVALU.scala 344:22]
  wire [31:0] ShiftR_io_A_in; // @[RISCVALU.scala 346:22]
  wire [4:0] ShiftR_io_bits; // @[RISCVALU.scala 346:22]
  wire [31:0] ShiftR_io_A_out; // @[RISCVALU.scala 346:22]
  wire [31:0] Add_io_A_in; // @[RISCVALU.scala 348:19]
  wire [31:0] Add_io_B_in; // @[RISCVALU.scala 348:19]
  wire [31:0] Add_io_sum; // @[RISCVALU.scala 348:19]
  wire [31:0] Invert_io_A_in; // @[RISCVALU.scala 350:22]
  wire [31:0] Invert_io_A_out; // @[RISCVALU.scala 350:22]
  wire [31:0] AND_io_A_in; // @[RISCVALU.scala 352:19]
  wire [31:0] AND_io_B_in; // @[RISCVALU.scala 352:19]
  wire [31:0] AND_io_and; // @[RISCVALU.scala 352:19]
  wire [31:0] OR_io_A_in; // @[RISCVALU.scala 354:18]
  wire [31:0] OR_io_B_in; // @[RISCVALU.scala 354:18]
  wire [31:0] OR_io_or; // @[RISCVALU.scala 354:18]
  wire [31:0] XOR_io_A_in; // @[RISCVALU.scala 356:19]
  wire [31:0] XOR_io_B_in; // @[RISCVALU.scala 356:19]
  wire [31:0] XOR_io_xor; // @[RISCVALU.scala 356:19]
  wire [31:0] CLZ_io_A_in; // @[RISCVALU.scala 358:19]
  wire [5:0] CLZ_io_A_out; // @[RISCVALU.scala 358:19]
  wire [31:0] CTZ_io_A_in; // @[RISCVALU.scala 360:19]
  wire [5:0] CTZ_io_A_out; // @[RISCVALU.scala 360:19]
  wire [31:0] CPOP_io_A_in; // @[RISCVALU.scala 362:20]
  wire [31:0] CPOP_io_A_out; // @[RISCVALU.scala 362:20]
  wire [31:0] MAX_io_A_in; // @[RISCVALU.scala 364:19]
  wire [31:0] MAX_io_B_in; // @[RISCVALU.scala 364:19]
  wire [31:0] MAX_io_max; // @[RISCVALU.scala 364:19]
  wire [31:0] MAXU_io_A_in; // @[RISCVALU.scala 366:20]
  wire [31:0] MAXU_io_B_in; // @[RISCVALU.scala 366:20]
  wire [31:0] MAXU_io_maxu; // @[RISCVALU.scala 366:20]
  wire [31:0] MIN_io_A_in; // @[RISCVALU.scala 368:19]
  wire [31:0] MIN_io_B_in; // @[RISCVALU.scala 368:19]
  wire [31:0] MIN_io_min; // @[RISCVALU.scala 368:19]
  wire [31:0] MINU_io_A_in; // @[RISCVALU.scala 370:20]
  wire [31:0] MINU_io_B_in; // @[RISCVALU.scala 370:20]
  wire [31:0] MINU_io_minu; // @[RISCVALU.scala 370:20]
  wire [31:0] SEXTB_io_A_in; // @[RISCVALU.scala 372:21]
  wire [31:0] SEXTB_io_A_out; // @[RISCVALU.scala 372:21]
  wire [31:0] SEXTH_io_A_in; // @[RISCVALU.scala 374:21]
  wire [31:0] SEXTH_io_A_out; // @[RISCVALU.scala 374:21]
  wire [31:0] ZEXTH_io_A_in; // @[RISCVALU.scala 376:21]
  wire [31:0] ZEXTH_io_A_out; // @[RISCVALU.scala 376:21]
  wire [31:0] ORCB_io_A_in; // @[RISCVALU.scala 378:20]
  wire [31:0] ORCB_io_A_out; // @[RISCVALU.scala 378:20]
  wire [31:0] REV8_io_A_in; // @[RISCVALU.scala 380:20]
  wire [31:0] REV8_io_A_out; // @[RISCVALU.scala 380:20]
  reg [31:0] RD; // @[RISCVALU.scala 337:19]
  wire [31:0] index = io_rs2 & 32'h1f; // @[RISCVALU.scala 339:19]
  wire  isReserved = io_rs2[5]; // @[RISCVALU.scala 342:23]
  wire [31:0] _GEN_0 = 5'h2 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 389:18 443:24 467:24]
  wire [1:0] _GEN_1 = 5'h2 == io_ALU_SEL ? 2'h3 : 2'h0; // @[RISCVALU.scala 390:18 443:24 468:24]
  wire [31:0] _GEN_2 = 5'h2 == io_ALU_SEL ? ShiftL_io_A_out : 32'h0; // @[RISCVALU.scala 395:15 443:24 470:21]
  wire [31:0] _GEN_3 = 5'h2 == io_ALU_SEL ? io_rs2 : 32'h0; // @[RISCVALU.scala 396:15 443:24 471:21]
  wire [31:0] _GEN_4 = 5'h2 == io_ALU_SEL ? Add_io_sum : RD; // @[RISCVALU.scala 443:24 472:12 337:19]
  wire [31:0] _GEN_5 = 5'h1 == io_ALU_SEL ? io_rs1 : _GEN_0; // @[RISCVALU.scala 443:24 457:24]
  wire [1:0] _GEN_6 = 5'h1 == io_ALU_SEL ? 2'h2 : _GEN_1; // @[RISCVALU.scala 443:24 458:24]
  wire [31:0] _GEN_7 = 5'h1 == io_ALU_SEL ? ShiftL_io_A_out : _GEN_2; // @[RISCVALU.scala 443:24 460:21]
  wire [31:0] _GEN_8 = 5'h1 == io_ALU_SEL ? io_rs2 : _GEN_3; // @[RISCVALU.scala 443:24 461:21]
  wire [31:0] _GEN_10 = 5'h0 == io_ALU_SEL ? io_rs1 : _GEN_5; // @[RISCVALU.scala 443:24 447:24]
  wire [1:0] _GEN_11 = 5'h0 == io_ALU_SEL ? 2'h1 : _GEN_6; // @[RISCVALU.scala 443:24 448:24]
  wire [31:0] _GEN_12 = 5'h0 == io_ALU_SEL ? ShiftL_io_A_out : _GEN_7; // @[RISCVALU.scala 443:24 450:21]
  wire [31:0] _GEN_13 = 5'h0 == io_ALU_SEL ? io_rs2 : _GEN_8; // @[RISCVALU.scala 443:24 451:21]
  wire [4:0] shamt = io_rs2[4:0]; // @[RISCVALU.scala 587:24]
  wire [5:0] _GEN_410 = {{1'd0}, shamt}; // @[RISCVALU.scala 590:35]
  wire [5:0] rightShiftBits = 6'h20 - _GEN_410; // @[RISCVALU.scala 590:35]
  wire [31:0] _GEN_15 = 5'h14 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 435:16 479:23 661:22]
  wire [31:0] _GEN_16 = 5'h14 == io_ALU_SEL ? REV8_io_A_out : RD; // @[RISCVALU.scala 479:23 662:12 337:19]
  wire [31:0] _GEN_17 = 5'h13 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 433:16 479:23 655:22]
  wire [31:0] _GEN_18 = 5'h13 == io_ALU_SEL ? ORCB_io_A_out : _GEN_16; // @[RISCVALU.scala 479:23 656:12]
  wire [31:0] _GEN_19 = 5'h13 == io_ALU_SEL ? 32'h0 : _GEN_15; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_20 = 5'h12 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 389:18 479:23 634:24]
  wire [5:0] _GEN_21 = 5'h12 == io_ALU_SEL ? rightShiftBits : 6'h0; // @[RISCVALU.scala 390:18 479:23 635:24]
  wire [4:0] _GEN_22 = 5'h12 == io_ALU_SEL ? shamt : 5'h0; // @[RISCVALU.scala 393:18 479:23 638:24]
  wire [31:0] _GEN_23 = 5'h12 == io_ALU_SEL ? ShiftR_io_A_out : 32'h0; // @[RISCVALU.scala 403:14 479:23 640:20]
  wire [31:0] _GEN_24 = 5'h12 == io_ALU_SEL ? ShiftL_io_A_out : 32'h0; // @[RISCVALU.scala 404:14 479:23 641:20]
  wire [31:0] _GEN_25 = 5'h12 == io_ALU_SEL ? OR_io_or : _GEN_18; // @[RISCVALU.scala 479:23 650:12]
  wire [31:0] _GEN_26 = 5'h12 == io_ALU_SEL ? 32'h0 : _GEN_17; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_27 = 5'h12 == io_ALU_SEL ? 32'h0 : _GEN_19; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_28 = 5'h11 == io_ALU_SEL ? io_rs1 : _GEN_20; // @[RISCVALU.scala 479:23 613:24]
  wire [5:0] _GEN_29 = 5'h11 == io_ALU_SEL ? rightShiftBits : _GEN_21; // @[RISCVALU.scala 479:23 614:24]
  wire [4:0] _GEN_30 = 5'h11 == io_ALU_SEL ? shamt : _GEN_22; // @[RISCVALU.scala 479:23 617:24]
  wire [31:0] _GEN_31 = 5'h11 == io_ALU_SEL ? ShiftR_io_A_out : _GEN_23; // @[RISCVALU.scala 479:23 619:20]
  wire [31:0] _GEN_32 = 5'h11 == io_ALU_SEL ? ShiftL_io_A_out : _GEN_24; // @[RISCVALU.scala 479:23 620:20]
  wire [31:0] _GEN_33 = 5'h11 == io_ALU_SEL ? OR_io_or : _GEN_25; // @[RISCVALU.scala 479:23 622:12]
  wire [31:0] _GEN_34 = 5'h11 == io_ALU_SEL ? 32'h0 : _GEN_26; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_35 = 5'h11 == io_ALU_SEL ? 32'h0 : _GEN_27; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_36 = 5'h10 == io_ALU_SEL ? io_rs1 : _GEN_28; // @[RISCVALU.scala 479:23 592:24]
  wire [5:0] _GEN_37 = 5'h10 == io_ALU_SEL ? {{1'd0}, shamt} : _GEN_29; // @[RISCVALU.scala 479:23 593:24]
  wire [5:0] _GEN_38 = 5'h10 == io_ALU_SEL ? rightShiftBits : {{1'd0}, _GEN_30}; // @[RISCVALU.scala 479:23 596:24]
  wire [31:0] _GEN_39 = 5'h10 == io_ALU_SEL ? ShiftL_io_A_out : _GEN_31; // @[RISCVALU.scala 479:23 598:20]
  wire [31:0] _GEN_40 = 5'h10 == io_ALU_SEL ? ShiftR_io_A_out : _GEN_32; // @[RISCVALU.scala 479:23 599:20]
  wire [31:0] _GEN_41 = 5'h10 == io_ALU_SEL ? OR_io_or : _GEN_33; // @[RISCVALU.scala 479:23 601:12]
  wire [31:0] _GEN_42 = 5'h10 == io_ALU_SEL ? 32'h0 : _GEN_34; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_43 = 5'h10 == io_ALU_SEL ? 32'h0 : _GEN_35; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_44 = 5'hf == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 431:17 479:23 579:23]
  wire [31:0] _GEN_45 = 5'hf == io_ALU_SEL ? ZEXTH_io_A_out : _GEN_41; // @[RISCVALU.scala 479:23 580:12]
  wire [31:0] _GEN_46 = 5'hf == io_ALU_SEL ? 32'h0 : _GEN_36; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_47 = 5'hf == io_ALU_SEL ? 6'h0 : _GEN_37; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_48 = 5'hf == io_ALU_SEL ? 6'h0 : _GEN_38; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_49 = 5'hf == io_ALU_SEL ? 32'h0 : _GEN_39; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_50 = 5'hf == io_ALU_SEL ? 32'h0 : _GEN_40; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_51 = 5'hf == io_ALU_SEL ? 32'h0 : _GEN_42; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_52 = 5'hf == io_ALU_SEL ? 32'h0 : _GEN_43; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_53 = 5'he == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 429:17 479:23 573:23]
  wire [31:0] _GEN_54 = 5'he == io_ALU_SEL ? SEXTH_io_A_out : _GEN_45; // @[RISCVALU.scala 479:23 574:12]
  wire [31:0] _GEN_55 = 5'he == io_ALU_SEL ? 32'h0 : _GEN_44; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_56 = 5'he == io_ALU_SEL ? 32'h0 : _GEN_46; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_57 = 5'he == io_ALU_SEL ? 6'h0 : _GEN_47; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_58 = 5'he == io_ALU_SEL ? 6'h0 : _GEN_48; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_59 = 5'he == io_ALU_SEL ? 32'h0 : _GEN_49; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_60 = 5'he == io_ALU_SEL ? 32'h0 : _GEN_50; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_61 = 5'he == io_ALU_SEL ? 32'h0 : _GEN_51; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_62 = 5'he == io_ALU_SEL ? 32'h0 : _GEN_52; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_63 = 5'hd == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 427:17 479:23 567:23]
  wire [31:0] _GEN_64 = 5'hd == io_ALU_SEL ? SEXTB_io_A_out : _GEN_54; // @[RISCVALU.scala 479:23 568:12]
  wire [31:0] _GEN_65 = 5'hd == io_ALU_SEL ? 32'h0 : _GEN_53; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_66 = 5'hd == io_ALU_SEL ? 32'h0 : _GEN_55; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_67 = 5'hd == io_ALU_SEL ? 32'h0 : _GEN_56; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_68 = 5'hd == io_ALU_SEL ? 6'h0 : _GEN_57; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_69 = 5'hd == io_ALU_SEL ? 6'h0 : _GEN_58; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_70 = 5'hd == io_ALU_SEL ? 32'h0 : _GEN_59; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_71 = 5'hd == io_ALU_SEL ? 32'h0 : _GEN_60; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_72 = 5'hd == io_ALU_SEL ? 32'h0 : _GEN_61; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_73 = 5'hd == io_ALU_SEL ? 32'h0 : _GEN_62; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_74 = 5'hc == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 424:16 479:23 559:21]
  wire [31:0] _GEN_75 = 5'hc == io_ALU_SEL ? io_rs2 : 32'h0; // @[RISCVALU.scala 425:16 479:23 560:21]
  wire [31:0] _GEN_76 = 5'hc == io_ALU_SEL ? MINU_io_minu : _GEN_64; // @[RISCVALU.scala 479:23 562:11]
  wire [31:0] _GEN_77 = 5'hc == io_ALU_SEL ? 32'h0 : _GEN_63; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_78 = 5'hc == io_ALU_SEL ? 32'h0 : _GEN_65; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_79 = 5'hc == io_ALU_SEL ? 32'h0 : _GEN_66; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_80 = 5'hc == io_ALU_SEL ? 32'h0 : _GEN_67; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_81 = 5'hc == io_ALU_SEL ? 6'h0 : _GEN_68; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_82 = 5'hc == io_ALU_SEL ? 6'h0 : _GEN_69; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_83 = 5'hc == io_ALU_SEL ? 32'h0 : _GEN_70; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_84 = 5'hc == io_ALU_SEL ? 32'h0 : _GEN_71; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_85 = 5'hc == io_ALU_SEL ? 32'h0 : _GEN_72; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_86 = 5'hc == io_ALU_SEL ? 32'h0 : _GEN_73; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_87 = 5'hb == io_ALU_SEL ? $signed(io_rs1) : $signed(32'sh0); // @[RISCVALU.scala 421:15 479:23 550:20]
  wire [31:0] _GEN_88 = 5'hb == io_ALU_SEL ? $signed(io_rs2) : $signed(32'sh0); // @[RISCVALU.scala 422:15 479:23 551:20]
  wire [31:0] _GEN_89 = 5'hb == io_ALU_SEL ? MIN_io_min : _GEN_76; // @[RISCVALU.scala 479:23 553:11]
  wire [31:0] _GEN_90 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_74; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_91 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_75; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_92 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_77; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_93 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_78; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_94 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_79; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_95 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_80; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_96 = 5'hb == io_ALU_SEL ? 6'h0 : _GEN_81; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_97 = 5'hb == io_ALU_SEL ? 6'h0 : _GEN_82; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_98 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_83; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_99 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_84; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_100 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_85; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_101 = 5'hb == io_ALU_SEL ? 32'h0 : _GEN_86; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_102 = 5'ha == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 418:16 479:23 541:21]
  wire [31:0] _GEN_103 = 5'ha == io_ALU_SEL ? io_rs2 : 32'h0; // @[RISCVALU.scala 419:16 479:23 542:21]
  wire [31:0] _GEN_104 = 5'ha == io_ALU_SEL ? MAXU_io_maxu : _GEN_89; // @[RISCVALU.scala 479:23 544:11]
  wire [31:0] _GEN_105 = 5'ha == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_87); // @[RISCVALU.scala 421:15 479:23]
  wire [31:0] _GEN_106 = 5'ha == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_88); // @[RISCVALU.scala 422:15 479:23]
  wire [31:0] _GEN_107 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_90; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_108 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_91; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_109 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_92; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_110 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_93; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_111 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_94; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_112 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_95; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_113 = 5'ha == io_ALU_SEL ? 6'h0 : _GEN_96; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_114 = 5'ha == io_ALU_SEL ? 6'h0 : _GEN_97; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_115 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_98; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_116 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_99; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_117 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_100; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_118 = 5'ha == io_ALU_SEL ? 32'h0 : _GEN_101; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_119 = 5'h9 == io_ALU_SEL ? $signed(io_rs1) : $signed(32'sh0); // @[RISCVALU.scala 415:15 479:23 532:20]
  wire [31:0] _GEN_120 = 5'h9 == io_ALU_SEL ? $signed(io_rs2) : $signed(32'sh0); // @[RISCVALU.scala 416:15 479:23 533:20]
  wire [31:0] _GEN_121 = 5'h9 == io_ALU_SEL ? MAX_io_max : _GEN_104; // @[RISCVALU.scala 479:23 535:11]
  wire [31:0] _GEN_122 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_102; // @[RISCVALU.scala 418:16 479:23]
  wire [31:0] _GEN_123 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_103; // @[RISCVALU.scala 419:16 479:23]
  wire [31:0] _GEN_124 = 5'h9 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_105); // @[RISCVALU.scala 421:15 479:23]
  wire [31:0] _GEN_125 = 5'h9 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_106); // @[RISCVALU.scala 422:15 479:23]
  wire [31:0] _GEN_126 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_107; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_127 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_108; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_128 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_109; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_129 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_110; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_130 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_111; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_131 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_112; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_132 = 5'h9 == io_ALU_SEL ? 6'h0 : _GEN_113; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_133 = 5'h9 == io_ALU_SEL ? 6'h0 : _GEN_114; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_134 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_115; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_135 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_116; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_136 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_117; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_137 = 5'h9 == io_ALU_SEL ? 32'h0 : _GEN_118; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_138 = 5'h8 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 413:16 479:23 525:22]
  wire [31:0] _GEN_139 = 5'h8 == io_ALU_SEL ? CPOP_io_A_out : _GEN_121; // @[RISCVALU.scala 479:23 526:12]
  wire [31:0] _GEN_140 = 5'h8 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_119); // @[RISCVALU.scala 415:15 479:23]
  wire [31:0] _GEN_141 = 5'h8 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_120); // @[RISCVALU.scala 416:15 479:23]
  wire [31:0] _GEN_142 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_122; // @[RISCVALU.scala 418:16 479:23]
  wire [31:0] _GEN_143 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_123; // @[RISCVALU.scala 419:16 479:23]
  wire [31:0] _GEN_144 = 5'h8 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_124); // @[RISCVALU.scala 421:15 479:23]
  wire [31:0] _GEN_145 = 5'h8 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_125); // @[RISCVALU.scala 422:15 479:23]
  wire [31:0] _GEN_146 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_126; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_147 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_127; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_148 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_128; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_149 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_129; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_150 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_130; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_151 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_131; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_152 = 5'h8 == io_ALU_SEL ? 6'h0 : _GEN_132; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_153 = 5'h8 == io_ALU_SEL ? 6'h0 : _GEN_133; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_154 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_134; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_155 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_135; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_156 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_136; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_157 = 5'h8 == io_ALU_SEL ? 32'h0 : _GEN_137; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_158 = 5'h7 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 411:15 479:23 519:21]
  wire [31:0] _GEN_159 = 5'h7 == io_ALU_SEL ? {{26'd0}, CTZ_io_A_out} : _GEN_139; // @[RISCVALU.scala 479:23 520:12]
  wire [31:0] _GEN_160 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_138; // @[RISCVALU.scala 413:16 479:23]
  wire [31:0] _GEN_161 = 5'h7 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_140); // @[RISCVALU.scala 415:15 479:23]
  wire [31:0] _GEN_162 = 5'h7 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_141); // @[RISCVALU.scala 416:15 479:23]
  wire [31:0] _GEN_163 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_142; // @[RISCVALU.scala 418:16 479:23]
  wire [31:0] _GEN_164 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_143; // @[RISCVALU.scala 419:16 479:23]
  wire [31:0] _GEN_165 = 5'h7 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_144); // @[RISCVALU.scala 421:15 479:23]
  wire [31:0] _GEN_166 = 5'h7 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_145); // @[RISCVALU.scala 422:15 479:23]
  wire [31:0] _GEN_167 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_146; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_168 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_147; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_169 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_148; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_170 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_149; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_171 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_150; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_172 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_151; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_173 = 5'h7 == io_ALU_SEL ? 6'h0 : _GEN_152; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_174 = 5'h7 == io_ALU_SEL ? 6'h0 : _GEN_153; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_175 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_154; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_176 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_155; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_177 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_156; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_178 = 5'h7 == io_ALU_SEL ? 32'h0 : _GEN_157; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_179 = 5'h6 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 409:15 479:23 513:21]
  wire [31:0] _GEN_180 = 5'h6 == io_ALU_SEL ? {{26'd0}, CLZ_io_A_out} : _GEN_159; // @[RISCVALU.scala 479:23 514:12]
  wire [31:0] _GEN_181 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_158; // @[RISCVALU.scala 411:15 479:23]
  wire [31:0] _GEN_182 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_160; // @[RISCVALU.scala 413:16 479:23]
  wire [31:0] _GEN_183 = 5'h6 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_161); // @[RISCVALU.scala 415:15 479:23]
  wire [31:0] _GEN_184 = 5'h6 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_162); // @[RISCVALU.scala 416:15 479:23]
  wire [31:0] _GEN_185 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_163; // @[RISCVALU.scala 418:16 479:23]
  wire [31:0] _GEN_186 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_164; // @[RISCVALU.scala 419:16 479:23]
  wire [31:0] _GEN_187 = 5'h6 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_165); // @[RISCVALU.scala 421:15 479:23]
  wire [31:0] _GEN_188 = 5'h6 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_166); // @[RISCVALU.scala 422:15 479:23]
  wire [31:0] _GEN_189 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_167; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_190 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_168; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_191 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_169; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_192 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_170; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_193 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_171; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_194 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_172; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_195 = 5'h6 == io_ALU_SEL ? 6'h0 : _GEN_173; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_196 = 5'h6 == io_ALU_SEL ? 6'h0 : _GEN_174; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_197 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_175; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_198 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_176; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_199 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_177; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_200 = 5'h6 == io_ALU_SEL ? 32'h0 : _GEN_178; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_201 = 5'h5 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 406:15 479:23 504:20]
  wire [31:0] _GEN_202 = 5'h5 == io_ALU_SEL ? io_rs2 : 32'h0; // @[RISCVALU.scala 407:15 479:23 505:20]
  wire [31:0] _GEN_203 = 5'h5 == io_ALU_SEL ? XOR_io_xor : 32'h0; // @[RISCVALU.scala 398:18 479:23 507:23]
  wire [31:0] _GEN_204 = 5'h5 == io_ALU_SEL ? Invert_io_A_out : _GEN_180; // @[RISCVALU.scala 479:23 508:11]
  wire [31:0] _GEN_205 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_179; // @[RISCVALU.scala 409:15 479:23]
  wire [31:0] _GEN_206 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_181; // @[RISCVALU.scala 411:15 479:23]
  wire [31:0] _GEN_207 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_182; // @[RISCVALU.scala 413:16 479:23]
  wire [31:0] _GEN_208 = 5'h5 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_183); // @[RISCVALU.scala 415:15 479:23]
  wire [31:0] _GEN_209 = 5'h5 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_184); // @[RISCVALU.scala 416:15 479:23]
  wire [31:0] _GEN_210 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_185; // @[RISCVALU.scala 418:16 479:23]
  wire [31:0] _GEN_211 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_186; // @[RISCVALU.scala 419:16 479:23]
  wire [31:0] _GEN_212 = 5'h5 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_187); // @[RISCVALU.scala 421:15 479:23]
  wire [31:0] _GEN_213 = 5'h5 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_188); // @[RISCVALU.scala 422:15 479:23]
  wire [31:0] _GEN_214 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_189; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_215 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_190; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_216 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_191; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_217 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_192; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_218 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_193; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_219 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_194; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_220 = 5'h5 == io_ALU_SEL ? 6'h0 : _GEN_195; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_221 = 5'h5 == io_ALU_SEL ? 6'h0 : _GEN_196; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_222 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_197; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_223 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_198; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_224 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_199; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_225 = 5'h5 == io_ALU_SEL ? 32'h0 : _GEN_200; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_226 = 5'h4 == io_ALU_SEL ? io_rs2 : _GEN_203; // @[RISCVALU.scala 479:23 494:23]
  wire [31:0] _GEN_227 = 5'h4 == io_ALU_SEL ? io_rs1 : _GEN_222; // @[RISCVALU.scala 479:23 496:19]
  wire [31:0] _GEN_228 = 5'h4 == io_ALU_SEL ? Invert_io_A_out : _GEN_223; // @[RISCVALU.scala 479:23 497:19]
  wire [31:0] _GEN_229 = 5'h4 == io_ALU_SEL ? OR_io_or : _GEN_204; // @[RISCVALU.scala 479:23 498:11]
  wire [31:0] _GEN_230 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_201; // @[RISCVALU.scala 406:15 479:23]
  wire [31:0] _GEN_231 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_202; // @[RISCVALU.scala 407:15 479:23]
  wire [31:0] _GEN_232 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_205; // @[RISCVALU.scala 409:15 479:23]
  wire [31:0] _GEN_233 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_206; // @[RISCVALU.scala 411:15 479:23]
  wire [31:0] _GEN_234 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_207; // @[RISCVALU.scala 413:16 479:23]
  wire [31:0] _GEN_235 = 5'h4 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_208); // @[RISCVALU.scala 415:15 479:23]
  wire [31:0] _GEN_236 = 5'h4 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_209); // @[RISCVALU.scala 416:15 479:23]
  wire [31:0] _GEN_237 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_210; // @[RISCVALU.scala 418:16 479:23]
  wire [31:0] _GEN_238 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_211; // @[RISCVALU.scala 419:16 479:23]
  wire [31:0] _GEN_239 = 5'h4 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_212); // @[RISCVALU.scala 421:15 479:23]
  wire [31:0] _GEN_240 = 5'h4 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_213); // @[RISCVALU.scala 422:15 479:23]
  wire [31:0] _GEN_241 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_214; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_242 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_215; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_243 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_216; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_244 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_217; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_245 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_218; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_246 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_219; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_247 = 5'h4 == io_ALU_SEL ? 6'h0 : _GEN_220; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_248 = 5'h4 == io_ALU_SEL ? 6'h0 : _GEN_221; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_249 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_224; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_250 = 5'h4 == io_ALU_SEL ? 32'h0 : _GEN_225; // @[RISCVALU.scala 435:16 479:23]
  wire [31:0] _GEN_251 = 5'h3 == io_ALU_SEL ? io_rs2 : _GEN_226; // @[RISCVALU.scala 479:23 485:23]
  wire [31:0] _GEN_252 = 5'h3 == io_ALU_SEL ? io_rs1 : 32'h0; // @[RISCVALU.scala 400:15 479:23 487:20]
  wire [31:0] _GEN_253 = 5'h3 == io_ALU_SEL ? Invert_io_A_out : 32'h0; // @[RISCVALU.scala 401:15 479:23 488:20]
  wire [31:0] _GEN_255 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_227; // @[RISCVALU.scala 403:14 479:23]
  wire [31:0] _GEN_256 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_228; // @[RISCVALU.scala 404:14 479:23]
  wire [31:0] _GEN_257 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_230; // @[RISCVALU.scala 406:15 479:23]
  wire [31:0] _GEN_258 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_231; // @[RISCVALU.scala 407:15 479:23]
  wire [31:0] _GEN_259 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_232; // @[RISCVALU.scala 409:15 479:23]
  wire [31:0] _GEN_260 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_233; // @[RISCVALU.scala 411:15 479:23]
  wire [31:0] _GEN_261 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_234; // @[RISCVALU.scala 413:16 479:23]
  wire [31:0] _GEN_262 = 5'h3 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_235); // @[RISCVALU.scala 415:15 479:23]
  wire [31:0] _GEN_263 = 5'h3 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_236); // @[RISCVALU.scala 416:15 479:23]
  wire [31:0] _GEN_264 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_237; // @[RISCVALU.scala 418:16 479:23]
  wire [31:0] _GEN_265 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_238; // @[RISCVALU.scala 419:16 479:23]
  wire [31:0] _GEN_266 = 5'h3 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_239); // @[RISCVALU.scala 421:15 479:23]
  wire [31:0] _GEN_267 = 5'h3 == io_ALU_SEL ? $signed(32'sh0) : $signed(_GEN_240); // @[RISCVALU.scala 422:15 479:23]
  wire [31:0] _GEN_268 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_241; // @[RISCVALU.scala 424:16 479:23]
  wire [31:0] _GEN_269 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_242; // @[RISCVALU.scala 425:16 479:23]
  wire [31:0] _GEN_270 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_243; // @[RISCVALU.scala 427:17 479:23]
  wire [31:0] _GEN_271 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_244; // @[RISCVALU.scala 429:17 479:23]
  wire [31:0] _GEN_272 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_245; // @[RISCVALU.scala 431:17 479:23]
  wire [31:0] _GEN_273 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_246; // @[RISCVALU.scala 389:18 479:23]
  wire [5:0] _GEN_274 = 5'h3 == io_ALU_SEL ? 6'h0 : _GEN_247; // @[RISCVALU.scala 390:18 479:23]
  wire [5:0] _GEN_275 = 5'h3 == io_ALU_SEL ? 6'h0 : _GEN_248; // @[RISCVALU.scala 393:18 479:23]
  wire [31:0] _GEN_276 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_249; // @[RISCVALU.scala 433:16 479:23]
  wire [31:0] _GEN_277 = 5'h3 == io_ALU_SEL ? 32'h0 : _GEN_250; // @[RISCVALU.scala 435:16 479:23]
  wire  _T_72 = ~isReserved; // @[RISCVALU.scala 697:16]
  wire [31:0] _GEN_279 = ~isReserved ? index : 32'h0; // @[RISCVALU.scala 390:18 697:29 699:26]
  wire [31:0] _GEN_280 = ~isReserved ? ShiftL_io_A_out : 32'h0; // @[RISCVALU.scala 398:18 697:29 701:26]
  wire [31:0] _GEN_281 = ~isReserved ? io_rs1 : 32'h0; // @[RISCVALU.scala 400:15 697:29 703:23]
  wire [31:0] _GEN_282 = ~isReserved ? Invert_io_A_out : 32'h0; // @[RISCVALU.scala 401:15 697:29 704:23]
  wire [31:0] _GEN_283 = ~isReserved ? AND_io_and : 32'h0; // @[RISCVALU.scala 697:29 705:14 708:14]
  wire [31:0] _GEN_286 = _T_72 ? ShiftR_io_A_out : 32'h0; // @[RISCVALU.scala 400:15 726:29 730:23]
  wire [31:0] _GEN_293 = _T_72 ? OR_io_or : 32'h0; // @[RISCVALU.scala 753:29 760:14 763:14]
  wire  _GEN_294 = 5'h1d == io_ALU_SEL & _T_72; // @[RISCVALU.scala 389:18 674:27]
  wire [31:0] _GEN_295 = 5'h1d == io_ALU_SEL ? _GEN_279 : 32'h0; // @[RISCVALU.scala 390:18 674:27]
  wire [31:0] _GEN_296 = 5'h1d == io_ALU_SEL ? _GEN_281 : 32'h0; // @[RISCVALU.scala 403:14 674:27]
  wire [31:0] _GEN_297 = 5'h1d == io_ALU_SEL ? _GEN_280 : 32'h0; // @[RISCVALU.scala 404:14 674:27]
  wire [31:0] _GEN_298 = 5'h1d == io_ALU_SEL ? _GEN_293 : RD; // @[RISCVALU.scala 337:19 674:27]
  wire  _GEN_299 = 5'h1c == io_ALU_SEL | _GEN_294; // @[RISCVALU.scala 674:27 742:24]
  wire [31:0] _GEN_300 = 5'h1c == io_ALU_SEL ? index : _GEN_295; // @[RISCVALU.scala 674:27 743:24]
  wire [31:0] _GEN_301 = 5'h1c == io_ALU_SEL ? io_rs1 : _GEN_296; // @[RISCVALU.scala 674:27 745:20]
  wire [31:0] _GEN_302 = 5'h1c == io_ALU_SEL ? ShiftL_io_A_out : _GEN_297; // @[RISCVALU.scala 674:27 746:20]
  wire [31:0] _GEN_303 = 5'h1c == io_ALU_SEL ? OR_io_or : _GEN_298; // @[RISCVALU.scala 674:27 748:12]
  wire [31:0] _GEN_304 = 5'h19 == io_ALU_SEL ? _GEN_281 : 32'h0; // @[RISCVALU.scala 392:18 674:27]
  wire [31:0] _GEN_305 = 5'h19 == io_ALU_SEL ? _GEN_279 : 32'h0; // @[RISCVALU.scala 393:18 674:27]
  wire [31:0] _GEN_306 = 5'h19 == io_ALU_SEL ? _GEN_286 : 32'h0; // @[RISCVALU.scala 400:15 674:27]
  wire  _GEN_307 = 5'h19 == io_ALU_SEL & _T_72; // @[RISCVALU.scala 401:15 674:27]
  wire [31:0] _GEN_308 = 5'h19 == io_ALU_SEL ? _GEN_283 : _GEN_303; // @[RISCVALU.scala 674:27]
  wire  _GEN_309 = 5'h19 == io_ALU_SEL ? 1'h0 : _GEN_299; // @[RISCVALU.scala 389:18 674:27]
  wire [31:0] _GEN_310 = 5'h19 == io_ALU_SEL ? 32'h0 : _GEN_300; // @[RISCVALU.scala 390:18 674:27]
  wire [31:0] _GEN_311 = 5'h19 == io_ALU_SEL ? 32'h0 : _GEN_301; // @[RISCVALU.scala 403:14 674:27]
  wire [31:0] _GEN_312 = 5'h19 == io_ALU_SEL ? 32'h0 : _GEN_302; // @[RISCVALU.scala 404:14 674:27]
  wire [31:0] _GEN_313 = 5'h18 == io_ALU_SEL ? io_rs1 : _GEN_304; // @[RISCVALU.scala 674:27 715:24]
  wire [31:0] _GEN_314 = 5'h18 == io_ALU_SEL ? index : _GEN_305; // @[RISCVALU.scala 674:27 716:24]
  wire [31:0] _GEN_315 = 5'h18 == io_ALU_SEL ? ShiftR_io_A_out : _GEN_306; // @[RISCVALU.scala 674:27 718:21]
  wire  _GEN_316 = 5'h18 == io_ALU_SEL | _GEN_307; // @[RISCVALU.scala 674:27 719:21]
  wire [31:0] _GEN_317 = 5'h18 == io_ALU_SEL ? AND_io_and : _GEN_308; // @[RISCVALU.scala 674:27 721:12]
  wire  _GEN_318 = 5'h18 == io_ALU_SEL ? 1'h0 : _GEN_309; // @[RISCVALU.scala 389:18 674:27]
  wire [31:0] _GEN_319 = 5'h18 == io_ALU_SEL ? 32'h0 : _GEN_310; // @[RISCVALU.scala 390:18 674:27]
  wire [31:0] _GEN_320 = 5'h18 == io_ALU_SEL ? 32'h0 : _GEN_311; // @[RISCVALU.scala 403:14 674:27]
  wire [31:0] _GEN_321 = 5'h18 == io_ALU_SEL ? 32'h0 : _GEN_312; // @[RISCVALU.scala 404:14 674:27]
  wire  _GEN_322 = 5'h17 == io_ALU_SEL ? _T_72 : _GEN_318; // @[RISCVALU.scala 674:27]
  wire [31:0] _GEN_323 = 5'h17 == io_ALU_SEL ? _GEN_279 : _GEN_319; // @[RISCVALU.scala 674:27]
  wire [31:0] _GEN_324 = 5'h17 == io_ALU_SEL ? _GEN_280 : 32'h0; // @[RISCVALU.scala 398:18 674:27]
  wire [31:0] _GEN_325 = 5'h17 == io_ALU_SEL ? _GEN_281 : _GEN_315; // @[RISCVALU.scala 674:27]
  wire [31:0] _GEN_326 = 5'h17 == io_ALU_SEL ? _GEN_282 : {{31'd0}, _GEN_316}; // @[RISCVALU.scala 674:27]
  wire [31:0] _GEN_327 = 5'h17 == io_ALU_SEL ? _GEN_283 : _GEN_317; // @[RISCVALU.scala 674:27]
  wire [31:0] _GEN_328 = 5'h17 == io_ALU_SEL ? 32'h0 : _GEN_313; // @[RISCVALU.scala 392:18 674:27]
  wire [31:0] _GEN_329 = 5'h17 == io_ALU_SEL ? 32'h0 : _GEN_314; // @[RISCVALU.scala 393:18 674:27]
  wire [31:0] _GEN_330 = 5'h17 == io_ALU_SEL ? 32'h0 : _GEN_320; // @[RISCVALU.scala 403:14 674:27]
  wire [31:0] _GEN_331 = 5'h17 == io_ALU_SEL ? 32'h0 : _GEN_321; // @[RISCVALU.scala 404:14 674:27]
  wire  _GEN_332 = 5'h16 == io_ALU_SEL | _GEN_322; // @[RISCVALU.scala 674:27 684:24]
  wire [31:0] _GEN_333 = 5'h16 == io_ALU_SEL ? index : _GEN_323; // @[RISCVALU.scala 674:27 685:24]
  wire [31:0] _GEN_334 = 5'h16 == io_ALU_SEL ? ShiftL_io_A_out : _GEN_324; // @[RISCVALU.scala 674:27 687:24]
  wire [31:0] _GEN_335 = 5'h16 == io_ALU_SEL ? io_rs1 : _GEN_325; // @[RISCVALU.scala 674:27 689:21]
  wire [31:0] _GEN_336 = 5'h16 == io_ALU_SEL ? Invert_io_A_out : _GEN_326; // @[RISCVALU.scala 674:27 690:21]
  wire [31:0] _GEN_337 = 5'h16 == io_ALU_SEL ? AND_io_and : _GEN_327; // @[RISCVALU.scala 674:27 692:12]
  wire [31:0] _GEN_338 = 5'h16 == io_ALU_SEL ? 32'h0 : _GEN_328; // @[RISCVALU.scala 392:18 674:27]
  wire [31:0] _GEN_339 = 5'h16 == io_ALU_SEL ? 32'h0 : _GEN_329; // @[RISCVALU.scala 393:18 674:27]
  wire [31:0] _GEN_340 = 5'h16 == io_ALU_SEL ? 32'h0 : _GEN_330; // @[RISCVALU.scala 403:14 674:27]
  wire [31:0] _GEN_341 = 5'h16 == io_ALU_SEL ? 32'h0 : _GEN_331; // @[RISCVALU.scala 404:14 674:27]
  wire  _GEN_342 = io_EXT_SEL == 2'h3 & _GEN_332; // @[RISCVALU.scala 389:18 672:47]
  wire [31:0] _GEN_343 = io_EXT_SEL == 2'h3 ? _GEN_333 : 32'h0; // @[RISCVALU.scala 390:18 672:47]
  wire [31:0] _GEN_344 = io_EXT_SEL == 2'h3 ? _GEN_334 : 32'h0; // @[RISCVALU.scala 398:18 672:47]
  wire [31:0] _GEN_345 = io_EXT_SEL == 2'h3 ? _GEN_335 : 32'h0; // @[RISCVALU.scala 400:15 672:47]
  wire [31:0] _GEN_346 = io_EXT_SEL == 2'h3 ? _GEN_336 : 32'h0; // @[RISCVALU.scala 401:15 672:47]
  wire [31:0] _GEN_348 = io_EXT_SEL == 2'h3 ? _GEN_338 : 32'h0; // @[RISCVALU.scala 392:18 672:47]
  wire [31:0] _GEN_349 = io_EXT_SEL == 2'h3 ? _GEN_339 : 32'h0; // @[RISCVALU.scala 393:18 672:47]
  wire [31:0] _GEN_350 = io_EXT_SEL == 2'h3 ? _GEN_340 : 32'h0; // @[RISCVALU.scala 403:14 672:47]
  wire [31:0] _GEN_351 = io_EXT_SEL == 2'h3 ? _GEN_341 : 32'h0; // @[RISCVALU.scala 404:14 672:47]
  wire [31:0] _GEN_352 = io_EXT_SEL == 2'h1 ? _GEN_251 : _GEN_344; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_353 = io_EXT_SEL == 2'h1 ? _GEN_252 : _GEN_345; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_354 = io_EXT_SEL == 2'h1 ? _GEN_253 : _GEN_346; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_356 = io_EXT_SEL == 2'h1 ? _GEN_255 : _GEN_350; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_357 = io_EXT_SEL == 2'h1 ? _GEN_256 : _GEN_351; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_358 = io_EXT_SEL == 2'h1 ? _GEN_257 : 32'h0; // @[RISCVALU.scala 406:15 477:42]
  wire [31:0] _GEN_359 = io_EXT_SEL == 2'h1 ? _GEN_258 : 32'h0; // @[RISCVALU.scala 407:15 477:42]
  wire [31:0] _GEN_360 = io_EXT_SEL == 2'h1 ? _GEN_259 : 32'h0; // @[RISCVALU.scala 409:15 477:42]
  wire [31:0] _GEN_361 = io_EXT_SEL == 2'h1 ? _GEN_260 : 32'h0; // @[RISCVALU.scala 411:15 477:42]
  wire [31:0] _GEN_362 = io_EXT_SEL == 2'h1 ? _GEN_261 : 32'h0; // @[RISCVALU.scala 413:16 477:42]
  wire [31:0] _GEN_363 = io_EXT_SEL == 2'h1 ? $signed(_GEN_262) : $signed(32'sh0); // @[RISCVALU.scala 415:15 477:42]
  wire [31:0] _GEN_364 = io_EXT_SEL == 2'h1 ? $signed(_GEN_263) : $signed(32'sh0); // @[RISCVALU.scala 416:15 477:42]
  wire [31:0] _GEN_365 = io_EXT_SEL == 2'h1 ? _GEN_264 : 32'h0; // @[RISCVALU.scala 418:16 477:42]
  wire [31:0] _GEN_366 = io_EXT_SEL == 2'h1 ? _GEN_265 : 32'h0; // @[RISCVALU.scala 419:16 477:42]
  wire [31:0] _GEN_367 = io_EXT_SEL == 2'h1 ? $signed(_GEN_266) : $signed(32'sh0); // @[RISCVALU.scala 421:15 477:42]
  wire [31:0] _GEN_368 = io_EXT_SEL == 2'h1 ? $signed(_GEN_267) : $signed(32'sh0); // @[RISCVALU.scala 422:15 477:42]
  wire [31:0] _GEN_369 = io_EXT_SEL == 2'h1 ? _GEN_268 : 32'h0; // @[RISCVALU.scala 424:16 477:42]
  wire [31:0] _GEN_370 = io_EXT_SEL == 2'h1 ? _GEN_269 : 32'h0; // @[RISCVALU.scala 425:16 477:42]
  wire [31:0] _GEN_371 = io_EXT_SEL == 2'h1 ? _GEN_270 : 32'h0; // @[RISCVALU.scala 427:17 477:42]
  wire [31:0] _GEN_372 = io_EXT_SEL == 2'h1 ? _GEN_271 : 32'h0; // @[RISCVALU.scala 429:17 477:42]
  wire [31:0] _GEN_373 = io_EXT_SEL == 2'h1 ? _GEN_272 : 32'h0; // @[RISCVALU.scala 431:17 477:42]
  wire [31:0] _GEN_374 = io_EXT_SEL == 2'h1 ? _GEN_273 : {{31'd0}, _GEN_342}; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_375 = io_EXT_SEL == 2'h1 ? {{26'd0}, _GEN_274} : _GEN_343; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_376 = io_EXT_SEL == 2'h1 ? _GEN_273 : _GEN_348; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_377 = io_EXT_SEL == 2'h1 ? {{26'd0}, _GEN_275} : _GEN_349; // @[RISCVALU.scala 477:42]
  wire [31:0] _GEN_378 = io_EXT_SEL == 2'h1 ? _GEN_276 : 32'h0; // @[RISCVALU.scala 433:16 477:42]
  wire [31:0] _GEN_379 = io_EXT_SEL == 2'h1 ? _GEN_277 : 32'h0; // @[RISCVALU.scala 435:16 477:42]
  wire [31:0] _GEN_381 = io_EXT_SEL == 2'h0 ? {{30'd0}, _GEN_11} : _GEN_375; // @[RISCVALU.scala 441:38]
  wire [31:0] _GEN_407 = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_377; // @[RISCVALU.scala 393:18 441:38]
  ShiftLeft ShiftL ( // @[RISCVALU.scala 344:22]
    .io_A_in(ShiftL_io_A_in),
    .io_bits(ShiftL_io_bits),
    .io_A_out(ShiftL_io_A_out)
  );
  ShiftRight ShiftR ( // @[RISCVALU.scala 346:22]
    .io_A_in(ShiftR_io_A_in),
    .io_bits(ShiftR_io_bits),
    .io_A_out(ShiftR_io_A_out)
  );
  Adder Add ( // @[RISCVALU.scala 348:19]
    .io_A_in(Add_io_A_in),
    .io_B_in(Add_io_B_in),
    .io_sum(Add_io_sum)
  );
  InvertBits Invert ( // @[RISCVALU.scala 350:22]
    .io_A_in(Invert_io_A_in),
    .io_A_out(Invert_io_A_out)
  );
  ANDBits AND ( // @[RISCVALU.scala 352:19]
    .io_A_in(AND_io_A_in),
    .io_B_in(AND_io_B_in),
    .io_and(AND_io_and)
  );
  ORBits OR ( // @[RISCVALU.scala 354:18]
    .io_A_in(OR_io_A_in),
    .io_B_in(OR_io_B_in),
    .io_or(OR_io_or)
  );
  XORBits XOR ( // @[RISCVALU.scala 356:19]
    .io_A_in(XOR_io_A_in),
    .io_B_in(XOR_io_B_in),
    .io_xor(XOR_io_xor)
  );
  CountLeadingZeros CLZ ( // @[RISCVALU.scala 358:19]
    .io_A_in(CLZ_io_A_in),
    .io_A_out(CLZ_io_A_out)
  );
  CountTrailingZeros CTZ ( // @[RISCVALU.scala 360:19]
    .io_A_in(CTZ_io_A_in),
    .io_A_out(CTZ_io_A_out)
  );
  CountPopulation CPOP ( // @[RISCVALU.scala 362:20]
    .io_A_in(CPOP_io_A_in),
    .io_A_out(CPOP_io_A_out)
  );
  MaxInstruction MAX ( // @[RISCVALU.scala 364:19]
    .io_A_in(MAX_io_A_in),
    .io_B_in(MAX_io_B_in),
    .io_max(MAX_io_max)
  );
  MaxUInstruction MAXU ( // @[RISCVALU.scala 366:20]
    .io_A_in(MAXU_io_A_in),
    .io_B_in(MAXU_io_B_in),
    .io_maxu(MAXU_io_maxu)
  );
  MinInstruction MIN ( // @[RISCVALU.scala 368:19]
    .io_A_in(MIN_io_A_in),
    .io_B_in(MIN_io_B_in),
    .io_min(MIN_io_min)
  );
  MinUInstruction MINU ( // @[RISCVALU.scala 370:20]
    .io_A_in(MINU_io_A_in),
    .io_B_in(MINU_io_B_in),
    .io_minu(MINU_io_minu)
  );
  SextB SEXTB ( // @[RISCVALU.scala 372:21]
    .io_A_in(SEXTB_io_A_in),
    .io_A_out(SEXTB_io_A_out)
  );
  SextH SEXTH ( // @[RISCVALU.scala 374:21]
    .io_A_in(SEXTH_io_A_in),
    .io_A_out(SEXTH_io_A_out)
  );
  ZextH ZEXTH ( // @[RISCVALU.scala 376:21]
    .io_A_in(ZEXTH_io_A_in),
    .io_A_out(ZEXTH_io_A_out)
  );
  OrcB ORCB ( // @[RISCVALU.scala 378:20]
    .io_A_in(ORCB_io_A_in),
    .io_A_out(ORCB_io_A_out)
  );
  Rev8 REV8 ( // @[RISCVALU.scala 380:20]
    .io_A_in(REV8_io_A_in),
    .io_A_out(REV8_io_A_out)
  );
  assign io_rd = RD; // @[RISCVALU.scala 770:9]
  assign ShiftL_io_A_in = io_EXT_SEL == 2'h0 ? _GEN_10 : _GEN_374; // @[RISCVALU.scala 441:38]
  assign ShiftL_io_bits = _GEN_381[4:0];
  assign ShiftR_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_376; // @[RISCVALU.scala 392:18 441:38]
  assign ShiftR_io_bits = _GEN_407[4:0];
  assign Add_io_A_in = io_EXT_SEL == 2'h0 ? _GEN_12 : 32'h0; // @[RISCVALU.scala 395:15 441:38]
  assign Add_io_B_in = io_EXT_SEL == 2'h0 ? _GEN_13 : 32'h0; // @[RISCVALU.scala 396:15 441:38]
  assign Invert_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_352; // @[RISCVALU.scala 398:18 441:38]
  assign AND_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_353; // @[RISCVALU.scala 400:15 441:38]
  assign AND_io_B_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_354; // @[RISCVALU.scala 401:15 441:38]
  assign OR_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_356; // @[RISCVALU.scala 403:14 441:38]
  assign OR_io_B_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_357; // @[RISCVALU.scala 404:14 441:38]
  assign XOR_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_358; // @[RISCVALU.scala 406:15 441:38]
  assign XOR_io_B_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_359; // @[RISCVALU.scala 407:15 441:38]
  assign CLZ_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_360; // @[RISCVALU.scala 409:15 441:38]
  assign CTZ_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_361; // @[RISCVALU.scala 411:15 441:38]
  assign CPOP_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_362; // @[RISCVALU.scala 413:16 441:38]
  assign MAX_io_A_in = io_EXT_SEL == 2'h0 ? $signed(32'sh0) : $signed(_GEN_363); // @[RISCVALU.scala 415:15 441:38]
  assign MAX_io_B_in = io_EXT_SEL == 2'h0 ? $signed(32'sh0) : $signed(_GEN_364); // @[RISCVALU.scala 416:15 441:38]
  assign MAXU_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_365; // @[RISCVALU.scala 418:16 441:38]
  assign MAXU_io_B_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_366; // @[RISCVALU.scala 419:16 441:38]
  assign MIN_io_A_in = io_EXT_SEL == 2'h0 ? $signed(32'sh0) : $signed(_GEN_367); // @[RISCVALU.scala 421:15 441:38]
  assign MIN_io_B_in = io_EXT_SEL == 2'h0 ? $signed(32'sh0) : $signed(_GEN_368); // @[RISCVALU.scala 422:15 441:38]
  assign MINU_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_369; // @[RISCVALU.scala 424:16 441:38]
  assign MINU_io_B_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_370; // @[RISCVALU.scala 425:16 441:38]
  assign SEXTB_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_371; // @[RISCVALU.scala 427:17 441:38]
  assign SEXTH_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_372; // @[RISCVALU.scala 429:17 441:38]
  assign ZEXTH_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_373; // @[RISCVALU.scala 431:17 441:38]
  assign ORCB_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_378; // @[RISCVALU.scala 433:16 441:38]
  assign REV8_io_A_in = io_EXT_SEL == 2'h0 ? 32'h0 : _GEN_379; // @[RISCVALU.scala 435:16 441:38]
  always @(posedge clock) begin
    if (reset) begin // @[RISCVALU.scala 337:19]
      RD <= 32'h0; // @[RISCVALU.scala 337:19]
    end else if (io_EXT_SEL == 2'h0) begin // @[RISCVALU.scala 441:38]
      if (5'h0 == io_ALU_SEL) begin // @[RISCVALU.scala 443:24]
        RD <= Add_io_sum; // @[RISCVALU.scala 452:12]
      end else if (5'h1 == io_ALU_SEL) begin // @[RISCVALU.scala 443:24]
        RD <= Add_io_sum; // @[RISCVALU.scala 462:12]
      end else begin
        RD <= _GEN_4;
      end
    end else if (io_EXT_SEL == 2'h1) begin // @[RISCVALU.scala 477:42]
      if (5'h3 == io_ALU_SEL) begin // @[RISCVALU.scala 479:23]
        RD <= AND_io_and; // @[RISCVALU.scala 489:11]
      end else begin
        RD <= _GEN_229;
      end
    end else if (io_EXT_SEL == 2'h3) begin // @[RISCVALU.scala 672:47]
      RD <= _GEN_337;
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
