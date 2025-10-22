circuit Zbb :
  module ShiftLeft :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip bits : UInt<5>, A_out : UInt<32>}

    node A_temp = dshl(io.A_in, io.bits) @[ZbbExt.scala 16:28]
    io.A_out <= A_temp @[ZbbExt.scala 18:15]

  module ShiftRight :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip bits : UInt<5>, A_out : UInt<32>}

    node A_temp = dshr(io.A_in, io.bits) @[ZbbExt.scala 29:28]
    io.A_out <= A_temp @[ZbbExt.scala 31:15]

  module InvertBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node A_temp = not(io.A_in) @[ZbbExt.scala 41:20]
    io.A_out <= A_temp @[ZbbExt.scala 43:15]

  module ANDBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, and : UInt<32>}

    node and_temp = and(io.A_in, io.B_in) @[ZbbExt.scala 54:30]
    io.and <= and_temp @[ZbbExt.scala 56:13]

  module ORBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, or : UInt<32>}

    node or_temp = or(io.A_in, io.B_in) @[ZbbExt.scala 67:29]
    io.or <= or_temp @[ZbbExt.scala 69:12]

  module XORBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, xor : UInt<32>}

    node xor_temp = xor(io.A_in, io.B_in) @[ZbbExt.scala 80:30]
    io.xor <= xor_temp @[ZbbExt.scala 82:13]

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
    node _io_A_out_T = eq(io.A_in, UInt<1>("h0")) @[ZbbExt.scala 97:27]
    node _io_A_out_T_1 = mux(_io_A_out_T, UInt<6>("h20"), leadingZeros) @[ZbbExt.scala 97:18]
    io.A_out <= _io_A_out_T_1 @[ZbbExt.scala 97:12]

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
    node _io_A_out_T = eq(io.A_in, UInt<1>("h0")) @[ZbbExt.scala 111:27]
    node _io_A_out_T_1 = mux(_io_A_out_T, UInt<6>("h20"), trailingZeros) @[ZbbExt.scala 111:18]
    io.A_out <= _io_A_out_T_1 @[ZbbExt.scala 111:12]

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
    io.A_out <= _io_A_out_T_93 @[ZbbExt.scala 122:12]

  module MaxInstruction :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : SInt<32>, flip B_in : SInt<32>, max : UInt<32>}

    node _io_max_T = lt(io.A_in, io.B_in) @[ZbbExt.scala 134:25]
    node _io_max_T_1 = mux(_io_max_T, io.B_in, io.A_in) @[ZbbExt.scala 134:16]
    node _io_max_T_2 = asUInt(_io_max_T_1) @[ZbbExt.scala 134:54]
    io.max <= _io_max_T_2 @[ZbbExt.scala 134:10]

  module MaxUInstruction :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, maxu : UInt<32>}

    node _io_maxu_T = lt(io.A_in, io.B_in) @[ZbbExt.scala 146:26]
    node _io_maxu_T_1 = mux(_io_maxu_T, io.B_in, io.A_in) @[ZbbExt.scala 146:17]
    io.maxu <= _io_maxu_T_1 @[ZbbExt.scala 146:11]

  module MinInstruction :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : SInt<32>, flip B_in : SInt<32>, min : UInt<32>}

    node _io_min_T = lt(io.A_in, io.B_in) @[ZbbExt.scala 158:25]
    node _io_min_T_1 = mux(_io_min_T, io.A_in, io.B_in) @[ZbbExt.scala 158:16]
    node _io_min_T_2 = asUInt(_io_min_T_1) @[ZbbExt.scala 158:54]
    io.min <= _io_min_T_2 @[ZbbExt.scala 158:10]

  module MinUInstruction :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, minu : UInt<32>}

    node _io_minu_T = lt(io.A_in, io.B_in) @[ZbbExt.scala 170:26]
    node _io_minu_T_1 = mux(_io_minu_T, io.A_in, io.B_in) @[ZbbExt.scala 170:17]
    io.minu <= _io_minu_T_1 @[ZbbExt.scala 170:11]

  module SextB :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node byte = bits(io.A_in, 7, 0) @[ZbbExt.scala 181:21]
    node _signExtended_T = bits(byte, 7, 7) @[ZbbExt.scala 184:39]
    node _signExtended_T_1 = bits(_signExtended_T, 0, 0) @[Bitwise.scala 77:15]
    node _signExtended_T_2 = mux(_signExtended_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 77:12]
    node signExtended = cat(_signExtended_T_2, byte) @[Cat.scala 33:92]
    io.A_out <= signExtended @[ZbbExt.scala 187:12]

  module SextH :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node halfword = bits(io.A_in, 15, 0) @[ZbbExt.scala 198:25]
    node _signExtendedH_T = bits(halfword, 15, 15) @[ZbbExt.scala 201:44]
    node _signExtendedH_T_1 = bits(_signExtendedH_T, 0, 0) @[Bitwise.scala 77:15]
    node _signExtendedH_T_2 = mux(_signExtendedH_T_1, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 77:12]
    node signExtendedH = cat(_signExtendedH_T_2, halfword) @[Cat.scala 33:92]
    io.A_out <= signExtendedH @[ZbbExt.scala 204:12]

  module ZextH :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node _io_A_out_T = bits(io.A_in, 15, 0) @[ZbbExt.scala 215:22]
    node _io_A_out_T_1 = mux(UInt<1>("h1"), UInt<32>("hffffffff"), UInt<32>("h0")) @[Bitwise.scala 77:12]
    node _io_A_out_T_2 = and(_io_A_out_T, _io_A_out_T_1) @[ZbbExt.scala 215:37]
    io.A_out <= _io_A_out_T_2 @[ZbbExt.scala 215:12]

  module OrcB :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    wire inputBytes : UInt<8>[4] @[ZbbExt.scala 227:24]
    node _inputBytes_0_T = bits(io.A_in, 7, 0) @[ZbbExt.scala 231:29]
    inputBytes[0] <= _inputBytes_0_T @[ZbbExt.scala 231:19]
    node _inputBytes_1_T = bits(io.A_in, 15, 8) @[ZbbExt.scala 231:29]
    inputBytes[1] <= _inputBytes_1_T @[ZbbExt.scala 231:19]
    node _inputBytes_2_T = bits(io.A_in, 23, 16) @[ZbbExt.scala 231:29]
    inputBytes[2] <= _inputBytes_2_T @[ZbbExt.scala 231:19]
    node _inputBytes_3_T = bits(io.A_in, 31, 24) @[ZbbExt.scala 231:29]
    inputBytes[3] <= _inputBytes_3_T @[ZbbExt.scala 231:19]
    wire outputBytes : UInt<8>[4] @[ZbbExt.scala 235:25]
    node _T = eq(inputBytes[0], UInt<1>("h0")) @[ZbbExt.scala 239:24]
    when _T : @[ZbbExt.scala 239:33]
      outputBytes[0] <= UInt<1>("h0") @[ZbbExt.scala 240:22]
    else :
      outputBytes[0] <= UInt<8>("hff") @[ZbbExt.scala 242:22]
    node _T_1 = eq(inputBytes[1], UInt<1>("h0")) @[ZbbExt.scala 239:24]
    when _T_1 : @[ZbbExt.scala 239:33]
      outputBytes[1] <= UInt<1>("h0") @[ZbbExt.scala 240:22]
    else :
      outputBytes[1] <= UInt<8>("hff") @[ZbbExt.scala 242:22]
    node _T_2 = eq(inputBytes[2], UInt<1>("h0")) @[ZbbExt.scala 239:24]
    when _T_2 : @[ZbbExt.scala 239:33]
      outputBytes[2] <= UInt<1>("h0") @[ZbbExt.scala 240:22]
    else :
      outputBytes[2] <= UInt<8>("hff") @[ZbbExt.scala 242:22]
    node _T_3 = eq(inputBytes[3], UInt<1>("h0")) @[ZbbExt.scala 239:24]
    when _T_3 : @[ZbbExt.scala 239:33]
      outputBytes[3] <= UInt<1>("h0") @[ZbbExt.scala 240:22]
    else :
      outputBytes[3] <= UInt<8>("hff") @[ZbbExt.scala 242:22]
    node io_A_out_lo = cat(outputBytes[1], outputBytes[0]) @[ZbbExt.scala 247:27]
    node io_A_out_hi = cat(outputBytes[3], outputBytes[2]) @[ZbbExt.scala 247:27]
    node _io_A_out_T = cat(io_A_out_hi, io_A_out_lo) @[ZbbExt.scala 247:27]
    io.A_out <= _io_A_out_T @[ZbbExt.scala 247:12]

  module Rev8 :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    wire ByteOrder : UInt<8>[4] @[ZbbExt.scala 261:23]
    node _ByteOrder_0_T = bits(io.A_in, 7, 0) @[ZbbExt.scala 263:28]
    ByteOrder[0] <= _ByteOrder_0_T @[ZbbExt.scala 263:18]
    node _ByteOrder_1_T = bits(io.A_in, 15, 8) @[ZbbExt.scala 263:28]
    ByteOrder[1] <= _ByteOrder_1_T @[ZbbExt.scala 263:18]
    node _ByteOrder_2_T = bits(io.A_in, 23, 16) @[ZbbExt.scala 263:28]
    ByteOrder[2] <= _ByteOrder_2_T @[ZbbExt.scala 263:18]
    node _ByteOrder_3_T = bits(io.A_in, 31, 24) @[ZbbExt.scala 263:28]
    ByteOrder[3] <= _ByteOrder_3_T @[ZbbExt.scala 263:18]
    wire _io_A_out_WIRE : UInt<8>[4] @[ZbbExt.scala 270:22]
    _io_A_out_WIRE[0] <= ByteOrder[3] @[ZbbExt.scala 270:22]
    _io_A_out_WIRE[1] <= ByteOrder[2] @[ZbbExt.scala 270:22]
    _io_A_out_WIRE[2] <= ByteOrder[1] @[ZbbExt.scala 270:22]
    _io_A_out_WIRE[3] <= ByteOrder[0] @[ZbbExt.scala 270:22]
    node io_A_out_lo = cat(_io_A_out_WIRE[1], _io_A_out_WIRE[0]) @[ZbbExt.scala 270:37]
    node io_A_out_hi = cat(_io_A_out_WIRE[3], _io_A_out_WIRE[2]) @[ZbbExt.scala 270:37]
    node _io_A_out_T = cat(io_A_out_hi, io_A_out_lo) @[ZbbExt.scala 270:37]
    io.A_out <= _io_A_out_T @[ZbbExt.scala 270:12]

  module Zbb :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rs1 : UInt<32>, flip rs2 : UInt<32>, flip INSTR_SEL : UInt<5>, rd : UInt<32>}

    node signed_RS1 = asSInt(io.rs1) @[ZbbExt.scala 284:24]
    node signed_RS2 = asSInt(io.rs2) @[ZbbExt.scala 285:24]
    inst ShiftL of ShiftLeft @[ZbbExt.scala 287:22]
    ShiftL.clock <= clock
    ShiftL.reset <= reset
    inst ShiftR of ShiftRight @[ZbbExt.scala 289:22]
    ShiftR.clock <= clock
    ShiftR.reset <= reset
    inst Invert of InvertBits @[ZbbExt.scala 291:22]
    Invert.clock <= clock
    Invert.reset <= reset
    inst AND of ANDBits @[ZbbExt.scala 293:19]
    AND.clock <= clock
    AND.reset <= reset
    inst OR of ORBits @[ZbbExt.scala 295:18]
    OR.clock <= clock
    OR.reset <= reset
    inst XOR of XORBits @[ZbbExt.scala 297:19]
    XOR.clock <= clock
    XOR.reset <= reset
    inst CLZ of CountLeadingZeros @[ZbbExt.scala 299:19]
    CLZ.clock <= clock
    CLZ.reset <= reset
    inst CTZ of CountTrailingZeros @[ZbbExt.scala 301:19]
    CTZ.clock <= clock
    CTZ.reset <= reset
    inst CPOP of CountPopulation @[ZbbExt.scala 303:20]
    CPOP.clock <= clock
    CPOP.reset <= reset
    inst MAX of MaxInstruction @[ZbbExt.scala 305:19]
    MAX.clock <= clock
    MAX.reset <= reset
    inst MAXU of MaxUInstruction @[ZbbExt.scala 307:20]
    MAXU.clock <= clock
    MAXU.reset <= reset
    inst MIN of MinInstruction @[ZbbExt.scala 309:19]
    MIN.clock <= clock
    MIN.reset <= reset
    inst MINU of MinUInstruction @[ZbbExt.scala 311:20]
    MINU.clock <= clock
    MINU.reset <= reset
    inst SEXTB of SextB @[ZbbExt.scala 313:21]
    SEXTB.clock <= clock
    SEXTB.reset <= reset
    inst SEXTH of SextH @[ZbbExt.scala 315:21]
    SEXTH.clock <= clock
    SEXTH.reset <= reset
    inst ZEXTH of ZextH @[ZbbExt.scala 317:21]
    ZEXTH.clock <= clock
    ZEXTH.reset <= reset
    inst ORCB of OrcB @[ZbbExt.scala 319:20]
    ORCB.clock <= clock
    ORCB.reset <= reset
    inst REV8 of Rev8 @[ZbbExt.scala 321:20]
    REV8.clock <= clock
    REV8.reset <= reset
    node shamt = bits(io.rs2, 4, 0) @[ZbbExt.scala 326:18]
    ShiftL.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 330:18]
    ShiftL.io.bits <= UInt<1>("h0") @[ZbbExt.scala 331:18]
    ShiftR.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 333:18]
    ShiftR.io.bits <= UInt<1>("h0") @[ZbbExt.scala 334:18]
    Invert.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 336:18]
    AND.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 338:15]
    AND.io.B_in <= UInt<1>("h0") @[ZbbExt.scala 339:15]
    OR.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 341:14]
    OR.io.B_in <= UInt<1>("h0") @[ZbbExt.scala 342:14]
    XOR.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 344:15]
    XOR.io.B_in <= UInt<1>("h0") @[ZbbExt.scala 345:15]
    CLZ.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 347:15]
    CTZ.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 349:15]
    CPOP.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 351:16]
    MAX.io.A_in <= asSInt(UInt<1>("h0")) @[ZbbExt.scala 353:15]
    MAX.io.B_in <= asSInt(UInt<1>("h0")) @[ZbbExt.scala 354:15]
    MAXU.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 356:16]
    MAXU.io.B_in <= UInt<1>("h0") @[ZbbExt.scala 357:16]
    MIN.io.A_in <= asSInt(UInt<1>("h0")) @[ZbbExt.scala 359:15]
    MIN.io.B_in <= asSInt(UInt<1>("h0")) @[ZbbExt.scala 360:15]
    MINU.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 362:16]
    MINU.io.B_in <= UInt<1>("h0") @[ZbbExt.scala 363:16]
    SEXTB.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 365:17]
    SEXTH.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 367:17]
    ZEXTH.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 369:17]
    ORCB.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 371:16]
    REV8.io.A_in <= UInt<1>("h0") @[ZbbExt.scala 373:16]
    wire rd : UInt<32>
    rd <= UInt<32>("h0")
    node _T = asUInt(UInt<1>("h0")) @[ZbbExt.scala 377:24]
    node _T_1 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
    node _T_2 = eq(_T, _T_1) @[ZbbExt.scala 377:24]
    when _T_2 : @[ZbbExt.scala 377:24]
      Invert.io.A_in <= io.rs2 @[ZbbExt.scala 379:22]
      AND.io.A_in <= io.rs1 @[ZbbExt.scala 381:19]
      AND.io.B_in <= Invert.io.A_out @[ZbbExt.scala 382:19]
      rd <= AND.io.and @[ZbbExt.scala 383:10]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[ZbbExt.scala 377:24]
      node _T_4 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
      node _T_5 = eq(_T_3, _T_4) @[ZbbExt.scala 377:24]
      when _T_5 : @[ZbbExt.scala 377:24]
        Invert.io.A_in <= io.rs2 @[ZbbExt.scala 386:22]
        OR.io.A_in <= io.rs1 @[ZbbExt.scala 388:18]
        OR.io.B_in <= Invert.io.A_out @[ZbbExt.scala 389:18]
        rd <= OR.io.or @[ZbbExt.scala 390:10]
      else :
        node _T_6 = asUInt(UInt<2>("h2")) @[ZbbExt.scala 377:24]
        node _T_7 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
        node _T_8 = eq(_T_6, _T_7) @[ZbbExt.scala 377:24]
        when _T_8 : @[ZbbExt.scala 377:24]
          XOR.io.A_in <= io.rs1 @[ZbbExt.scala 393:19]
          XOR.io.B_in <= io.rs2 @[ZbbExt.scala 394:19]
          Invert.io.A_in <= XOR.io.xor @[ZbbExt.scala 396:22]
          rd <= Invert.io.A_out @[ZbbExt.scala 397:10]
        else :
          node _T_9 = asUInt(UInt<2>("h3")) @[ZbbExt.scala 377:24]
          node _T_10 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
          node _T_11 = eq(_T_9, _T_10) @[ZbbExt.scala 377:24]
          when _T_11 : @[ZbbExt.scala 377:24]
            CLZ.io.A_in <= io.rs1 @[ZbbExt.scala 400:19]
            rd <= CLZ.io.A_out @[ZbbExt.scala 401:10]
          else :
            node _T_12 = asUInt(UInt<3>("h4")) @[ZbbExt.scala 377:24]
            node _T_13 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
            node _T_14 = eq(_T_12, _T_13) @[ZbbExt.scala 377:24]
            when _T_14 : @[ZbbExt.scala 377:24]
              CTZ.io.A_in <= io.rs1 @[ZbbExt.scala 404:19]
              rd <= CTZ.io.A_out @[ZbbExt.scala 405:10]
            else :
              node _T_15 = asUInt(UInt<3>("h5")) @[ZbbExt.scala 377:24]
              node _T_16 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
              node _T_17 = eq(_T_15, _T_16) @[ZbbExt.scala 377:24]
              when _T_17 : @[ZbbExt.scala 377:24]
                CPOP.io.A_in <= io.rs1 @[ZbbExt.scala 408:20]
                rd <= CPOP.io.A_out @[ZbbExt.scala 409:10]
              else :
                node _T_18 = asUInt(UInt<3>("h6")) @[ZbbExt.scala 377:24]
                node _T_19 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                node _T_20 = eq(_T_18, _T_19) @[ZbbExt.scala 377:24]
                when _T_20 : @[ZbbExt.scala 377:24]
                  MAX.io.A_in <= signed_RS1 @[ZbbExt.scala 412:19]
                  MAX.io.B_in <= signed_RS2 @[ZbbExt.scala 413:19]
                  rd <= MAX.io.max @[ZbbExt.scala 415:10]
                else :
                  node _T_21 = asUInt(UInt<3>("h7")) @[ZbbExt.scala 377:24]
                  node _T_22 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                  node _T_23 = eq(_T_21, _T_22) @[ZbbExt.scala 377:24]
                  when _T_23 : @[ZbbExt.scala 377:24]
                    MAXU.io.A_in <= io.rs1 @[ZbbExt.scala 418:20]
                    MAXU.io.B_in <= io.rs2 @[ZbbExt.scala 419:20]
                    rd <= MAXU.io.maxu @[ZbbExt.scala 421:10]
                  else :
                    node _T_24 = asUInt(UInt<4>("h8")) @[ZbbExt.scala 377:24]
                    node _T_25 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                    node _T_26 = eq(_T_24, _T_25) @[ZbbExt.scala 377:24]
                    when _T_26 : @[ZbbExt.scala 377:24]
                      MIN.io.A_in <= signed_RS1 @[ZbbExt.scala 424:19]
                      MIN.io.B_in <= signed_RS2 @[ZbbExt.scala 425:19]
                      rd <= MIN.io.min @[ZbbExt.scala 427:10]
                    else :
                      node _T_27 = asUInt(UInt<4>("h9")) @[ZbbExt.scala 377:24]
                      node _T_28 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                      node _T_29 = eq(_T_27, _T_28) @[ZbbExt.scala 377:24]
                      when _T_29 : @[ZbbExt.scala 377:24]
                        MINU.io.A_in <= io.rs1 @[ZbbExt.scala 430:20]
                        MINU.io.B_in <= io.rs2 @[ZbbExt.scala 431:20]
                        rd <= MINU.io.minu @[ZbbExt.scala 433:10]
                      else :
                        node _T_30 = asUInt(UInt<4>("ha")) @[ZbbExt.scala 377:24]
                        node _T_31 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                        node _T_32 = eq(_T_30, _T_31) @[ZbbExt.scala 377:24]
                        when _T_32 : @[ZbbExt.scala 377:24]
                          SEXTB.io.A_in <= io.rs1 @[ZbbExt.scala 436:21]
                          rd <= SEXTB.io.A_out @[ZbbExt.scala 437:10]
                        else :
                          node _T_33 = asUInt(UInt<4>("hb")) @[ZbbExt.scala 377:24]
                          node _T_34 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                          node _T_35 = eq(_T_33, _T_34) @[ZbbExt.scala 377:24]
                          when _T_35 : @[ZbbExt.scala 377:24]
                            SEXTH.io.A_in <= io.rs1 @[ZbbExt.scala 440:21]
                            rd <= SEXTH.io.A_out @[ZbbExt.scala 441:10]
                          else :
                            node _T_36 = asUInt(UInt<4>("hc")) @[ZbbExt.scala 377:24]
                            node _T_37 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                            node _T_38 = eq(_T_36, _T_37) @[ZbbExt.scala 377:24]
                            when _T_38 : @[ZbbExt.scala 377:24]
                              ZEXTH.io.A_in <= io.rs1 @[ZbbExt.scala 444:21]
                              rd <= ZEXTH.io.A_out @[ZbbExt.scala 445:10]
                            else :
                              node _T_39 = asUInt(UInt<4>("hd")) @[ZbbExt.scala 377:24]
                              node _T_40 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                              node _T_41 = eq(_T_39, _T_40) @[ZbbExt.scala 377:24]
                              when _T_41 : @[ZbbExt.scala 377:24]
                                node shamt_1 = bits(io.rs2, 4, 0) @[ZbbExt.scala 449:22]
                                node _rightShiftBits_T = sub(UInt<6>("h20"), shamt_1) @[ZbbExt.scala 452:33]
                                node rightShiftBits = tail(_rightShiftBits_T, 1) @[ZbbExt.scala 452:33]
                                ShiftL.io.A_in <= io.rs1 @[ZbbExt.scala 454:22]
                                ShiftL.io.bits <= shamt_1 @[ZbbExt.scala 455:22]
                                ShiftR.io.A_in <= io.rs1 @[ZbbExt.scala 457:22]
                                ShiftR.io.bits <= rightShiftBits @[ZbbExt.scala 458:22]
                                OR.io.A_in <= ShiftL.io.A_out @[ZbbExt.scala 460:18]
                                OR.io.B_in <= ShiftR.io.A_out @[ZbbExt.scala 461:18]
                                rd <= OR.io.or @[ZbbExt.scala 463:10]
                              else :
                                node _T_42 = asUInt(UInt<4>("he")) @[ZbbExt.scala 377:24]
                                node _T_43 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                                node _T_44 = eq(_T_42, _T_43) @[ZbbExt.scala 377:24]
                                when _T_44 : @[ZbbExt.scala 377:24]
                                  node shamt_2 = bits(io.rs2, 4, 0) @[ZbbExt.scala 467:22]
                                  node _leftShiftBits_T = sub(UInt<6>("h20"), shamt_2) @[ZbbExt.scala 469:32]
                                  node leftShiftBits = tail(_leftShiftBits_T, 1) @[ZbbExt.scala 469:32]
                                  ShiftL.io.A_in <= io.rs1 @[ZbbExt.scala 472:22]
                                  ShiftL.io.bits <= leftShiftBits @[ZbbExt.scala 473:22]
                                  ShiftR.io.A_in <= io.rs1 @[ZbbExt.scala 475:22]
                                  ShiftR.io.bits <= shamt_2 @[ZbbExt.scala 476:22]
                                  OR.io.A_in <= ShiftR.io.A_out @[ZbbExt.scala 478:18]
                                  OR.io.B_in <= ShiftL.io.A_out @[ZbbExt.scala 479:18]
                                  rd <= OR.io.or @[ZbbExt.scala 481:10]
                                else :
                                  node _T_45 = asUInt(UInt<4>("hf")) @[ZbbExt.scala 377:24]
                                  node _T_46 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                                  node _T_47 = eq(_T_45, _T_46) @[ZbbExt.scala 377:24]
                                  when _T_47 : @[ZbbExt.scala 377:24]
                                    node shamt_3 = bits(io.rs2, 4, 0) @[ZbbExt.scala 485:22]
                                    node _realShamt_T = bits(shamt_3, 4, 4) @[ZbbExt.scala 488:32]
                                    node _realShamt_T_1 = eq(_realShamt_T, UInt<1>("h1")) @[ZbbExt.scala 488:36]
                                    node _realShamt_T_2 = bits(shamt_3, 3, 0) @[ZbbExt.scala 488:50]
                                    node realShamt = mux(_realShamt_T_1, _realShamt_T_2, shamt_3) @[ZbbExt.scala 488:26]
                                    node _leftShiftBits_T_1 = sub(UInt<6>("h20"), realShamt) @[ZbbExt.scala 490:32]
                                    node leftShiftBits_1 = tail(_leftShiftBits_T_1, 1) @[ZbbExt.scala 490:32]
                                    ShiftL.io.A_in <= io.rs1 @[ZbbExt.scala 493:22]
                                    ShiftL.io.bits <= leftShiftBits_1 @[ZbbExt.scala 494:22]
                                    ShiftR.io.A_in <= io.rs1 @[ZbbExt.scala 496:22]
                                    ShiftR.io.bits <= realShamt @[ZbbExt.scala 497:22]
                                    OR.io.A_in <= ShiftR.io.A_out @[ZbbExt.scala 499:18]
                                    OR.io.B_in <= ShiftL.io.A_out @[ZbbExt.scala 500:18]
                                    rd <= OR.io.or @[ZbbExt.scala 502:10]
                                  else :
                                    node _T_48 = asUInt(UInt<5>("h10")) @[ZbbExt.scala 377:24]
                                    node _T_49 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                                    node _T_50 = eq(_T_48, _T_49) @[ZbbExt.scala 377:24]
                                    when _T_50 : @[ZbbExt.scala 377:24]
                                      ORCB.io.A_in <= io.rs1 @[ZbbExt.scala 505:20]
                                      rd <= ORCB.io.A_out @[ZbbExt.scala 506:10]
                                    else :
                                      node _T_51 = asUInt(UInt<5>("h11")) @[ZbbExt.scala 377:24]
                                      node _T_52 = asUInt(io.INSTR_SEL) @[ZbbExt.scala 377:24]
                                      node _T_53 = eq(_T_51, _T_52) @[ZbbExt.scala 377:24]
                                      when _T_53 : @[ZbbExt.scala 377:24]
                                        REV8.io.A_in <= io.rs1 @[ZbbExt.scala 509:20]
                                        rd <= REV8.io.A_out @[ZbbExt.scala 510:10]
    io.rd <= rd @[ZbbExt.scala 514:9]

