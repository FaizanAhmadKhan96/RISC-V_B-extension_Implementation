circuit PExtALU :
  module ShiftLeft :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip bits : UInt<5>, A_out : UInt<32>}

    node A_temp = dshl(io.A_in, io.bits) @[RISCVALU.scala 17:28]
    io.A_out <= A_temp @[RISCVALU.scala 19:15]

  module ShiftRight :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip bits : UInt<5>, A_out : UInt<32>}

    node A_temp = dshr(io.A_in, io.bits) @[RISCVALU.scala 30:28]
    io.A_out <= A_temp @[RISCVALU.scala 32:15]

  module Adder :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, sum : UInt<32>}

    node _sum_temp_T = add(io.A_in, io.B_in) @[RISCVALU.scala 43:30]
    node sum_temp = tail(_sum_temp_T, 1) @[RISCVALU.scala 43:30]
    io.sum <= sum_temp @[RISCVALU.scala 45:13]

  module InvertBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node A_temp = not(io.A_in) @[RISCVALU.scala 55:20]
    io.A_out <= A_temp @[RISCVALU.scala 57:15]

  module ANDBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, and : UInt<32>}

    node and_temp = and(io.A_in, io.B_in) @[RISCVALU.scala 68:30]
    io.and <= and_temp @[RISCVALU.scala 70:13]

  module ORBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, or : UInt<32>}

    node or_temp = or(io.A_in, io.B_in) @[RISCVALU.scala 81:29]
    io.or <= or_temp @[RISCVALU.scala 83:12]

  module XORBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, xor : UInt<32>}

    node xor_temp = xor(io.A_in, io.B_in) @[RISCVALU.scala 94:30]
    io.xor <= xor_temp @[RISCVALU.scala 96:13]

  module CountLeadingZeros :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<6>}

    node _reversed_T = shl(UInt<16>("hffff"), 16) @[Bitwise.scala 107:52]
    node _reversed_T_1 = xor(UInt<32>("hffffffff"), _reversed_T) @[Bitwise.scala 107:21]
    node _reversed_T_2 = shr(io.A_in, 16) @[Bitwise.scala 108:21]
    node _reversed_T_3 = and(_reversed_T_2, _reversed_T_1) @[Bitwise.scala 108:31]
    node _reversed_T_4 = bits(io.A_in, 15, 0) @[Bitwise.scala 108:46]
    node _reversed_T_5 = shl(_reversed_T_4, 16) @[Bitwise.scala 108:70]
    node _reversed_T_6 = not(_reversed_T_1) @[Bitwise.scala 108:82]
    node _reversed_T_7 = and(_reversed_T_5, _reversed_T_6) @[Bitwise.scala 108:80]
    node _reversed_T_8 = or(_reversed_T_3, _reversed_T_7) @[Bitwise.scala 108:39]
    node _reversed_T_9 = bits(_reversed_T_1, 23, 0) @[Bitwise.scala 107:28]
    node _reversed_T_10 = shl(_reversed_T_9, 8) @[Bitwise.scala 107:52]
    node _reversed_T_11 = xor(_reversed_T_1, _reversed_T_10) @[Bitwise.scala 107:21]
    node _reversed_T_12 = shr(_reversed_T_8, 8) @[Bitwise.scala 108:21]
    node _reversed_T_13 = and(_reversed_T_12, _reversed_T_11) @[Bitwise.scala 108:31]
    node _reversed_T_14 = bits(_reversed_T_8, 23, 0) @[Bitwise.scala 108:46]
    node _reversed_T_15 = shl(_reversed_T_14, 8) @[Bitwise.scala 108:70]
    node _reversed_T_16 = not(_reversed_T_11) @[Bitwise.scala 108:82]
    node _reversed_T_17 = and(_reversed_T_15, _reversed_T_16) @[Bitwise.scala 108:80]
    node _reversed_T_18 = or(_reversed_T_13, _reversed_T_17) @[Bitwise.scala 108:39]
    node _reversed_T_19 = bits(_reversed_T_11, 27, 0) @[Bitwise.scala 107:28]
    node _reversed_T_20 = shl(_reversed_T_19, 4) @[Bitwise.scala 107:52]
    node _reversed_T_21 = xor(_reversed_T_11, _reversed_T_20) @[Bitwise.scala 107:21]
    node _reversed_T_22 = shr(_reversed_T_18, 4) @[Bitwise.scala 108:21]
    node _reversed_T_23 = and(_reversed_T_22, _reversed_T_21) @[Bitwise.scala 108:31]
    node _reversed_T_24 = bits(_reversed_T_18, 27, 0) @[Bitwise.scala 108:46]
    node _reversed_T_25 = shl(_reversed_T_24, 4) @[Bitwise.scala 108:70]
    node _reversed_T_26 = not(_reversed_T_21) @[Bitwise.scala 108:82]
    node _reversed_T_27 = and(_reversed_T_25, _reversed_T_26) @[Bitwise.scala 108:80]
    node _reversed_T_28 = or(_reversed_T_23, _reversed_T_27) @[Bitwise.scala 108:39]
    node _reversed_T_29 = bits(_reversed_T_21, 29, 0) @[Bitwise.scala 107:28]
    node _reversed_T_30 = shl(_reversed_T_29, 2) @[Bitwise.scala 107:52]
    node _reversed_T_31 = xor(_reversed_T_21, _reversed_T_30) @[Bitwise.scala 107:21]
    node _reversed_T_32 = shr(_reversed_T_28, 2) @[Bitwise.scala 108:21]
    node _reversed_T_33 = and(_reversed_T_32, _reversed_T_31) @[Bitwise.scala 108:31]
    node _reversed_T_34 = bits(_reversed_T_28, 29, 0) @[Bitwise.scala 108:46]
    node _reversed_T_35 = shl(_reversed_T_34, 2) @[Bitwise.scala 108:70]
    node _reversed_T_36 = not(_reversed_T_31) @[Bitwise.scala 108:82]
    node _reversed_T_37 = and(_reversed_T_35, _reversed_T_36) @[Bitwise.scala 108:80]
    node _reversed_T_38 = or(_reversed_T_33, _reversed_T_37) @[Bitwise.scala 108:39]
    node _reversed_T_39 = bits(_reversed_T_31, 30, 0) @[Bitwise.scala 107:28]
    node _reversed_T_40 = shl(_reversed_T_39, 1) @[Bitwise.scala 107:52]
    node _reversed_T_41 = xor(_reversed_T_31, _reversed_T_40) @[Bitwise.scala 107:21]
    node _reversed_T_42 = shr(_reversed_T_38, 1) @[Bitwise.scala 108:21]
    node _reversed_T_43 = and(_reversed_T_42, _reversed_T_41) @[Bitwise.scala 108:31]
    node _reversed_T_44 = bits(_reversed_T_38, 30, 0) @[Bitwise.scala 108:46]
    node _reversed_T_45 = shl(_reversed_T_44, 1) @[Bitwise.scala 108:70]
    node _reversed_T_46 = not(_reversed_T_41) @[Bitwise.scala 108:82]
    node _reversed_T_47 = and(_reversed_T_45, _reversed_T_46) @[Bitwise.scala 108:80]
    node reversed = or(_reversed_T_43, _reversed_T_47) @[Bitwise.scala 108:39]
    node _leadingZeros_T = bits(reversed, 0, 0) @[OneHot.scala 47:45]
    node _leadingZeros_T_1 = bits(reversed, 1, 1) @[OneHot.scala 47:45]
    node _leadingZeros_T_2 = bits(reversed, 2, 2) @[OneHot.scala 47:45]
    node _leadingZeros_T_3 = bits(reversed, 3, 3) @[OneHot.scala 47:45]
    node _leadingZeros_T_4 = bits(reversed, 4, 4) @[OneHot.scala 47:45]
    node _leadingZeros_T_5 = bits(reversed, 5, 5) @[OneHot.scala 47:45]
    node _leadingZeros_T_6 = bits(reversed, 6, 6) @[OneHot.scala 47:45]
    node _leadingZeros_T_7 = bits(reversed, 7, 7) @[OneHot.scala 47:45]
    node _leadingZeros_T_8 = bits(reversed, 8, 8) @[OneHot.scala 47:45]
    node _leadingZeros_T_9 = bits(reversed, 9, 9) @[OneHot.scala 47:45]
    node _leadingZeros_T_10 = bits(reversed, 10, 10) @[OneHot.scala 47:45]
    node _leadingZeros_T_11 = bits(reversed, 11, 11) @[OneHot.scala 47:45]
    node _leadingZeros_T_12 = bits(reversed, 12, 12) @[OneHot.scala 47:45]
    node _leadingZeros_T_13 = bits(reversed, 13, 13) @[OneHot.scala 47:45]
    node _leadingZeros_T_14 = bits(reversed, 14, 14) @[OneHot.scala 47:45]
    node _leadingZeros_T_15 = bits(reversed, 15, 15) @[OneHot.scala 47:45]
    node _leadingZeros_T_16 = bits(reversed, 16, 16) @[OneHot.scala 47:45]
    node _leadingZeros_T_17 = bits(reversed, 17, 17) @[OneHot.scala 47:45]
    node _leadingZeros_T_18 = bits(reversed, 18, 18) @[OneHot.scala 47:45]
    node _leadingZeros_T_19 = bits(reversed, 19, 19) @[OneHot.scala 47:45]
    node _leadingZeros_T_20 = bits(reversed, 20, 20) @[OneHot.scala 47:45]
    node _leadingZeros_T_21 = bits(reversed, 21, 21) @[OneHot.scala 47:45]
    node _leadingZeros_T_22 = bits(reversed, 22, 22) @[OneHot.scala 47:45]
    node _leadingZeros_T_23 = bits(reversed, 23, 23) @[OneHot.scala 47:45]
    node _leadingZeros_T_24 = bits(reversed, 24, 24) @[OneHot.scala 47:45]
    node _leadingZeros_T_25 = bits(reversed, 25, 25) @[OneHot.scala 47:45]
    node _leadingZeros_T_26 = bits(reversed, 26, 26) @[OneHot.scala 47:45]
    node _leadingZeros_T_27 = bits(reversed, 27, 27) @[OneHot.scala 47:45]
    node _leadingZeros_T_28 = bits(reversed, 28, 28) @[OneHot.scala 47:45]
    node _leadingZeros_T_29 = bits(reversed, 29, 29) @[OneHot.scala 47:45]
    node _leadingZeros_T_30 = bits(reversed, 30, 30) @[OneHot.scala 47:45]
    node _leadingZeros_T_31 = bits(reversed, 31, 31) @[OneHot.scala 47:45]
    node _leadingZeros_T_32 = mux(_leadingZeros_T_30, UInt<5>("h1e"), UInt<5>("h1f")) @[Mux.scala 47:70]
    node _leadingZeros_T_33 = mux(_leadingZeros_T_29, UInt<5>("h1d"), _leadingZeros_T_32) @[Mux.scala 47:70]
    node _leadingZeros_T_34 = mux(_leadingZeros_T_28, UInt<5>("h1c"), _leadingZeros_T_33) @[Mux.scala 47:70]
    node _leadingZeros_T_35 = mux(_leadingZeros_T_27, UInt<5>("h1b"), _leadingZeros_T_34) @[Mux.scala 47:70]
    node _leadingZeros_T_36 = mux(_leadingZeros_T_26, UInt<5>("h1a"), _leadingZeros_T_35) @[Mux.scala 47:70]
    node _leadingZeros_T_37 = mux(_leadingZeros_T_25, UInt<5>("h19"), _leadingZeros_T_36) @[Mux.scala 47:70]
    node _leadingZeros_T_38 = mux(_leadingZeros_T_24, UInt<5>("h18"), _leadingZeros_T_37) @[Mux.scala 47:70]
    node _leadingZeros_T_39 = mux(_leadingZeros_T_23, UInt<5>("h17"), _leadingZeros_T_38) @[Mux.scala 47:70]
    node _leadingZeros_T_40 = mux(_leadingZeros_T_22, UInt<5>("h16"), _leadingZeros_T_39) @[Mux.scala 47:70]
    node _leadingZeros_T_41 = mux(_leadingZeros_T_21, UInt<5>("h15"), _leadingZeros_T_40) @[Mux.scala 47:70]
    node _leadingZeros_T_42 = mux(_leadingZeros_T_20, UInt<5>("h14"), _leadingZeros_T_41) @[Mux.scala 47:70]
    node _leadingZeros_T_43 = mux(_leadingZeros_T_19, UInt<5>("h13"), _leadingZeros_T_42) @[Mux.scala 47:70]
    node _leadingZeros_T_44 = mux(_leadingZeros_T_18, UInt<5>("h12"), _leadingZeros_T_43) @[Mux.scala 47:70]
    node _leadingZeros_T_45 = mux(_leadingZeros_T_17, UInt<5>("h11"), _leadingZeros_T_44) @[Mux.scala 47:70]
    node _leadingZeros_T_46 = mux(_leadingZeros_T_16, UInt<5>("h10"), _leadingZeros_T_45) @[Mux.scala 47:70]
    node _leadingZeros_T_47 = mux(_leadingZeros_T_15, UInt<4>("hf"), _leadingZeros_T_46) @[Mux.scala 47:70]
    node _leadingZeros_T_48 = mux(_leadingZeros_T_14, UInt<4>("he"), _leadingZeros_T_47) @[Mux.scala 47:70]
    node _leadingZeros_T_49 = mux(_leadingZeros_T_13, UInt<4>("hd"), _leadingZeros_T_48) @[Mux.scala 47:70]
    node _leadingZeros_T_50 = mux(_leadingZeros_T_12, UInt<4>("hc"), _leadingZeros_T_49) @[Mux.scala 47:70]
    node _leadingZeros_T_51 = mux(_leadingZeros_T_11, UInt<4>("hb"), _leadingZeros_T_50) @[Mux.scala 47:70]
    node _leadingZeros_T_52 = mux(_leadingZeros_T_10, UInt<4>("ha"), _leadingZeros_T_51) @[Mux.scala 47:70]
    node _leadingZeros_T_53 = mux(_leadingZeros_T_9, UInt<4>("h9"), _leadingZeros_T_52) @[Mux.scala 47:70]
    node _leadingZeros_T_54 = mux(_leadingZeros_T_8, UInt<4>("h8"), _leadingZeros_T_53) @[Mux.scala 47:70]
    node _leadingZeros_T_55 = mux(_leadingZeros_T_7, UInt<3>("h7"), _leadingZeros_T_54) @[Mux.scala 47:70]
    node _leadingZeros_T_56 = mux(_leadingZeros_T_6, UInt<3>("h6"), _leadingZeros_T_55) @[Mux.scala 47:70]
    node _leadingZeros_T_57 = mux(_leadingZeros_T_5, UInt<3>("h5"), _leadingZeros_T_56) @[Mux.scala 47:70]
    node _leadingZeros_T_58 = mux(_leadingZeros_T_4, UInt<3>("h4"), _leadingZeros_T_57) @[Mux.scala 47:70]
    node _leadingZeros_T_59 = mux(_leadingZeros_T_3, UInt<2>("h3"), _leadingZeros_T_58) @[Mux.scala 47:70]
    node _leadingZeros_T_60 = mux(_leadingZeros_T_2, UInt<2>("h2"), _leadingZeros_T_59) @[Mux.scala 47:70]
    node _leadingZeros_T_61 = mux(_leadingZeros_T_1, UInt<1>("h1"), _leadingZeros_T_60) @[Mux.scala 47:70]
    node leadingZeros = mux(_leadingZeros_T, UInt<1>("h0"), _leadingZeros_T_61) @[Mux.scala 47:70]
    node _io_A_out_T = eq(io.A_in, UInt<1>("h0")) @[RISCVALU.scala 111:27]
    node _io_A_out_T_1 = mux(_io_A_out_T, UInt<6>("h20"), leadingZeros) @[RISCVALU.scala 111:18]
    io.A_out <= _io_A_out_T_1 @[RISCVALU.scala 111:12]

  module CountTrailingZeros :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<6>}

    node _trailingZeros_T = bits(io.A_in, 0, 0) @[OneHot.scala 47:45]
    node _trailingZeros_T_1 = bits(io.A_in, 1, 1) @[OneHot.scala 47:45]
    node _trailingZeros_T_2 = bits(io.A_in, 2, 2) @[OneHot.scala 47:45]
    node _trailingZeros_T_3 = bits(io.A_in, 3, 3) @[OneHot.scala 47:45]
    node _trailingZeros_T_4 = bits(io.A_in, 4, 4) @[OneHot.scala 47:45]
    node _trailingZeros_T_5 = bits(io.A_in, 5, 5) @[OneHot.scala 47:45]
    node _trailingZeros_T_6 = bits(io.A_in, 6, 6) @[OneHot.scala 47:45]
    node _trailingZeros_T_7 = bits(io.A_in, 7, 7) @[OneHot.scala 47:45]
    node _trailingZeros_T_8 = bits(io.A_in, 8, 8) @[OneHot.scala 47:45]
    node _trailingZeros_T_9 = bits(io.A_in, 9, 9) @[OneHot.scala 47:45]
    node _trailingZeros_T_10 = bits(io.A_in, 10, 10) @[OneHot.scala 47:45]
    node _trailingZeros_T_11 = bits(io.A_in, 11, 11) @[OneHot.scala 47:45]
    node _trailingZeros_T_12 = bits(io.A_in, 12, 12) @[OneHot.scala 47:45]
    node _trailingZeros_T_13 = bits(io.A_in, 13, 13) @[OneHot.scala 47:45]
    node _trailingZeros_T_14 = bits(io.A_in, 14, 14) @[OneHot.scala 47:45]
    node _trailingZeros_T_15 = bits(io.A_in, 15, 15) @[OneHot.scala 47:45]
    node _trailingZeros_T_16 = bits(io.A_in, 16, 16) @[OneHot.scala 47:45]
    node _trailingZeros_T_17 = bits(io.A_in, 17, 17) @[OneHot.scala 47:45]
    node _trailingZeros_T_18 = bits(io.A_in, 18, 18) @[OneHot.scala 47:45]
    node _trailingZeros_T_19 = bits(io.A_in, 19, 19) @[OneHot.scala 47:45]
    node _trailingZeros_T_20 = bits(io.A_in, 20, 20) @[OneHot.scala 47:45]
    node _trailingZeros_T_21 = bits(io.A_in, 21, 21) @[OneHot.scala 47:45]
    node _trailingZeros_T_22 = bits(io.A_in, 22, 22) @[OneHot.scala 47:45]
    node _trailingZeros_T_23 = bits(io.A_in, 23, 23) @[OneHot.scala 47:45]
    node _trailingZeros_T_24 = bits(io.A_in, 24, 24) @[OneHot.scala 47:45]
    node _trailingZeros_T_25 = bits(io.A_in, 25, 25) @[OneHot.scala 47:45]
    node _trailingZeros_T_26 = bits(io.A_in, 26, 26) @[OneHot.scala 47:45]
    node _trailingZeros_T_27 = bits(io.A_in, 27, 27) @[OneHot.scala 47:45]
    node _trailingZeros_T_28 = bits(io.A_in, 28, 28) @[OneHot.scala 47:45]
    node _trailingZeros_T_29 = bits(io.A_in, 29, 29) @[OneHot.scala 47:45]
    node _trailingZeros_T_30 = bits(io.A_in, 30, 30) @[OneHot.scala 47:45]
    node _trailingZeros_T_31 = bits(io.A_in, 31, 31) @[OneHot.scala 47:45]
    node _trailingZeros_T_32 = mux(_trailingZeros_T_30, UInt<5>("h1e"), UInt<5>("h1f")) @[Mux.scala 47:70]
    node _trailingZeros_T_33 = mux(_trailingZeros_T_29, UInt<5>("h1d"), _trailingZeros_T_32) @[Mux.scala 47:70]
    node _trailingZeros_T_34 = mux(_trailingZeros_T_28, UInt<5>("h1c"), _trailingZeros_T_33) @[Mux.scala 47:70]
    node _trailingZeros_T_35 = mux(_trailingZeros_T_27, UInt<5>("h1b"), _trailingZeros_T_34) @[Mux.scala 47:70]
    node _trailingZeros_T_36 = mux(_trailingZeros_T_26, UInt<5>("h1a"), _trailingZeros_T_35) @[Mux.scala 47:70]
    node _trailingZeros_T_37 = mux(_trailingZeros_T_25, UInt<5>("h19"), _trailingZeros_T_36) @[Mux.scala 47:70]
    node _trailingZeros_T_38 = mux(_trailingZeros_T_24, UInt<5>("h18"), _trailingZeros_T_37) @[Mux.scala 47:70]
    node _trailingZeros_T_39 = mux(_trailingZeros_T_23, UInt<5>("h17"), _trailingZeros_T_38) @[Mux.scala 47:70]
    node _trailingZeros_T_40 = mux(_trailingZeros_T_22, UInt<5>("h16"), _trailingZeros_T_39) @[Mux.scala 47:70]
    node _trailingZeros_T_41 = mux(_trailingZeros_T_21, UInt<5>("h15"), _trailingZeros_T_40) @[Mux.scala 47:70]
    node _trailingZeros_T_42 = mux(_trailingZeros_T_20, UInt<5>("h14"), _trailingZeros_T_41) @[Mux.scala 47:70]
    node _trailingZeros_T_43 = mux(_trailingZeros_T_19, UInt<5>("h13"), _trailingZeros_T_42) @[Mux.scala 47:70]
    node _trailingZeros_T_44 = mux(_trailingZeros_T_18, UInt<5>("h12"), _trailingZeros_T_43) @[Mux.scala 47:70]
    node _trailingZeros_T_45 = mux(_trailingZeros_T_17, UInt<5>("h11"), _trailingZeros_T_44) @[Mux.scala 47:70]
    node _trailingZeros_T_46 = mux(_trailingZeros_T_16, UInt<5>("h10"), _trailingZeros_T_45) @[Mux.scala 47:70]
    node _trailingZeros_T_47 = mux(_trailingZeros_T_15, UInt<4>("hf"), _trailingZeros_T_46) @[Mux.scala 47:70]
    node _trailingZeros_T_48 = mux(_trailingZeros_T_14, UInt<4>("he"), _trailingZeros_T_47) @[Mux.scala 47:70]
    node _trailingZeros_T_49 = mux(_trailingZeros_T_13, UInt<4>("hd"), _trailingZeros_T_48) @[Mux.scala 47:70]
    node _trailingZeros_T_50 = mux(_trailingZeros_T_12, UInt<4>("hc"), _trailingZeros_T_49) @[Mux.scala 47:70]
    node _trailingZeros_T_51 = mux(_trailingZeros_T_11, UInt<4>("hb"), _trailingZeros_T_50) @[Mux.scala 47:70]
    node _trailingZeros_T_52 = mux(_trailingZeros_T_10, UInt<4>("ha"), _trailingZeros_T_51) @[Mux.scala 47:70]
    node _trailingZeros_T_53 = mux(_trailingZeros_T_9, UInt<4>("h9"), _trailingZeros_T_52) @[Mux.scala 47:70]
    node _trailingZeros_T_54 = mux(_trailingZeros_T_8, UInt<4>("h8"), _trailingZeros_T_53) @[Mux.scala 47:70]
    node _trailingZeros_T_55 = mux(_trailingZeros_T_7, UInt<3>("h7"), _trailingZeros_T_54) @[Mux.scala 47:70]
    node _trailingZeros_T_56 = mux(_trailingZeros_T_6, UInt<3>("h6"), _trailingZeros_T_55) @[Mux.scala 47:70]
    node _trailingZeros_T_57 = mux(_trailingZeros_T_5, UInt<3>("h5"), _trailingZeros_T_56) @[Mux.scala 47:70]
    node _trailingZeros_T_58 = mux(_trailingZeros_T_4, UInt<3>("h4"), _trailingZeros_T_57) @[Mux.scala 47:70]
    node _trailingZeros_T_59 = mux(_trailingZeros_T_3, UInt<2>("h3"), _trailingZeros_T_58) @[Mux.scala 47:70]
    node _trailingZeros_T_60 = mux(_trailingZeros_T_2, UInt<2>("h2"), _trailingZeros_T_59) @[Mux.scala 47:70]
    node _trailingZeros_T_61 = mux(_trailingZeros_T_1, UInt<1>("h1"), _trailingZeros_T_60) @[Mux.scala 47:70]
    node trailingZeros = mux(_trailingZeros_T, UInt<1>("h0"), _trailingZeros_T_61) @[Mux.scala 47:70]
    node _io_A_out_T = eq(io.A_in, UInt<1>("h0")) @[RISCVALU.scala 125:27]
    node _io_A_out_T_1 = mux(_io_A_out_T, UInt<6>("h20"), trailingZeros) @[RISCVALU.scala 125:18]
    io.A_out <= _io_A_out_T_1 @[RISCVALU.scala 125:12]

  module CountPopulation :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node _io_A_out_T = bits(io.A_in, 0, 0) @[Bitwise.scala 53:100]
    node _io_A_out_T_1 = bits(io.A_in, 1, 1) @[Bitwise.scala 53:100]
    node _io_A_out_T_2 = bits(io.A_in, 2, 2) @[Bitwise.scala 53:100]
    node _io_A_out_T_3 = bits(io.A_in, 3, 3) @[Bitwise.scala 53:100]
    node _io_A_out_T_4 = bits(io.A_in, 4, 4) @[Bitwise.scala 53:100]
    node _io_A_out_T_5 = bits(io.A_in, 5, 5) @[Bitwise.scala 53:100]
    node _io_A_out_T_6 = bits(io.A_in, 6, 6) @[Bitwise.scala 53:100]
    node _io_A_out_T_7 = bits(io.A_in, 7, 7) @[Bitwise.scala 53:100]
    node _io_A_out_T_8 = bits(io.A_in, 8, 8) @[Bitwise.scala 53:100]
    node _io_A_out_T_9 = bits(io.A_in, 9, 9) @[Bitwise.scala 53:100]
    node _io_A_out_T_10 = bits(io.A_in, 10, 10) @[Bitwise.scala 53:100]
    node _io_A_out_T_11 = bits(io.A_in, 11, 11) @[Bitwise.scala 53:100]
    node _io_A_out_T_12 = bits(io.A_in, 12, 12) @[Bitwise.scala 53:100]
    node _io_A_out_T_13 = bits(io.A_in, 13, 13) @[Bitwise.scala 53:100]
    node _io_A_out_T_14 = bits(io.A_in, 14, 14) @[Bitwise.scala 53:100]
    node _io_A_out_T_15 = bits(io.A_in, 15, 15) @[Bitwise.scala 53:100]
    node _io_A_out_T_16 = bits(io.A_in, 16, 16) @[Bitwise.scala 53:100]
    node _io_A_out_T_17 = bits(io.A_in, 17, 17) @[Bitwise.scala 53:100]
    node _io_A_out_T_18 = bits(io.A_in, 18, 18) @[Bitwise.scala 53:100]
    node _io_A_out_T_19 = bits(io.A_in, 19, 19) @[Bitwise.scala 53:100]
    node _io_A_out_T_20 = bits(io.A_in, 20, 20) @[Bitwise.scala 53:100]
    node _io_A_out_T_21 = bits(io.A_in, 21, 21) @[Bitwise.scala 53:100]
    node _io_A_out_T_22 = bits(io.A_in, 22, 22) @[Bitwise.scala 53:100]
    node _io_A_out_T_23 = bits(io.A_in, 23, 23) @[Bitwise.scala 53:100]
    node _io_A_out_T_24 = bits(io.A_in, 24, 24) @[Bitwise.scala 53:100]
    node _io_A_out_T_25 = bits(io.A_in, 25, 25) @[Bitwise.scala 53:100]
    node _io_A_out_T_26 = bits(io.A_in, 26, 26) @[Bitwise.scala 53:100]
    node _io_A_out_T_27 = bits(io.A_in, 27, 27) @[Bitwise.scala 53:100]
    node _io_A_out_T_28 = bits(io.A_in, 28, 28) @[Bitwise.scala 53:100]
    node _io_A_out_T_29 = bits(io.A_in, 29, 29) @[Bitwise.scala 53:100]
    node _io_A_out_T_30 = bits(io.A_in, 30, 30) @[Bitwise.scala 53:100]
    node _io_A_out_T_31 = bits(io.A_in, 31, 31) @[Bitwise.scala 53:100]
    node _io_A_out_T_32 = add(_io_A_out_T, _io_A_out_T_1) @[Bitwise.scala 51:90]
    node _io_A_out_T_33 = bits(_io_A_out_T_32, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_34 = add(_io_A_out_T_2, _io_A_out_T_3) @[Bitwise.scala 51:90]
    node _io_A_out_T_35 = bits(_io_A_out_T_34, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_36 = add(_io_A_out_T_33, _io_A_out_T_35) @[Bitwise.scala 51:90]
    node _io_A_out_T_37 = bits(_io_A_out_T_36, 2, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_38 = add(_io_A_out_T_4, _io_A_out_T_5) @[Bitwise.scala 51:90]
    node _io_A_out_T_39 = bits(_io_A_out_T_38, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_40 = add(_io_A_out_T_6, _io_A_out_T_7) @[Bitwise.scala 51:90]
    node _io_A_out_T_41 = bits(_io_A_out_T_40, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_42 = add(_io_A_out_T_39, _io_A_out_T_41) @[Bitwise.scala 51:90]
    node _io_A_out_T_43 = bits(_io_A_out_T_42, 2, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_44 = add(_io_A_out_T_37, _io_A_out_T_43) @[Bitwise.scala 51:90]
    node _io_A_out_T_45 = bits(_io_A_out_T_44, 3, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_46 = add(_io_A_out_T_8, _io_A_out_T_9) @[Bitwise.scala 51:90]
    node _io_A_out_T_47 = bits(_io_A_out_T_46, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_48 = add(_io_A_out_T_10, _io_A_out_T_11) @[Bitwise.scala 51:90]
    node _io_A_out_T_49 = bits(_io_A_out_T_48, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_50 = add(_io_A_out_T_47, _io_A_out_T_49) @[Bitwise.scala 51:90]
    node _io_A_out_T_51 = bits(_io_A_out_T_50, 2, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_52 = add(_io_A_out_T_12, _io_A_out_T_13) @[Bitwise.scala 51:90]
    node _io_A_out_T_53 = bits(_io_A_out_T_52, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_54 = add(_io_A_out_T_14, _io_A_out_T_15) @[Bitwise.scala 51:90]
    node _io_A_out_T_55 = bits(_io_A_out_T_54, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_56 = add(_io_A_out_T_53, _io_A_out_T_55) @[Bitwise.scala 51:90]
    node _io_A_out_T_57 = bits(_io_A_out_T_56, 2, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_58 = add(_io_A_out_T_51, _io_A_out_T_57) @[Bitwise.scala 51:90]
    node _io_A_out_T_59 = bits(_io_A_out_T_58, 3, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_60 = add(_io_A_out_T_45, _io_A_out_T_59) @[Bitwise.scala 51:90]
    node _io_A_out_T_61 = bits(_io_A_out_T_60, 4, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_62 = add(_io_A_out_T_16, _io_A_out_T_17) @[Bitwise.scala 51:90]
    node _io_A_out_T_63 = bits(_io_A_out_T_62, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_64 = add(_io_A_out_T_18, _io_A_out_T_19) @[Bitwise.scala 51:90]
    node _io_A_out_T_65 = bits(_io_A_out_T_64, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_66 = add(_io_A_out_T_63, _io_A_out_T_65) @[Bitwise.scala 51:90]
    node _io_A_out_T_67 = bits(_io_A_out_T_66, 2, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_68 = add(_io_A_out_T_20, _io_A_out_T_21) @[Bitwise.scala 51:90]
    node _io_A_out_T_69 = bits(_io_A_out_T_68, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_70 = add(_io_A_out_T_22, _io_A_out_T_23) @[Bitwise.scala 51:90]
    node _io_A_out_T_71 = bits(_io_A_out_T_70, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_72 = add(_io_A_out_T_69, _io_A_out_T_71) @[Bitwise.scala 51:90]
    node _io_A_out_T_73 = bits(_io_A_out_T_72, 2, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_74 = add(_io_A_out_T_67, _io_A_out_T_73) @[Bitwise.scala 51:90]
    node _io_A_out_T_75 = bits(_io_A_out_T_74, 3, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_76 = add(_io_A_out_T_24, _io_A_out_T_25) @[Bitwise.scala 51:90]
    node _io_A_out_T_77 = bits(_io_A_out_T_76, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_78 = add(_io_A_out_T_26, _io_A_out_T_27) @[Bitwise.scala 51:90]
    node _io_A_out_T_79 = bits(_io_A_out_T_78, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_80 = add(_io_A_out_T_77, _io_A_out_T_79) @[Bitwise.scala 51:90]
    node _io_A_out_T_81 = bits(_io_A_out_T_80, 2, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_82 = add(_io_A_out_T_28, _io_A_out_T_29) @[Bitwise.scala 51:90]
    node _io_A_out_T_83 = bits(_io_A_out_T_82, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_84 = add(_io_A_out_T_30, _io_A_out_T_31) @[Bitwise.scala 51:90]
    node _io_A_out_T_85 = bits(_io_A_out_T_84, 1, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_86 = add(_io_A_out_T_83, _io_A_out_T_85) @[Bitwise.scala 51:90]
    node _io_A_out_T_87 = bits(_io_A_out_T_86, 2, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_88 = add(_io_A_out_T_81, _io_A_out_T_87) @[Bitwise.scala 51:90]
    node _io_A_out_T_89 = bits(_io_A_out_T_88, 3, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_90 = add(_io_A_out_T_75, _io_A_out_T_89) @[Bitwise.scala 51:90]
    node _io_A_out_T_91 = bits(_io_A_out_T_90, 4, 0) @[Bitwise.scala 51:90]
    node _io_A_out_T_92 = add(_io_A_out_T_61, _io_A_out_T_91) @[Bitwise.scala 51:90]
    node _io_A_out_T_93 = bits(_io_A_out_T_92, 5, 0) @[Bitwise.scala 51:90]
    io.A_out <= _io_A_out_T_93 @[RISCVALU.scala 136:12]

  module MaxInstruction :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : SInt<32>, flip B_in : SInt<32>, max : UInt<32>}

    node _io_max_T = lt(io.A_in, io.B_in) @[RISCVALU.scala 148:25]
    node _io_max_T_1 = mux(_io_max_T, io.B_in, io.A_in) @[RISCVALU.scala 148:16]
    node _io_max_T_2 = asUInt(_io_max_T_1) @[RISCVALU.scala 148:54]
    io.max <= _io_max_T_2 @[RISCVALU.scala 148:10]

  module MaxUInstruction :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, maxu : UInt<32>}

    node _io_maxu_T = lt(io.A_in, io.B_in) @[RISCVALU.scala 160:26]
    node _io_maxu_T_1 = mux(_io_maxu_T, io.B_in, io.A_in) @[RISCVALU.scala 160:17]
    io.maxu <= _io_maxu_T_1 @[RISCVALU.scala 160:11]

  module MinInstruction :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : SInt<32>, flip B_in : SInt<32>, min : UInt<32>}

    node _io_min_T = lt(io.A_in, io.B_in) @[RISCVALU.scala 172:25]
    node _io_min_T_1 = mux(_io_min_T, io.A_in, io.B_in) @[RISCVALU.scala 172:16]
    node _io_min_T_2 = asUInt(_io_min_T_1) @[RISCVALU.scala 172:54]
    io.min <= _io_min_T_2 @[RISCVALU.scala 172:10]

  module MinUInstruction :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, minu : UInt<32>}

    node _io_minu_T = lt(io.A_in, io.B_in) @[RISCVALU.scala 184:26]
    node _io_minu_T_1 = mux(_io_minu_T, io.A_in, io.B_in) @[RISCVALU.scala 184:17]
    io.minu <= _io_minu_T_1 @[RISCVALU.scala 184:11]

  module SextB :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node byte = bits(io.A_in, 7, 0) @[RISCVALU.scala 195:21]
    node _signExtended_T = bits(byte, 7, 7) @[RISCVALU.scala 198:39]
    node _signExtended_T_1 = bits(_signExtended_T, 0, 0) @[Bitwise.scala 77:15]
    node _signExtended_T_2 = mux(_signExtended_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 77:12]
    node signExtended = cat(_signExtended_T_2, byte) @[Cat.scala 33:92]
    io.A_out <= signExtended @[RISCVALU.scala 201:12]

  module SextH :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node halfword = bits(io.A_in, 15, 0) @[RISCVALU.scala 212:25]
    node _signExtendedH_T = bits(halfword, 15, 15) @[RISCVALU.scala 215:44]
    node _signExtendedH_T_1 = bits(_signExtendedH_T, 0, 0) @[Bitwise.scala 77:15]
    node _signExtendedH_T_2 = mux(_signExtendedH_T_1, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 77:12]
    node signExtendedH = cat(_signExtendedH_T_2, halfword) @[Cat.scala 33:92]
    io.A_out <= signExtendedH @[RISCVALU.scala 218:12]

  module ZextH :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node _io_A_out_T = bits(io.A_in, 15, 0) @[RISCVALU.scala 229:22]
    node _io_A_out_T_1 = mux(UInt<1>("h1"), UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 77:12]
    node _io_A_out_T_2 = and(_io_A_out_T, _io_A_out_T_1) @[RISCVALU.scala 229:37]
    io.A_out <= _io_A_out_T_2 @[RISCVALU.scala 229:12]

  module OrcB :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    wire inputBytes : UInt<8>[4] @[RISCVALU.scala 241:24]
    node _inputBytes_0_T = bits(io.A_in, 7, 0) @[RISCVALU.scala 245:29]
    inputBytes[0] <= _inputBytes_0_T @[RISCVALU.scala 245:19]
    node _inputBytes_1_T = bits(io.A_in, 15, 8) @[RISCVALU.scala 245:29]
    inputBytes[1] <= _inputBytes_1_T @[RISCVALU.scala 245:19]
    node _inputBytes_2_T = bits(io.A_in, 23, 16) @[RISCVALU.scala 245:29]
    inputBytes[2] <= _inputBytes_2_T @[RISCVALU.scala 245:19]
    node _inputBytes_3_T = bits(io.A_in, 31, 24) @[RISCVALU.scala 245:29]
    inputBytes[3] <= _inputBytes_3_T @[RISCVALU.scala 245:19]
    wire outputBytes : UInt<8>[4] @[RISCVALU.scala 249:25]
    node _T = eq(inputBytes[0], UInt<1>("h0")) @[RISCVALU.scala 253:24]
    when _T : @[RISCVALU.scala 253:33]
      outputBytes[0] <= UInt<1>("h0") @[RISCVALU.scala 254:22]
    else :
      outputBytes[0] <= UInt<8>("hff") @[RISCVALU.scala 256:22]
    node _T_1 = eq(inputBytes[1], UInt<1>("h0")) @[RISCVALU.scala 253:24]
    when _T_1 : @[RISCVALU.scala 253:33]
      outputBytes[1] <= UInt<1>("h0") @[RISCVALU.scala 254:22]
    else :
      outputBytes[1] <= UInt<8>("hff") @[RISCVALU.scala 256:22]
    node _T_2 = eq(inputBytes[2], UInt<1>("h0")) @[RISCVALU.scala 253:24]
    when _T_2 : @[RISCVALU.scala 253:33]
      outputBytes[2] <= UInt<1>("h0") @[RISCVALU.scala 254:22]
    else :
      outputBytes[2] <= UInt<8>("hff") @[RISCVALU.scala 256:22]
    node _T_3 = eq(inputBytes[3], UInt<1>("h0")) @[RISCVALU.scala 253:24]
    when _T_3 : @[RISCVALU.scala 253:33]
      outputBytes[3] <= UInt<1>("h0") @[RISCVALU.scala 254:22]
    else :
      outputBytes[3] <= UInt<8>("hff") @[RISCVALU.scala 256:22]
    node io_A_out_lo = cat(outputBytes[1], outputBytes[0]) @[RISCVALU.scala 261:27]
    node io_A_out_hi = cat(outputBytes[3], outputBytes[2]) @[RISCVALU.scala 261:27]
    node _io_A_out_T = cat(io_A_out_hi, io_A_out_lo) @[RISCVALU.scala 261:27]
    io.A_out <= _io_A_out_T @[RISCVALU.scala 261:12]

  module Rev8 :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    wire ByteOrder : UInt<8>[4] @[RISCVALU.scala 275:23]
    node _ByteOrder_0_T = bits(io.A_in, 7, 0) @[RISCVALU.scala 277:28]
    ByteOrder[0] <= _ByteOrder_0_T @[RISCVALU.scala 277:18]
    node _ByteOrder_1_T = bits(io.A_in, 15, 8) @[RISCVALU.scala 277:28]
    ByteOrder[1] <= _ByteOrder_1_T @[RISCVALU.scala 277:18]
    node _ByteOrder_2_T = bits(io.A_in, 23, 16) @[RISCVALU.scala 277:28]
    ByteOrder[2] <= _ByteOrder_2_T @[RISCVALU.scala 277:18]
    node _ByteOrder_3_T = bits(io.A_in, 31, 24) @[RISCVALU.scala 277:28]
    ByteOrder[3] <= _ByteOrder_3_T @[RISCVALU.scala 277:18]
    wire _io_A_out_WIRE : UInt<8>[4] @[RISCVALU.scala 284:22]
    _io_A_out_WIRE[0] <= ByteOrder[3] @[RISCVALU.scala 284:22]
    _io_A_out_WIRE[1] <= ByteOrder[2] @[RISCVALU.scala 284:22]
    _io_A_out_WIRE[2] <= ByteOrder[1] @[RISCVALU.scala 284:22]
    _io_A_out_WIRE[3] <= ByteOrder[0] @[RISCVALU.scala 284:22]
    node io_A_out_lo = cat(_io_A_out_WIRE[1], _io_A_out_WIRE[0]) @[RISCVALU.scala 284:37]
    node io_A_out_hi = cat(_io_A_out_WIRE[3], _io_A_out_WIRE[2]) @[RISCVALU.scala 284:37]
    node _io_A_out_T = cat(io_A_out_hi, io_A_out_lo) @[RISCVALU.scala 284:37]
    io.A_out <= _io_A_out_T @[RISCVALU.scala 284:12]

  module PExtALU :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rs1 : UInt<32>, flip rs2 : UInt<32>, flip ALU_SEL : UInt<5>, flip EXT_SEL : UInt<2>, rd : UInt<32>}

    node signed_RS1 = asSInt(io.rs1) @[RISCVALU.scala 334:24]
    node signed_RS2 = asSInt(io.rs2) @[RISCVALU.scala 335:24]
    reg RD : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[RISCVALU.scala 337:19]
    node index = and(io.rs2, UInt<5>("h1f")) @[RISCVALU.scala 339:19]
    node _isReserved_T = bits(io.rs2, 5, 5) @[RISCVALU.scala 342:23]
    node isReserved = eq(_isReserved_T, UInt<1>("h1")) @[RISCVALU.scala 342:27]
    inst ShiftL of ShiftLeft @[RISCVALU.scala 344:22]
    ShiftL.clock <= clock
    ShiftL.reset <= reset
    inst ShiftR of ShiftRight @[RISCVALU.scala 346:22]
    ShiftR.clock <= clock
    ShiftR.reset <= reset
    inst Add of Adder @[RISCVALU.scala 348:19]
    Add.clock <= clock
    Add.reset <= reset
    inst Invert of InvertBits @[RISCVALU.scala 350:22]
    Invert.clock <= clock
    Invert.reset <= reset
    inst AND of ANDBits @[RISCVALU.scala 352:19]
    AND.clock <= clock
    AND.reset <= reset
    inst OR of ORBits @[RISCVALU.scala 354:18]
    OR.clock <= clock
    OR.reset <= reset
    inst XOR of XORBits @[RISCVALU.scala 356:19]
    XOR.clock <= clock
    XOR.reset <= reset
    inst CLZ of CountLeadingZeros @[RISCVALU.scala 358:19]
    CLZ.clock <= clock
    CLZ.reset <= reset
    inst CTZ of CountTrailingZeros @[RISCVALU.scala 360:19]
    CTZ.clock <= clock
    CTZ.reset <= reset
    inst CPOP of CountPopulation @[RISCVALU.scala 362:20]
    CPOP.clock <= clock
    CPOP.reset <= reset
    inst MAX of MaxInstruction @[RISCVALU.scala 364:19]
    MAX.clock <= clock
    MAX.reset <= reset
    inst MAXU of MaxUInstruction @[RISCVALU.scala 366:20]
    MAXU.clock <= clock
    MAXU.reset <= reset
    inst MIN of MinInstruction @[RISCVALU.scala 368:19]
    MIN.clock <= clock
    MIN.reset <= reset
    inst MINU of MinUInstruction @[RISCVALU.scala 370:20]
    MINU.clock <= clock
    MINU.reset <= reset
    inst SEXTB of SextB @[RISCVALU.scala 372:21]
    SEXTB.clock <= clock
    SEXTB.reset <= reset
    inst SEXTH of SextH @[RISCVALU.scala 374:21]
    SEXTH.clock <= clock
    SEXTH.reset <= reset
    inst ZEXTH of ZextH @[RISCVALU.scala 376:21]
    ZEXTH.clock <= clock
    ZEXTH.reset <= reset
    inst ORCB of OrcB @[RISCVALU.scala 378:20]
    ORCB.clock <= clock
    ORCB.reset <= reset
    inst REV8 of Rev8 @[RISCVALU.scala 380:20]
    REV8.clock <= clock
    REV8.reset <= reset
    ShiftL.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 389:18]
    ShiftL.io.bits <= UInt<1>("h0") @[RISCVALU.scala 390:18]
    ShiftR.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 392:18]
    ShiftR.io.bits <= UInt<1>("h0") @[RISCVALU.scala 393:18]
    Add.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 395:15]
    Add.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 396:15]
    Invert.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 398:18]
    AND.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 400:15]
    AND.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 401:15]
    OR.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 403:14]
    OR.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 404:14]
    XOR.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 406:15]
    XOR.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 407:15]
    CLZ.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 409:15]
    CTZ.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 411:15]
    CPOP.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 413:16]
    MAX.io.A_in <= asSInt(UInt<1>("h0")) @[RISCVALU.scala 415:15]
    MAX.io.B_in <= asSInt(UInt<1>("h0")) @[RISCVALU.scala 416:15]
    MAXU.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 418:16]
    MAXU.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 419:16]
    MIN.io.A_in <= asSInt(UInt<1>("h0")) @[RISCVALU.scala 421:15]
    MIN.io.B_in <= asSInt(UInt<1>("h0")) @[RISCVALU.scala 422:15]
    MINU.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 424:16]
    MINU.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 425:16]
    SEXTB.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 427:17]
    SEXTH.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 429:17]
    ZEXTH.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 431:17]
    ORCB.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 433:16]
    REV8.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 435:16]
    node _T = eq(io.EXT_SEL, UInt<1>("h0")) @[RISCVALU.scala 441:19]
    when _T : @[RISCVALU.scala 441:38]
      node _T_1 = asUInt(UInt<1>("h0")) @[RISCVALU.scala 443:24]
      node _T_2 = asUInt(io.ALU_SEL) @[RISCVALU.scala 443:24]
      node _T_3 = eq(_T_1, _T_2) @[RISCVALU.scala 443:24]
      when _T_3 : @[RISCVALU.scala 443:24]
        ShiftL.io.A_in <= io.rs1 @[RISCVALU.scala 447:24]
        ShiftL.io.bits <= UInt<1>("h1") @[RISCVALU.scala 448:24]
        Add.io.A_in <= ShiftL.io.A_out @[RISCVALU.scala 450:21]
        Add.io.B_in <= io.rs2 @[RISCVALU.scala 451:21]
        RD <= Add.io.sum @[RISCVALU.scala 452:12]
      else :
        node _T_4 = asUInt(UInt<1>("h1")) @[RISCVALU.scala 443:24]
        node _T_5 = asUInt(io.ALU_SEL) @[RISCVALU.scala 443:24]
        node _T_6 = eq(_T_4, _T_5) @[RISCVALU.scala 443:24]
        when _T_6 : @[RISCVALU.scala 443:24]
          ShiftL.io.A_in <= io.rs1 @[RISCVALU.scala 457:24]
          ShiftL.io.bits <= UInt<2>("h2") @[RISCVALU.scala 458:24]
          Add.io.A_in <= ShiftL.io.A_out @[RISCVALU.scala 460:21]
          Add.io.B_in <= io.rs2 @[RISCVALU.scala 461:21]
          RD <= Add.io.sum @[RISCVALU.scala 462:12]
        else :
          node _T_7 = asUInt(UInt<2>("h2")) @[RISCVALU.scala 443:24]
          node _T_8 = asUInt(io.ALU_SEL) @[RISCVALU.scala 443:24]
          node _T_9 = eq(_T_7, _T_8) @[RISCVALU.scala 443:24]
          when _T_9 : @[RISCVALU.scala 443:24]
            ShiftL.io.A_in <= io.rs1 @[RISCVALU.scala 467:24]
            ShiftL.io.bits <= UInt<2>("h3") @[RISCVALU.scala 468:24]
            Add.io.A_in <= ShiftL.io.A_out @[RISCVALU.scala 470:21]
            Add.io.B_in <= io.rs2 @[RISCVALU.scala 471:21]
            RD <= Add.io.sum @[RISCVALU.scala 472:12]
    else :
      node _T_10 = eq(io.EXT_SEL, UInt<1>("h1")) @[RISCVALU.scala 477:23]
      when _T_10 : @[RISCVALU.scala 477:42]
        node _T_11 = asUInt(UInt<2>("h3")) @[RISCVALU.scala 479:23]
        node _T_12 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
        node _T_13 = eq(_T_11, _T_12) @[RISCVALU.scala 479:23]
        when _T_13 : @[RISCVALU.scala 479:23]
          Invert.io.A_in <= io.rs2 @[RISCVALU.scala 485:23]
          AND.io.A_in <= io.rs1 @[RISCVALU.scala 487:20]
          AND.io.B_in <= Invert.io.A_out @[RISCVALU.scala 488:20]
          RD <= AND.io.and @[RISCVALU.scala 489:11]
        else :
          node _T_14 = asUInt(UInt<3>("h4")) @[RISCVALU.scala 479:23]
          node _T_15 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
          node _T_16 = eq(_T_14, _T_15) @[RISCVALU.scala 479:23]
          when _T_16 : @[RISCVALU.scala 479:23]
            Invert.io.A_in <= io.rs2 @[RISCVALU.scala 494:23]
            OR.io.A_in <= io.rs1 @[RISCVALU.scala 496:19]
            OR.io.B_in <= Invert.io.A_out @[RISCVALU.scala 497:19]
            RD <= OR.io.or @[RISCVALU.scala 498:11]
          else :
            node _T_17 = asUInt(UInt<3>("h5")) @[RISCVALU.scala 479:23]
            node _T_18 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
            node _T_19 = eq(_T_17, _T_18) @[RISCVALU.scala 479:23]
            when _T_19 : @[RISCVALU.scala 479:23]
              XOR.io.A_in <= io.rs1 @[RISCVALU.scala 504:20]
              XOR.io.B_in <= io.rs2 @[RISCVALU.scala 505:20]
              Invert.io.A_in <= XOR.io.xor @[RISCVALU.scala 507:23]
              RD <= Invert.io.A_out @[RISCVALU.scala 508:11]
            else :
              node _T_20 = asUInt(UInt<3>("h6")) @[RISCVALU.scala 479:23]
              node _T_21 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
              node _T_22 = eq(_T_20, _T_21) @[RISCVALU.scala 479:23]
              when _T_22 : @[RISCVALU.scala 479:23]
                CLZ.io.A_in <= io.rs1 @[RISCVALU.scala 513:21]
                RD <= CLZ.io.A_out @[RISCVALU.scala 514:12]
              else :
                node _T_23 = asUInt(UInt<3>("h7")) @[RISCVALU.scala 479:23]
                node _T_24 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                node _T_25 = eq(_T_23, _T_24) @[RISCVALU.scala 479:23]
                when _T_25 : @[RISCVALU.scala 479:23]
                  CTZ.io.A_in <= io.rs1 @[RISCVALU.scala 519:21]
                  RD <= CTZ.io.A_out @[RISCVALU.scala 520:12]
                else :
                  node _T_26 = asUInt(UInt<4>("h8")) @[RISCVALU.scala 479:23]
                  node _T_27 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                  node _T_28 = eq(_T_26, _T_27) @[RISCVALU.scala 479:23]
                  when _T_28 : @[RISCVALU.scala 479:23]
                    CPOP.io.A_in <= io.rs1 @[RISCVALU.scala 525:22]
                    RD <= CPOP.io.A_out @[RISCVALU.scala 526:12]
                  else :
                    node _T_29 = asUInt(UInt<4>("h9")) @[RISCVALU.scala 479:23]
                    node _T_30 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                    node _T_31 = eq(_T_29, _T_30) @[RISCVALU.scala 479:23]
                    when _T_31 : @[RISCVALU.scala 479:23]
                      MAX.io.A_in <= signed_RS1 @[RISCVALU.scala 532:20]
                      MAX.io.B_in <= signed_RS2 @[RISCVALU.scala 533:20]
                      RD <= MAX.io.max @[RISCVALU.scala 535:11]
                    else :
                      node _T_32 = asUInt(UInt<4>("ha")) @[RISCVALU.scala 479:23]
                      node _T_33 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                      node _T_34 = eq(_T_32, _T_33) @[RISCVALU.scala 479:23]
                      when _T_34 : @[RISCVALU.scala 479:23]
                        MAXU.io.A_in <= io.rs1 @[RISCVALU.scala 541:21]
                        MAXU.io.B_in <= io.rs2 @[RISCVALU.scala 542:21]
                        RD <= MAXU.io.maxu @[RISCVALU.scala 544:11]
                      else :
                        node _T_35 = asUInt(UInt<4>("hb")) @[RISCVALU.scala 479:23]
                        node _T_36 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                        node _T_37 = eq(_T_35, _T_36) @[RISCVALU.scala 479:23]
                        when _T_37 : @[RISCVALU.scala 479:23]
                          MIN.io.A_in <= signed_RS1 @[RISCVALU.scala 550:20]
                          MIN.io.B_in <= signed_RS2 @[RISCVALU.scala 551:20]
                          RD <= MIN.io.min @[RISCVALU.scala 553:11]
                        else :
                          node _T_38 = asUInt(UInt<4>("hc")) @[RISCVALU.scala 479:23]
                          node _T_39 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                          node _T_40 = eq(_T_38, _T_39) @[RISCVALU.scala 479:23]
                          when _T_40 : @[RISCVALU.scala 479:23]
                            MINU.io.A_in <= io.rs1 @[RISCVALU.scala 559:21]
                            MINU.io.B_in <= io.rs2 @[RISCVALU.scala 560:21]
                            RD <= MINU.io.minu @[RISCVALU.scala 562:11]
                          else :
                            node _T_41 = asUInt(UInt<4>("hd")) @[RISCVALU.scala 479:23]
                            node _T_42 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                            node _T_43 = eq(_T_41, _T_42) @[RISCVALU.scala 479:23]
                            when _T_43 : @[RISCVALU.scala 479:23]
                              SEXTB.io.A_in <= io.rs1 @[RISCVALU.scala 567:23]
                              RD <= SEXTB.io.A_out @[RISCVALU.scala 568:12]
                            else :
                              node _T_44 = asUInt(UInt<4>("he")) @[RISCVALU.scala 479:23]
                              node _T_45 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                              node _T_46 = eq(_T_44, _T_45) @[RISCVALU.scala 479:23]
                              when _T_46 : @[RISCVALU.scala 479:23]
                                SEXTH.io.A_in <= io.rs1 @[RISCVALU.scala 573:23]
                                RD <= SEXTH.io.A_out @[RISCVALU.scala 574:12]
                              else :
                                node _T_47 = asUInt(UInt<4>("hf")) @[RISCVALU.scala 479:23]
                                node _T_48 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                                node _T_49 = eq(_T_47, _T_48) @[RISCVALU.scala 479:23]
                                when _T_49 : @[RISCVALU.scala 479:23]
                                  ZEXTH.io.A_in <= io.rs1 @[RISCVALU.scala 579:23]
                                  RD <= ZEXTH.io.A_out @[RISCVALU.scala 580:12]
                                else :
                                  node _T_50 = asUInt(UInt<5>("h10")) @[RISCVALU.scala 479:23]
                                  node _T_51 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                                  node _T_52 = eq(_T_50, _T_51) @[RISCVALU.scala 479:23]
                                  when _T_52 : @[RISCVALU.scala 479:23]
                                    node shamt = bits(io.rs2, 4, 0) @[RISCVALU.scala 587:24]
                                    node _rightShiftBits_T = sub(UInt<6>("h20"), shamt) @[RISCVALU.scala 590:35]
                                    node rightShiftBits = tail(_rightShiftBits_T, 1) @[RISCVALU.scala 590:35]
                                    ShiftL.io.A_in <= io.rs1 @[RISCVALU.scala 592:24]
                                    ShiftL.io.bits <= shamt @[RISCVALU.scala 593:24]
                                    ShiftR.io.A_in <= io.rs1 @[RISCVALU.scala 595:24]
                                    ShiftR.io.bits <= rightShiftBits @[RISCVALU.scala 596:24]
                                    OR.io.A_in <= ShiftL.io.A_out @[RISCVALU.scala 598:20]
                                    OR.io.B_in <= ShiftR.io.A_out @[RISCVALU.scala 599:20]
                                    RD <= OR.io.or @[RISCVALU.scala 601:12]
                                  else :
                                    node _T_53 = asUInt(UInt<5>("h11")) @[RISCVALU.scala 479:23]
                                    node _T_54 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                                    node _T_55 = eq(_T_53, _T_54) @[RISCVALU.scala 479:23]
                                    when _T_55 : @[RISCVALU.scala 479:23]
                                      node shamt_1 = bits(io.rs2, 4, 0) @[RISCVALU.scala 608:24]
                                      node _leftShiftBits_T = sub(UInt<6>("h20"), shamt_1) @[RISCVALU.scala 610:34]
                                      node leftShiftBits = tail(_leftShiftBits_T, 1) @[RISCVALU.scala 610:34]
                                      ShiftL.io.A_in <= io.rs1 @[RISCVALU.scala 613:24]
                                      ShiftL.io.bits <= leftShiftBits @[RISCVALU.scala 614:24]
                                      ShiftR.io.A_in <= io.rs1 @[RISCVALU.scala 616:24]
                                      ShiftR.io.bits <= shamt_1 @[RISCVALU.scala 617:24]
                                      OR.io.A_in <= ShiftR.io.A_out @[RISCVALU.scala 619:20]
                                      OR.io.B_in <= ShiftL.io.A_out @[RISCVALU.scala 620:20]
                                      RD <= OR.io.or @[RISCVALU.scala 622:12]
                                    else :
                                      node _T_56 = asUInt(UInt<5>("h12")) @[RISCVALU.scala 479:23]
                                      node _T_57 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                                      node _T_58 = eq(_T_56, _T_57) @[RISCVALU.scala 479:23]
                                      when _T_58 : @[RISCVALU.scala 479:23]
                                        node shamt_2 = bits(io.rs2, 4, 0) @[RISCVALU.scala 629:24]
                                        node _leftShiftBits_T_1 = sub(UInt<6>("h20"), shamt_2) @[RISCVALU.scala 631:34]
                                        node leftShiftBits_1 = tail(_leftShiftBits_T_1, 1) @[RISCVALU.scala 631:34]
                                        ShiftL.io.A_in <= io.rs1 @[RISCVALU.scala 634:24]
                                        ShiftL.io.bits <= leftShiftBits_1 @[RISCVALU.scala 635:24]
                                        ShiftR.io.A_in <= io.rs1 @[RISCVALU.scala 637:24]
                                        ShiftR.io.bits <= shamt_2 @[RISCVALU.scala 638:24]
                                        OR.io.A_in <= ShiftR.io.A_out @[RISCVALU.scala 640:20]
                                        OR.io.B_in <= ShiftL.io.A_out @[RISCVALU.scala 641:20]
                                        RD <= OR.io.or @[RISCVALU.scala 650:12]
                                      else :
                                        node _T_59 = asUInt(UInt<5>("h13")) @[RISCVALU.scala 479:23]
                                        node _T_60 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                                        node _T_61 = eq(_T_59, _T_60) @[RISCVALU.scala 479:23]
                                        when _T_61 : @[RISCVALU.scala 479:23]
                                          ORCB.io.A_in <= io.rs1 @[RISCVALU.scala 655:22]
                                          RD <= ORCB.io.A_out @[RISCVALU.scala 656:12]
                                        else :
                                          node _T_62 = asUInt(UInt<5>("h14")) @[RISCVALU.scala 479:23]
                                          node _T_63 = asUInt(io.ALU_SEL) @[RISCVALU.scala 479:23]
                                          node _T_64 = eq(_T_62, _T_63) @[RISCVALU.scala 479:23]
                                          when _T_64 : @[RISCVALU.scala 479:23]
                                            REV8.io.A_in <= io.rs1 @[RISCVALU.scala 661:22]
                                            RD <= REV8.io.A_out @[RISCVALU.scala 662:12]
      else :
        node _T_65 = eq(io.EXT_SEL, UInt<2>("h3")) @[RISCVALU.scala 672:28]
        when _T_65 : @[RISCVALU.scala 672:47]
          node _T_66 = asUInt(UInt<5>("h16")) @[RISCVALU.scala 674:27]
          node _T_67 = asUInt(io.ALU_SEL) @[RISCVALU.scala 674:27]
          node _T_68 = eq(_T_66, _T_67) @[RISCVALU.scala 674:27]
          when _T_68 : @[RISCVALU.scala 674:27]
            ShiftL.io.A_in <= UInt<1>("h1") @[RISCVALU.scala 684:24]
            ShiftL.io.bits <= index @[RISCVALU.scala 685:24]
            Invert.io.A_in <= ShiftL.io.A_out @[RISCVALU.scala 687:24]
            AND.io.A_in <= io.rs1 @[RISCVALU.scala 689:21]
            AND.io.B_in <= Invert.io.A_out @[RISCVALU.scala 690:21]
            RD <= AND.io.and @[RISCVALU.scala 692:12]
          else :
            node _T_69 = asUInt(UInt<5>("h17")) @[RISCVALU.scala 674:27]
            node _T_70 = asUInt(io.ALU_SEL) @[RISCVALU.scala 674:27]
            node _T_71 = eq(_T_69, _T_70) @[RISCVALU.scala 674:27]
            when _T_71 : @[RISCVALU.scala 674:27]
              node _T_72 = eq(isReserved, UInt<1>("h0")) @[RISCVALU.scala 697:16]
              when _T_72 : @[RISCVALU.scala 697:29]
                ShiftL.io.A_in <= UInt<1>("h1") @[RISCVALU.scala 698:26]
                ShiftL.io.bits <= index @[RISCVALU.scala 699:26]
                Invert.io.A_in <= ShiftL.io.A_out @[RISCVALU.scala 701:26]
                AND.io.A_in <= io.rs1 @[RISCVALU.scala 703:23]
                AND.io.B_in <= Invert.io.A_out @[RISCVALU.scala 704:23]
                RD <= AND.io.and @[RISCVALU.scala 705:14]
              else :
                RD <= UInt<1>("h0") @[RISCVALU.scala 708:14]
            else :
              node _T_73 = asUInt(UInt<5>("h18")) @[RISCVALU.scala 674:27]
              node _T_74 = asUInt(io.ALU_SEL) @[RISCVALU.scala 674:27]
              node _T_75 = eq(_T_73, _T_74) @[RISCVALU.scala 674:27]
              when _T_75 : @[RISCVALU.scala 674:27]
                ShiftR.io.A_in <= io.rs1 @[RISCVALU.scala 715:24]
                ShiftR.io.bits <= index @[RISCVALU.scala 716:24]
                AND.io.A_in <= ShiftR.io.A_out @[RISCVALU.scala 718:21]
                AND.io.B_in <= UInt<1>("h1") @[RISCVALU.scala 719:21]
                RD <= AND.io.and @[RISCVALU.scala 721:12]
              else :
                node _T_76 = asUInt(UInt<5>("h19")) @[RISCVALU.scala 674:27]
                node _T_77 = asUInt(io.ALU_SEL) @[RISCVALU.scala 674:27]
                node _T_78 = eq(_T_76, _T_77) @[RISCVALU.scala 674:27]
                when _T_78 : @[RISCVALU.scala 674:27]
                  node _T_79 = eq(isReserved, UInt<1>("h0")) @[RISCVALU.scala 726:16]
                  when _T_79 : @[RISCVALU.scala 726:29]
                    ShiftR.io.A_in <= io.rs1 @[RISCVALU.scala 727:26]
                    ShiftR.io.bits <= index @[RISCVALU.scala 728:26]
                    AND.io.A_in <= ShiftR.io.A_out @[RISCVALU.scala 730:23]
                    AND.io.B_in <= UInt<1>("h1") @[RISCVALU.scala 731:23]
                    RD <= AND.io.and @[RISCVALU.scala 732:14]
                  else :
                    RD <= UInt<1>("h0") @[RISCVALU.scala 735:14]
                else :
                  node _T_80 = asUInt(UInt<5>("h1c")) @[RISCVALU.scala 674:27]
                  node _T_81 = asUInt(io.ALU_SEL) @[RISCVALU.scala 674:27]
                  node _T_82 = eq(_T_80, _T_81) @[RISCVALU.scala 674:27]
                  when _T_82 : @[RISCVALU.scala 674:27]
                    ShiftL.io.A_in <= UInt<1>("h1") @[RISCVALU.scala 742:24]
                    ShiftL.io.bits <= index @[RISCVALU.scala 743:24]
                    OR.io.A_in <= io.rs1 @[RISCVALU.scala 745:20]
                    OR.io.B_in <= ShiftL.io.A_out @[RISCVALU.scala 746:20]
                    RD <= OR.io.or @[RISCVALU.scala 748:12]
                  else :
                    node _T_83 = asUInt(UInt<5>("h1d")) @[RISCVALU.scala 674:27]
                    node _T_84 = asUInt(io.ALU_SEL) @[RISCVALU.scala 674:27]
                    node _T_85 = eq(_T_83, _T_84) @[RISCVALU.scala 674:27]
                    when _T_85 : @[RISCVALU.scala 674:27]
                      node _T_86 = eq(isReserved, UInt<1>("h0")) @[RISCVALU.scala 753:16]
                      when _T_86 : @[RISCVALU.scala 753:29]
                        ShiftL.io.A_in <= UInt<1>("h1") @[RISCVALU.scala 754:26]
                        ShiftL.io.bits <= index @[RISCVALU.scala 755:26]
                        OR.io.A_in <= io.rs1 @[RISCVALU.scala 757:22]
                        OR.io.B_in <= ShiftL.io.A_out @[RISCVALU.scala 758:22]
                        RD <= OR.io.or @[RISCVALU.scala 760:14]
                      else :
                        RD <= UInt<1>("h0") @[RISCVALU.scala 763:14]
    io.rd <= RD @[RISCVALU.scala 770:9]

