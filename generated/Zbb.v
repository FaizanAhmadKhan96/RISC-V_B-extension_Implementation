module ShiftLeft(
  input  [31:0] io_A_in,
  input  [4:0]  io_bits,
  output [31:0] io_A_out
);
  wire [62:0] _GEN_0 = {{31'd0}, io_A_in}; // @[ZbbExt.scala 16:28]
  wire [62:0] A_temp = _GEN_0 << io_bits; // @[ZbbExt.scala 16:28]
  assign io_A_out = A_temp[31:0]; // @[ZbbExt.scala 18:15]
endmodule
module ShiftRight(
  input  [31:0] io_A_in,
  input  [4:0]  io_bits,
  output [31:0] io_A_out
);
  assign io_A_out = io_A_in >> io_bits; // @[ZbbExt.scala 29:28]
endmodule
module InvertBits(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  assign io_A_out = ~io_A_in; // @[ZbbExt.scala 41:20]
endmodule
module ANDBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_and
);
  assign io_and = io_A_in & io_B_in; // @[ZbbExt.scala 54:30]
endmodule
module ORBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_or
);
  assign io_or = io_A_in | io_B_in; // @[ZbbExt.scala 67:29]
endmodule
module XORBits(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_xor
);
  assign io_xor = io_A_in ^ io_B_in; // @[ZbbExt.scala 80:30]
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
  assign io_A_out = io_A_in == 32'h0 ? 6'h20 : {{1'd0}, leadingZeros}; // @[ZbbExt.scala 97:18]
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
  assign io_A_out = io_A_in == 32'h0 ? 6'h20 : {{1'd0}, trailingZeros}; // @[ZbbExt.scala 111:18]
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
  assign io_A_out = {{26'd0}, _io_A_out_T_92}; // @[ZbbExt.scala 122:12]
endmodule
module MaxInstruction(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_max
);
  assign io_max = $signed(io_A_in) < $signed(io_B_in) ? $signed(io_B_in) : $signed(io_A_in); // @[ZbbExt.scala 134:54]
endmodule
module MaxUInstruction(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_maxu
);
  assign io_maxu = io_A_in < io_B_in ? io_B_in : io_A_in; // @[ZbbExt.scala 146:17]
endmodule
module MinInstruction(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_min
);
  assign io_min = $signed(io_A_in) < $signed(io_B_in) ? $signed(io_A_in) : $signed(io_B_in); // @[ZbbExt.scala 158:54]
endmodule
module MinUInstruction(
  input  [31:0] io_A_in,
  input  [31:0] io_B_in,
  output [31:0] io_minu
);
  assign io_minu = io_A_in < io_B_in ? io_A_in : io_B_in; // @[ZbbExt.scala 170:17]
endmodule
module SextB(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [7:0] byte_ = io_A_in[7:0]; // @[ZbbExt.scala 181:21]
  wire [23:0] _signExtended_T_2 = byte_[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  assign io_A_out = {_signExtended_T_2,byte_}; // @[Cat.scala 33:92]
endmodule
module SextH(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [15:0] halfword = io_A_in[15:0]; // @[ZbbExt.scala 198:25]
  wire [15:0] _signExtendedH_T_2 = halfword[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  assign io_A_out = {_signExtendedH_T_2,halfword}; // @[Cat.scala 33:92]
endmodule
module ZextH(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  assign io_A_out = {{16'd0}, io_A_in[15:0]}; // @[ZbbExt.scala 215:37]
endmodule
module OrcB(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [7:0] inputBytes_0 = io_A_in[7:0]; // @[ZbbExt.scala 231:29]
  wire [7:0] inputBytes_1 = io_A_in[15:8]; // @[ZbbExt.scala 231:29]
  wire [7:0] inputBytes_2 = io_A_in[23:16]; // @[ZbbExt.scala 231:29]
  wire [7:0] inputBytes_3 = io_A_in[31:24]; // @[ZbbExt.scala 231:29]
  wire [7:0] outputBytes_0 = inputBytes_0 == 8'h0 ? 8'h0 : 8'hff; // @[ZbbExt.scala 239:33 240:22 242:22]
  wire [7:0] outputBytes_1 = inputBytes_1 == 8'h0 ? 8'h0 : 8'hff; // @[ZbbExt.scala 239:33 240:22 242:22]
  wire [7:0] outputBytes_2 = inputBytes_2 == 8'h0 ? 8'h0 : 8'hff; // @[ZbbExt.scala 239:33 240:22 242:22]
  wire [7:0] outputBytes_3 = inputBytes_3 == 8'h0 ? 8'h0 : 8'hff; // @[ZbbExt.scala 239:33 240:22 242:22]
  wire [15:0] io_A_out_lo = {outputBytes_1,outputBytes_0}; // @[ZbbExt.scala 247:27]
  wire [15:0] io_A_out_hi = {outputBytes_3,outputBytes_2}; // @[ZbbExt.scala 247:27]
  assign io_A_out = {io_A_out_hi,io_A_out_lo}; // @[ZbbExt.scala 247:27]
endmodule
module Rev8(
  input  [31:0] io_A_in,
  output [31:0] io_A_out
);
  wire [7:0] ByteOrder_0 = io_A_in[7:0]; // @[ZbbExt.scala 263:28]
  wire [7:0] ByteOrder_1 = io_A_in[15:8]; // @[ZbbExt.scala 263:28]
  wire [7:0] ByteOrder_2 = io_A_in[23:16]; // @[ZbbExt.scala 263:28]
  wire [7:0] ByteOrder_3 = io_A_in[31:24]; // @[ZbbExt.scala 263:28]
  wire [15:0] io_A_out_lo = {ByteOrder_2,ByteOrder_3}; // @[ZbbExt.scala 270:37]
  wire [15:0] io_A_out_hi = {ByteOrder_0,ByteOrder_1}; // @[ZbbExt.scala 270:37]
  assign io_A_out = {io_A_out_hi,io_A_out_lo}; // @[ZbbExt.scala 270:37]
endmodule
module Zbb(
  input         clock,
  input         reset,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [4:0]  io_INSTR_SEL,
  output [31:0] io_rd
);
  wire [31:0] ShiftL_io_A_in; // @[ZbbExt.scala 287:22]
  wire [4:0] ShiftL_io_bits; // @[ZbbExt.scala 287:22]
  wire [31:0] ShiftL_io_A_out; // @[ZbbExt.scala 287:22]
  wire [31:0] ShiftR_io_A_in; // @[ZbbExt.scala 289:22]
  wire [4:0] ShiftR_io_bits; // @[ZbbExt.scala 289:22]
  wire [31:0] ShiftR_io_A_out; // @[ZbbExt.scala 289:22]
  wire [31:0] Invert_io_A_in; // @[ZbbExt.scala 291:22]
  wire [31:0] Invert_io_A_out; // @[ZbbExt.scala 291:22]
  wire [31:0] AND_io_A_in; // @[ZbbExt.scala 293:19]
  wire [31:0] AND_io_B_in; // @[ZbbExt.scala 293:19]
  wire [31:0] AND_io_and; // @[ZbbExt.scala 293:19]
  wire [31:0] OR_io_A_in; // @[ZbbExt.scala 295:18]
  wire [31:0] OR_io_B_in; // @[ZbbExt.scala 295:18]
  wire [31:0] OR_io_or; // @[ZbbExt.scala 295:18]
  wire [31:0] XOR_io_A_in; // @[ZbbExt.scala 297:19]
  wire [31:0] XOR_io_B_in; // @[ZbbExt.scala 297:19]
  wire [31:0] XOR_io_xor; // @[ZbbExt.scala 297:19]
  wire [31:0] CLZ_io_A_in; // @[ZbbExt.scala 299:19]
  wire [5:0] CLZ_io_A_out; // @[ZbbExt.scala 299:19]
  wire [31:0] CTZ_io_A_in; // @[ZbbExt.scala 301:19]
  wire [5:0] CTZ_io_A_out; // @[ZbbExt.scala 301:19]
  wire [31:0] CPOP_io_A_in; // @[ZbbExt.scala 303:20]
  wire [31:0] CPOP_io_A_out; // @[ZbbExt.scala 303:20]
  wire [31:0] MAX_io_A_in; // @[ZbbExt.scala 305:19]
  wire [31:0] MAX_io_B_in; // @[ZbbExt.scala 305:19]
  wire [31:0] MAX_io_max; // @[ZbbExt.scala 305:19]
  wire [31:0] MAXU_io_A_in; // @[ZbbExt.scala 307:20]
  wire [31:0] MAXU_io_B_in; // @[ZbbExt.scala 307:20]
  wire [31:0] MAXU_io_maxu; // @[ZbbExt.scala 307:20]
  wire [31:0] MIN_io_A_in; // @[ZbbExt.scala 309:19]
  wire [31:0] MIN_io_B_in; // @[ZbbExt.scala 309:19]
  wire [31:0] MIN_io_min; // @[ZbbExt.scala 309:19]
  wire [31:0] MINU_io_A_in; // @[ZbbExt.scala 311:20]
  wire [31:0] MINU_io_B_in; // @[ZbbExt.scala 311:20]
  wire [31:0] MINU_io_minu; // @[ZbbExt.scala 311:20]
  wire [31:0] SEXTB_io_A_in; // @[ZbbExt.scala 313:21]
  wire [31:0] SEXTB_io_A_out; // @[ZbbExt.scala 313:21]
  wire [31:0] SEXTH_io_A_in; // @[ZbbExt.scala 315:21]
  wire [31:0] SEXTH_io_A_out; // @[ZbbExt.scala 315:21]
  wire [31:0] ZEXTH_io_A_in; // @[ZbbExt.scala 317:21]
  wire [31:0] ZEXTH_io_A_out; // @[ZbbExt.scala 317:21]
  wire [31:0] ORCB_io_A_in; // @[ZbbExt.scala 319:20]
  wire [31:0] ORCB_io_A_out; // @[ZbbExt.scala 319:20]
  wire [31:0] REV8_io_A_in; // @[ZbbExt.scala 321:20]
  wire [31:0] REV8_io_A_out; // @[ZbbExt.scala 321:20]
  wire [4:0] shamt = io_rs2[4:0]; // @[ZbbExt.scala 326:18]
  wire [5:0] _GEN_263 = {{1'd0}, shamt}; // @[ZbbExt.scala 452:33]
  wire [5:0] rightShiftBits = 6'h20 - _GEN_263; // @[ZbbExt.scala 452:33]
  wire [4:0] realShamt = shamt[4] ? {{1'd0}, shamt[3:0]} : shamt; // @[ZbbExt.scala 488:26]
  wire [5:0] _GEN_265 = {{1'd0}, realShamt}; // @[ZbbExt.scala 490:32]
  wire [5:0] leftShiftBits_1 = 6'h20 - _GEN_265; // @[ZbbExt.scala 490:32]
  wire [31:0] _GEN_0 = 5'h11 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 373:16 377:24 509:20]
  wire [31:0] _GEN_1 = 5'h11 == io_INSTR_SEL ? REV8_io_A_out : 32'h0; // @[ZbbExt.scala 377:24 510:10]
  wire [31:0] _GEN_2 = 5'h10 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 371:16 377:24 505:20]
  wire [31:0] _GEN_3 = 5'h10 == io_INSTR_SEL ? ORCB_io_A_out : _GEN_1; // @[ZbbExt.scala 377:24 506:10]
  wire [31:0] _GEN_4 = 5'h10 == io_INSTR_SEL ? 32'h0 : _GEN_0; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_5 = 5'hf == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 330:18 377:24 493:22]
  wire [5:0] _GEN_6 = 5'hf == io_INSTR_SEL ? leftShiftBits_1 : 6'h0; // @[ZbbExt.scala 331:18 377:24 494:22]
  wire [4:0] _GEN_7 = 5'hf == io_INSTR_SEL ? realShamt : 5'h0; // @[ZbbExt.scala 334:18 377:24 497:22]
  wire [31:0] _GEN_8 = 5'hf == io_INSTR_SEL ? ShiftR_io_A_out : 32'h0; // @[ZbbExt.scala 341:14 377:24 499:18]
  wire [31:0] _GEN_9 = 5'hf == io_INSTR_SEL ? ShiftL_io_A_out : 32'h0; // @[ZbbExt.scala 342:14 377:24 500:18]
  wire [31:0] _GEN_10 = 5'hf == io_INSTR_SEL ? OR_io_or : _GEN_3; // @[ZbbExt.scala 377:24 502:10]
  wire [31:0] _GEN_11 = 5'hf == io_INSTR_SEL ? 32'h0 : _GEN_2; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_12 = 5'hf == io_INSTR_SEL ? 32'h0 : _GEN_4; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_13 = 5'he == io_INSTR_SEL ? io_rs1 : _GEN_5; // @[ZbbExt.scala 377:24 472:22]
  wire [5:0] _GEN_14 = 5'he == io_INSTR_SEL ? rightShiftBits : _GEN_6; // @[ZbbExt.scala 377:24 473:22]
  wire [4:0] _GEN_15 = 5'he == io_INSTR_SEL ? shamt : _GEN_7; // @[ZbbExt.scala 377:24 476:22]
  wire [31:0] _GEN_16 = 5'he == io_INSTR_SEL ? ShiftR_io_A_out : _GEN_8; // @[ZbbExt.scala 377:24 478:18]
  wire [31:0] _GEN_17 = 5'he == io_INSTR_SEL ? ShiftL_io_A_out : _GEN_9; // @[ZbbExt.scala 377:24 479:18]
  wire [31:0] _GEN_18 = 5'he == io_INSTR_SEL ? OR_io_or : _GEN_10; // @[ZbbExt.scala 377:24 481:10]
  wire [31:0] _GEN_19 = 5'he == io_INSTR_SEL ? 32'h0 : _GEN_11; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_20 = 5'he == io_INSTR_SEL ? 32'h0 : _GEN_12; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_21 = 5'hd == io_INSTR_SEL ? io_rs1 : _GEN_13; // @[ZbbExt.scala 377:24 454:22]
  wire [5:0] _GEN_22 = 5'hd == io_INSTR_SEL ? {{1'd0}, shamt} : _GEN_14; // @[ZbbExt.scala 377:24 455:22]
  wire [5:0] _GEN_23 = 5'hd == io_INSTR_SEL ? rightShiftBits : {{1'd0}, _GEN_15}; // @[ZbbExt.scala 377:24 458:22]
  wire [31:0] _GEN_24 = 5'hd == io_INSTR_SEL ? ShiftL_io_A_out : _GEN_16; // @[ZbbExt.scala 377:24 460:18]
  wire [31:0] _GEN_25 = 5'hd == io_INSTR_SEL ? ShiftR_io_A_out : _GEN_17; // @[ZbbExt.scala 377:24 461:18]
  wire [31:0] _GEN_26 = 5'hd == io_INSTR_SEL ? OR_io_or : _GEN_18; // @[ZbbExt.scala 377:24 463:10]
  wire [31:0] _GEN_27 = 5'hd == io_INSTR_SEL ? 32'h0 : _GEN_19; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_28 = 5'hd == io_INSTR_SEL ? 32'h0 : _GEN_20; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_29 = 5'hc == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 369:17 377:24 444:21]
  wire [31:0] _GEN_30 = 5'hc == io_INSTR_SEL ? ZEXTH_io_A_out : _GEN_26; // @[ZbbExt.scala 377:24 445:10]
  wire [31:0] _GEN_31 = 5'hc == io_INSTR_SEL ? 32'h0 : _GEN_21; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_32 = 5'hc == io_INSTR_SEL ? 6'h0 : _GEN_22; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_33 = 5'hc == io_INSTR_SEL ? 6'h0 : _GEN_23; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_34 = 5'hc == io_INSTR_SEL ? 32'h0 : _GEN_24; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_35 = 5'hc == io_INSTR_SEL ? 32'h0 : _GEN_25; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_36 = 5'hc == io_INSTR_SEL ? 32'h0 : _GEN_27; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_37 = 5'hc == io_INSTR_SEL ? 32'h0 : _GEN_28; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_38 = 5'hb == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 367:17 377:24 440:21]
  wire [31:0] _GEN_39 = 5'hb == io_INSTR_SEL ? SEXTH_io_A_out : _GEN_30; // @[ZbbExt.scala 377:24 441:10]
  wire [31:0] _GEN_40 = 5'hb == io_INSTR_SEL ? 32'h0 : _GEN_29; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_41 = 5'hb == io_INSTR_SEL ? 32'h0 : _GEN_31; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_42 = 5'hb == io_INSTR_SEL ? 6'h0 : _GEN_32; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_43 = 5'hb == io_INSTR_SEL ? 6'h0 : _GEN_33; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_44 = 5'hb == io_INSTR_SEL ? 32'h0 : _GEN_34; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_45 = 5'hb == io_INSTR_SEL ? 32'h0 : _GEN_35; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_46 = 5'hb == io_INSTR_SEL ? 32'h0 : _GEN_36; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_47 = 5'hb == io_INSTR_SEL ? 32'h0 : _GEN_37; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_48 = 5'ha == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 365:17 377:24 436:21]
  wire [31:0] _GEN_49 = 5'ha == io_INSTR_SEL ? SEXTB_io_A_out : _GEN_39; // @[ZbbExt.scala 377:24 437:10]
  wire [31:0] _GEN_50 = 5'ha == io_INSTR_SEL ? 32'h0 : _GEN_38; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_51 = 5'ha == io_INSTR_SEL ? 32'h0 : _GEN_40; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_52 = 5'ha == io_INSTR_SEL ? 32'h0 : _GEN_41; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_53 = 5'ha == io_INSTR_SEL ? 6'h0 : _GEN_42; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_54 = 5'ha == io_INSTR_SEL ? 6'h0 : _GEN_43; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_55 = 5'ha == io_INSTR_SEL ? 32'h0 : _GEN_44; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_56 = 5'ha == io_INSTR_SEL ? 32'h0 : _GEN_45; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_57 = 5'ha == io_INSTR_SEL ? 32'h0 : _GEN_46; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_58 = 5'ha == io_INSTR_SEL ? 32'h0 : _GEN_47; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_59 = 5'h9 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 362:16 377:24 430:20]
  wire [31:0] _GEN_60 = 5'h9 == io_INSTR_SEL ? io_rs2 : 32'h0; // @[ZbbExt.scala 363:16 377:24 431:20]
  wire [31:0] _GEN_61 = 5'h9 == io_INSTR_SEL ? MINU_io_minu : _GEN_49; // @[ZbbExt.scala 377:24 433:10]
  wire [31:0] _GEN_62 = 5'h9 == io_INSTR_SEL ? 32'h0 : _GEN_48; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_63 = 5'h9 == io_INSTR_SEL ? 32'h0 : _GEN_50; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_64 = 5'h9 == io_INSTR_SEL ? 32'h0 : _GEN_51; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_65 = 5'h9 == io_INSTR_SEL ? 32'h0 : _GEN_52; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_66 = 5'h9 == io_INSTR_SEL ? 6'h0 : _GEN_53; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_67 = 5'h9 == io_INSTR_SEL ? 6'h0 : _GEN_54; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_68 = 5'h9 == io_INSTR_SEL ? 32'h0 : _GEN_55; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_69 = 5'h9 == io_INSTR_SEL ? 32'h0 : _GEN_56; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_70 = 5'h9 == io_INSTR_SEL ? 32'h0 : _GEN_57; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_71 = 5'h9 == io_INSTR_SEL ? 32'h0 : _GEN_58; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_72 = 5'h8 == io_INSTR_SEL ? $signed(io_rs1) : $signed(32'sh0); // @[ZbbExt.scala 359:15 377:24 424:19]
  wire [31:0] _GEN_73 = 5'h8 == io_INSTR_SEL ? $signed(io_rs2) : $signed(32'sh0); // @[ZbbExt.scala 360:15 377:24 425:19]
  wire [31:0] _GEN_74 = 5'h8 == io_INSTR_SEL ? MIN_io_min : _GEN_61; // @[ZbbExt.scala 377:24 427:10]
  wire [31:0] _GEN_75 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_59; // @[ZbbExt.scala 362:16 377:24]
  wire [31:0] _GEN_76 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_60; // @[ZbbExt.scala 363:16 377:24]
  wire [31:0] _GEN_77 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_62; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_78 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_63; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_79 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_64; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_80 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_65; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_81 = 5'h8 == io_INSTR_SEL ? 6'h0 : _GEN_66; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_82 = 5'h8 == io_INSTR_SEL ? 6'h0 : _GEN_67; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_83 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_68; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_84 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_69; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_85 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_70; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_86 = 5'h8 == io_INSTR_SEL ? 32'h0 : _GEN_71; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_87 = 5'h7 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 356:16 377:24 418:20]
  wire [31:0] _GEN_88 = 5'h7 == io_INSTR_SEL ? io_rs2 : 32'h0; // @[ZbbExt.scala 357:16 377:24 419:20]
  wire [31:0] _GEN_89 = 5'h7 == io_INSTR_SEL ? MAXU_io_maxu : _GEN_74; // @[ZbbExt.scala 377:24 421:10]
  wire [31:0] _GEN_90 = 5'h7 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_72); // @[ZbbExt.scala 359:15 377:24]
  wire [31:0] _GEN_91 = 5'h7 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_73); // @[ZbbExt.scala 360:15 377:24]
  wire [31:0] _GEN_92 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_75; // @[ZbbExt.scala 362:16 377:24]
  wire [31:0] _GEN_93 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_76; // @[ZbbExt.scala 363:16 377:24]
  wire [31:0] _GEN_94 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_77; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_95 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_78; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_96 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_79; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_97 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_80; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_98 = 5'h7 == io_INSTR_SEL ? 6'h0 : _GEN_81; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_99 = 5'h7 == io_INSTR_SEL ? 6'h0 : _GEN_82; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_100 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_83; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_101 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_84; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_102 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_85; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_103 = 5'h7 == io_INSTR_SEL ? 32'h0 : _GEN_86; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_104 = 5'h6 == io_INSTR_SEL ? $signed(io_rs1) : $signed(32'sh0); // @[ZbbExt.scala 353:15 377:24 412:19]
  wire [31:0] _GEN_105 = 5'h6 == io_INSTR_SEL ? $signed(io_rs2) : $signed(32'sh0); // @[ZbbExt.scala 354:15 377:24 413:19]
  wire [31:0] _GEN_106 = 5'h6 == io_INSTR_SEL ? MAX_io_max : _GEN_89; // @[ZbbExt.scala 377:24 415:10]
  wire [31:0] _GEN_107 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_87; // @[ZbbExt.scala 356:16 377:24]
  wire [31:0] _GEN_108 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_88; // @[ZbbExt.scala 357:16 377:24]
  wire [31:0] _GEN_109 = 5'h6 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_90); // @[ZbbExt.scala 359:15 377:24]
  wire [31:0] _GEN_110 = 5'h6 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_91); // @[ZbbExt.scala 360:15 377:24]
  wire [31:0] _GEN_111 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_92; // @[ZbbExt.scala 362:16 377:24]
  wire [31:0] _GEN_112 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_93; // @[ZbbExt.scala 363:16 377:24]
  wire [31:0] _GEN_113 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_94; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_114 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_95; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_115 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_96; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_116 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_97; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_117 = 5'h6 == io_INSTR_SEL ? 6'h0 : _GEN_98; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_118 = 5'h6 == io_INSTR_SEL ? 6'h0 : _GEN_99; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_119 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_100; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_120 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_101; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_121 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_102; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_122 = 5'h6 == io_INSTR_SEL ? 32'h0 : _GEN_103; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_123 = 5'h5 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 351:16 377:24 408:20]
  wire [31:0] _GEN_124 = 5'h5 == io_INSTR_SEL ? CPOP_io_A_out : _GEN_106; // @[ZbbExt.scala 377:24 409:10]
  wire [31:0] _GEN_125 = 5'h5 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_104); // @[ZbbExt.scala 353:15 377:24]
  wire [31:0] _GEN_126 = 5'h5 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_105); // @[ZbbExt.scala 354:15 377:24]
  wire [31:0] _GEN_127 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_107; // @[ZbbExt.scala 356:16 377:24]
  wire [31:0] _GEN_128 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_108; // @[ZbbExt.scala 357:16 377:24]
  wire [31:0] _GEN_129 = 5'h5 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_109); // @[ZbbExt.scala 359:15 377:24]
  wire [31:0] _GEN_130 = 5'h5 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_110); // @[ZbbExt.scala 360:15 377:24]
  wire [31:0] _GEN_131 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_111; // @[ZbbExt.scala 362:16 377:24]
  wire [31:0] _GEN_132 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_112; // @[ZbbExt.scala 363:16 377:24]
  wire [31:0] _GEN_133 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_113; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_134 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_114; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_135 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_115; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_136 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_116; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_137 = 5'h5 == io_INSTR_SEL ? 6'h0 : _GEN_117; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_138 = 5'h5 == io_INSTR_SEL ? 6'h0 : _GEN_118; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_139 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_119; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_140 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_120; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_141 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_121; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_142 = 5'h5 == io_INSTR_SEL ? 32'h0 : _GEN_122; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_143 = 5'h4 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 349:15 377:24 404:19]
  wire [31:0] _GEN_144 = 5'h4 == io_INSTR_SEL ? {{26'd0}, CTZ_io_A_out} : _GEN_124; // @[ZbbExt.scala 377:24 405:10]
  wire [31:0] _GEN_145 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_123; // @[ZbbExt.scala 351:16 377:24]
  wire [31:0] _GEN_146 = 5'h4 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_125); // @[ZbbExt.scala 353:15 377:24]
  wire [31:0] _GEN_147 = 5'h4 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_126); // @[ZbbExt.scala 354:15 377:24]
  wire [31:0] _GEN_148 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_127; // @[ZbbExt.scala 356:16 377:24]
  wire [31:0] _GEN_149 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_128; // @[ZbbExt.scala 357:16 377:24]
  wire [31:0] _GEN_150 = 5'h4 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_129); // @[ZbbExt.scala 359:15 377:24]
  wire [31:0] _GEN_151 = 5'h4 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_130); // @[ZbbExt.scala 360:15 377:24]
  wire [31:0] _GEN_152 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_131; // @[ZbbExt.scala 362:16 377:24]
  wire [31:0] _GEN_153 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_132; // @[ZbbExt.scala 363:16 377:24]
  wire [31:0] _GEN_154 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_133; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_155 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_134; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_156 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_135; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_157 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_136; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_158 = 5'h4 == io_INSTR_SEL ? 6'h0 : _GEN_137; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_159 = 5'h4 == io_INSTR_SEL ? 6'h0 : _GEN_138; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_160 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_139; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_161 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_140; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_162 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_141; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_163 = 5'h4 == io_INSTR_SEL ? 32'h0 : _GEN_142; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_164 = 5'h3 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 347:15 377:24 400:19]
  wire [31:0] _GEN_165 = 5'h3 == io_INSTR_SEL ? {{26'd0}, CLZ_io_A_out} : _GEN_144; // @[ZbbExt.scala 377:24 401:10]
  wire [31:0] _GEN_166 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_143; // @[ZbbExt.scala 349:15 377:24]
  wire [31:0] _GEN_167 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_145; // @[ZbbExt.scala 351:16 377:24]
  wire [31:0] _GEN_168 = 5'h3 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_146); // @[ZbbExt.scala 353:15 377:24]
  wire [31:0] _GEN_169 = 5'h3 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_147); // @[ZbbExt.scala 354:15 377:24]
  wire [31:0] _GEN_170 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_148; // @[ZbbExt.scala 356:16 377:24]
  wire [31:0] _GEN_171 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_149; // @[ZbbExt.scala 357:16 377:24]
  wire [31:0] _GEN_172 = 5'h3 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_150); // @[ZbbExt.scala 359:15 377:24]
  wire [31:0] _GEN_173 = 5'h3 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_151); // @[ZbbExt.scala 360:15 377:24]
  wire [31:0] _GEN_174 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_152; // @[ZbbExt.scala 362:16 377:24]
  wire [31:0] _GEN_175 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_153; // @[ZbbExt.scala 363:16 377:24]
  wire [31:0] _GEN_176 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_154; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_177 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_155; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_178 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_156; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_179 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_157; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_180 = 5'h3 == io_INSTR_SEL ? 6'h0 : _GEN_158; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_181 = 5'h3 == io_INSTR_SEL ? 6'h0 : _GEN_159; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_182 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_160; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_183 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_161; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_184 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_162; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_185 = 5'h3 == io_INSTR_SEL ? 32'h0 : _GEN_163; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_186 = 5'h2 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 344:15 377:24 393:19]
  wire [31:0] _GEN_187 = 5'h2 == io_INSTR_SEL ? io_rs2 : 32'h0; // @[ZbbExt.scala 345:15 377:24 394:19]
  wire [31:0] _GEN_188 = 5'h2 == io_INSTR_SEL ? XOR_io_xor : 32'h0; // @[ZbbExt.scala 336:18 377:24 396:22]
  wire [31:0] _GEN_189 = 5'h2 == io_INSTR_SEL ? Invert_io_A_out : _GEN_165; // @[ZbbExt.scala 377:24 397:10]
  wire [31:0] _GEN_190 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_164; // @[ZbbExt.scala 347:15 377:24]
  wire [31:0] _GEN_191 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_166; // @[ZbbExt.scala 349:15 377:24]
  wire [31:0] _GEN_192 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_167; // @[ZbbExt.scala 351:16 377:24]
  wire [31:0] _GEN_193 = 5'h2 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_168); // @[ZbbExt.scala 353:15 377:24]
  wire [31:0] _GEN_194 = 5'h2 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_169); // @[ZbbExt.scala 354:15 377:24]
  wire [31:0] _GEN_195 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_170; // @[ZbbExt.scala 356:16 377:24]
  wire [31:0] _GEN_196 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_171; // @[ZbbExt.scala 357:16 377:24]
  wire [31:0] _GEN_197 = 5'h2 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_172); // @[ZbbExt.scala 359:15 377:24]
  wire [31:0] _GEN_198 = 5'h2 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_173); // @[ZbbExt.scala 360:15 377:24]
  wire [31:0] _GEN_199 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_174; // @[ZbbExt.scala 362:16 377:24]
  wire [31:0] _GEN_200 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_175; // @[ZbbExt.scala 363:16 377:24]
  wire [31:0] _GEN_201 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_176; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_202 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_177; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_203 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_178; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_204 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_179; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_205 = 5'h2 == io_INSTR_SEL ? 6'h0 : _GEN_180; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_206 = 5'h2 == io_INSTR_SEL ? 6'h0 : _GEN_181; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_207 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_182; // @[ZbbExt.scala 341:14 377:24]
  wire [31:0] _GEN_208 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_183; // @[ZbbExt.scala 342:14 377:24]
  wire [31:0] _GEN_209 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_184; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_210 = 5'h2 == io_INSTR_SEL ? 32'h0 : _GEN_185; // @[ZbbExt.scala 373:16 377:24]
  wire [31:0] _GEN_211 = 5'h1 == io_INSTR_SEL ? io_rs2 : _GEN_188; // @[ZbbExt.scala 377:24 386:22]
  wire [31:0] _GEN_212 = 5'h1 == io_INSTR_SEL ? io_rs1 : _GEN_207; // @[ZbbExt.scala 377:24 388:18]
  wire [31:0] _GEN_213 = 5'h1 == io_INSTR_SEL ? Invert_io_A_out : _GEN_208; // @[ZbbExt.scala 377:24 389:18]
  wire [31:0] _GEN_214 = 5'h1 == io_INSTR_SEL ? OR_io_or : _GEN_189; // @[ZbbExt.scala 377:24 390:10]
  wire [31:0] _GEN_215 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_186; // @[ZbbExt.scala 344:15 377:24]
  wire [31:0] _GEN_216 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_187; // @[ZbbExt.scala 345:15 377:24]
  wire [31:0] _GEN_217 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_190; // @[ZbbExt.scala 347:15 377:24]
  wire [31:0] _GEN_218 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_191; // @[ZbbExt.scala 349:15 377:24]
  wire [31:0] _GEN_219 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_192; // @[ZbbExt.scala 351:16 377:24]
  wire [31:0] _GEN_220 = 5'h1 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_193); // @[ZbbExt.scala 353:15 377:24]
  wire [31:0] _GEN_221 = 5'h1 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_194); // @[ZbbExt.scala 354:15 377:24]
  wire [31:0] _GEN_222 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_195; // @[ZbbExt.scala 356:16 377:24]
  wire [31:0] _GEN_223 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_196; // @[ZbbExt.scala 357:16 377:24]
  wire [31:0] _GEN_224 = 5'h1 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_197); // @[ZbbExt.scala 359:15 377:24]
  wire [31:0] _GEN_225 = 5'h1 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_198); // @[ZbbExt.scala 360:15 377:24]
  wire [31:0] _GEN_226 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_199; // @[ZbbExt.scala 362:16 377:24]
  wire [31:0] _GEN_227 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_200; // @[ZbbExt.scala 363:16 377:24]
  wire [31:0] _GEN_228 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_201; // @[ZbbExt.scala 365:17 377:24]
  wire [31:0] _GEN_229 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_202; // @[ZbbExt.scala 367:17 377:24]
  wire [31:0] _GEN_230 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_203; // @[ZbbExt.scala 369:17 377:24]
  wire [31:0] _GEN_231 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_204; // @[ZbbExt.scala 330:18 377:24]
  wire [5:0] _GEN_232 = 5'h1 == io_INSTR_SEL ? 6'h0 : _GEN_205; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_233 = 5'h1 == io_INSTR_SEL ? 6'h0 : _GEN_206; // @[ZbbExt.scala 334:18 377:24]
  wire [31:0] _GEN_234 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_209; // @[ZbbExt.scala 371:16 377:24]
  wire [31:0] _GEN_235 = 5'h1 == io_INSTR_SEL ? 32'h0 : _GEN_210; // @[ZbbExt.scala 373:16 377:24]
  wire [5:0] _GEN_259 = 5'h0 == io_INSTR_SEL ? 6'h0 : _GEN_232; // @[ZbbExt.scala 331:18 377:24]
  wire [5:0] _GEN_260 = 5'h0 == io_INSTR_SEL ? 6'h0 : _GEN_233; // @[ZbbExt.scala 334:18 377:24]
  ShiftLeft ShiftL ( // @[ZbbExt.scala 287:22]
    .io_A_in(ShiftL_io_A_in),
    .io_bits(ShiftL_io_bits),
    .io_A_out(ShiftL_io_A_out)
  );
  ShiftRight ShiftR ( // @[ZbbExt.scala 289:22]
    .io_A_in(ShiftR_io_A_in),
    .io_bits(ShiftR_io_bits),
    .io_A_out(ShiftR_io_A_out)
  );
  InvertBits Invert ( // @[ZbbExt.scala 291:22]
    .io_A_in(Invert_io_A_in),
    .io_A_out(Invert_io_A_out)
  );
  ANDBits AND ( // @[ZbbExt.scala 293:19]
    .io_A_in(AND_io_A_in),
    .io_B_in(AND_io_B_in),
    .io_and(AND_io_and)
  );
  ORBits OR ( // @[ZbbExt.scala 295:18]
    .io_A_in(OR_io_A_in),
    .io_B_in(OR_io_B_in),
    .io_or(OR_io_or)
  );
  XORBits XOR ( // @[ZbbExt.scala 297:19]
    .io_A_in(XOR_io_A_in),
    .io_B_in(XOR_io_B_in),
    .io_xor(XOR_io_xor)
  );
  CountLeadingZeros CLZ ( // @[ZbbExt.scala 299:19]
    .io_A_in(CLZ_io_A_in),
    .io_A_out(CLZ_io_A_out)
  );
  CountTrailingZeros CTZ ( // @[ZbbExt.scala 301:19]
    .io_A_in(CTZ_io_A_in),
    .io_A_out(CTZ_io_A_out)
  );
  CountPopulation CPOP ( // @[ZbbExt.scala 303:20]
    .io_A_in(CPOP_io_A_in),
    .io_A_out(CPOP_io_A_out)
  );
  MaxInstruction MAX ( // @[ZbbExt.scala 305:19]
    .io_A_in(MAX_io_A_in),
    .io_B_in(MAX_io_B_in),
    .io_max(MAX_io_max)
  );
  MaxUInstruction MAXU ( // @[ZbbExt.scala 307:20]
    .io_A_in(MAXU_io_A_in),
    .io_B_in(MAXU_io_B_in),
    .io_maxu(MAXU_io_maxu)
  );
  MinInstruction MIN ( // @[ZbbExt.scala 309:19]
    .io_A_in(MIN_io_A_in),
    .io_B_in(MIN_io_B_in),
    .io_min(MIN_io_min)
  );
  MinUInstruction MINU ( // @[ZbbExt.scala 311:20]
    .io_A_in(MINU_io_A_in),
    .io_B_in(MINU_io_B_in),
    .io_minu(MINU_io_minu)
  );
  SextB SEXTB ( // @[ZbbExt.scala 313:21]
    .io_A_in(SEXTB_io_A_in),
    .io_A_out(SEXTB_io_A_out)
  );
  SextH SEXTH ( // @[ZbbExt.scala 315:21]
    .io_A_in(SEXTH_io_A_in),
    .io_A_out(SEXTH_io_A_out)
  );
  ZextH ZEXTH ( // @[ZbbExt.scala 317:21]
    .io_A_in(ZEXTH_io_A_in),
    .io_A_out(ZEXTH_io_A_out)
  );
  OrcB ORCB ( // @[ZbbExt.scala 319:20]
    .io_A_in(ORCB_io_A_in),
    .io_A_out(ORCB_io_A_out)
  );
  Rev8 REV8 ( // @[ZbbExt.scala 321:20]
    .io_A_in(REV8_io_A_in),
    .io_A_out(REV8_io_A_out)
  );
  assign io_rd = 5'h0 == io_INSTR_SEL ? AND_io_and : _GEN_214; // @[ZbbExt.scala 377:24 383:10]
  assign ShiftL_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_231; // @[ZbbExt.scala 330:18 377:24]
  assign ShiftL_io_bits = _GEN_259[4:0];
  assign ShiftR_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_231; // @[ZbbExt.scala 330:18 377:24]
  assign ShiftR_io_bits = _GEN_260[4:0];
  assign Invert_io_A_in = 5'h0 == io_INSTR_SEL ? io_rs2 : _GEN_211; // @[ZbbExt.scala 377:24 379:22]
  assign AND_io_A_in = 5'h0 == io_INSTR_SEL ? io_rs1 : 32'h0; // @[ZbbExt.scala 338:15 377:24 381:19]
  assign AND_io_B_in = 5'h0 == io_INSTR_SEL ? Invert_io_A_out : 32'h0; // @[ZbbExt.scala 339:15 377:24 382:19]
  assign OR_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_212; // @[ZbbExt.scala 341:14 377:24]
  assign OR_io_B_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_213; // @[ZbbExt.scala 342:14 377:24]
  assign XOR_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_215; // @[ZbbExt.scala 344:15 377:24]
  assign XOR_io_B_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_216; // @[ZbbExt.scala 345:15 377:24]
  assign CLZ_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_217; // @[ZbbExt.scala 347:15 377:24]
  assign CTZ_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_218; // @[ZbbExt.scala 349:15 377:24]
  assign CPOP_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_219; // @[ZbbExt.scala 351:16 377:24]
  assign MAX_io_A_in = 5'h0 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_220); // @[ZbbExt.scala 353:15 377:24]
  assign MAX_io_B_in = 5'h0 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_221); // @[ZbbExt.scala 354:15 377:24]
  assign MAXU_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_222; // @[ZbbExt.scala 356:16 377:24]
  assign MAXU_io_B_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_223; // @[ZbbExt.scala 357:16 377:24]
  assign MIN_io_A_in = 5'h0 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_224); // @[ZbbExt.scala 359:15 377:24]
  assign MIN_io_B_in = 5'h0 == io_INSTR_SEL ? $signed(32'sh0) : $signed(_GEN_225); // @[ZbbExt.scala 360:15 377:24]
  assign MINU_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_226; // @[ZbbExt.scala 362:16 377:24]
  assign MINU_io_B_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_227; // @[ZbbExt.scala 363:16 377:24]
  assign SEXTB_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_228; // @[ZbbExt.scala 365:17 377:24]
  assign SEXTH_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_229; // @[ZbbExt.scala 367:17 377:24]
  assign ZEXTH_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_230; // @[ZbbExt.scala 369:17 377:24]
  assign ORCB_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_234; // @[ZbbExt.scala 371:16 377:24]
  assign REV8_io_A_in = 5'h0 == io_INSTR_SEL ? 32'h0 : _GEN_235; // @[ZbbExt.scala 373:16 377:24]
endmodule
