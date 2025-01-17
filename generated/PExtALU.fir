circuit PExtALU :
  module ShiftLeft :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip bits : UInt<5>, A_out : UInt<32>}

    node A_temp = dshl(io.A_in, io.bits) @[RISCVALU.scala 17:28]
    node _io_A_out_T = bits(A_temp, 31, 0) @[RISCVALU.scala 19:24]
    io.A_out <= _io_A_out_T @[RISCVALU.scala 19:15]

  module Adder :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, sum : UInt<32>}

    node _sum_temp_T = add(io.A_in, io.B_in) @[RISCVALU.scala 30:30]
    node sum_temp = tail(_sum_temp_T, 1) @[RISCVALU.scala 30:30]
    io.sum <= sum_temp @[RISCVALU.scala 32:13]

  module InvertBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node A_temp = not(io.A_in) @[RISCVALU.scala 42:20]
    io.A_out <= A_temp @[RISCVALU.scala 44:15]

  module ANDBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, and : UInt<32>}

    node and_temp = and(io.A_in, io.B_in) @[RISCVALU.scala 55:30]
    io.and <= and_temp @[RISCVALU.scala 57:13]

  module ORBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, or : UInt<32>}

    node or_temp = or(io.A_in, io.B_in) @[RISCVALU.scala 68:29]
    io.or <= or_temp @[RISCVALU.scala 70:12]

  module XORBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, xor : UInt<32>}

    node xor_temp = xor(io.A_in, io.B_in) @[RISCVALU.scala 81:30]
    io.xor <= xor_temp @[RISCVALU.scala 83:13]

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
    node _io_A_out_T = bits(reversed, 0, 0) @[OneHot.scala 47:45]
    node _io_A_out_T_1 = bits(reversed, 1, 1) @[OneHot.scala 47:45]
    node _io_A_out_T_2 = bits(reversed, 2, 2) @[OneHot.scala 47:45]
    node _io_A_out_T_3 = bits(reversed, 3, 3) @[OneHot.scala 47:45]
    node _io_A_out_T_4 = bits(reversed, 4, 4) @[OneHot.scala 47:45]
    node _io_A_out_T_5 = bits(reversed, 5, 5) @[OneHot.scala 47:45]
    node _io_A_out_T_6 = bits(reversed, 6, 6) @[OneHot.scala 47:45]
    node _io_A_out_T_7 = bits(reversed, 7, 7) @[OneHot.scala 47:45]
    node _io_A_out_T_8 = bits(reversed, 8, 8) @[OneHot.scala 47:45]
    node _io_A_out_T_9 = bits(reversed, 9, 9) @[OneHot.scala 47:45]
    node _io_A_out_T_10 = bits(reversed, 10, 10) @[OneHot.scala 47:45]
    node _io_A_out_T_11 = bits(reversed, 11, 11) @[OneHot.scala 47:45]
    node _io_A_out_T_12 = bits(reversed, 12, 12) @[OneHot.scala 47:45]
    node _io_A_out_T_13 = bits(reversed, 13, 13) @[OneHot.scala 47:45]
    node _io_A_out_T_14 = bits(reversed, 14, 14) @[OneHot.scala 47:45]
    node _io_A_out_T_15 = bits(reversed, 15, 15) @[OneHot.scala 47:45]
    node _io_A_out_T_16 = bits(reversed, 16, 16) @[OneHot.scala 47:45]
    node _io_A_out_T_17 = bits(reversed, 17, 17) @[OneHot.scala 47:45]
    node _io_A_out_T_18 = bits(reversed, 18, 18) @[OneHot.scala 47:45]
    node _io_A_out_T_19 = bits(reversed, 19, 19) @[OneHot.scala 47:45]
    node _io_A_out_T_20 = bits(reversed, 20, 20) @[OneHot.scala 47:45]
    node _io_A_out_T_21 = bits(reversed, 21, 21) @[OneHot.scala 47:45]
    node _io_A_out_T_22 = bits(reversed, 22, 22) @[OneHot.scala 47:45]
    node _io_A_out_T_23 = bits(reversed, 23, 23) @[OneHot.scala 47:45]
    node _io_A_out_T_24 = bits(reversed, 24, 24) @[OneHot.scala 47:45]
    node _io_A_out_T_25 = bits(reversed, 25, 25) @[OneHot.scala 47:45]
    node _io_A_out_T_26 = bits(reversed, 26, 26) @[OneHot.scala 47:45]
    node _io_A_out_T_27 = bits(reversed, 27, 27) @[OneHot.scala 47:45]
    node _io_A_out_T_28 = bits(reversed, 28, 28) @[OneHot.scala 47:45]
    node _io_A_out_T_29 = bits(reversed, 29, 29) @[OneHot.scala 47:45]
    node _io_A_out_T_30 = bits(reversed, 30, 30) @[OneHot.scala 47:45]
    node _io_A_out_T_31 = bits(reversed, 31, 31) @[OneHot.scala 47:45]
    node _io_A_out_T_32 = mux(_io_A_out_T_30, UInt<5>("h1e"), UInt<5>("h1f")) @[Mux.scala 47:70]
    node _io_A_out_T_33 = mux(_io_A_out_T_29, UInt<5>("h1d"), _io_A_out_T_32) @[Mux.scala 47:70]
    node _io_A_out_T_34 = mux(_io_A_out_T_28, UInt<5>("h1c"), _io_A_out_T_33) @[Mux.scala 47:70]
    node _io_A_out_T_35 = mux(_io_A_out_T_27, UInt<5>("h1b"), _io_A_out_T_34) @[Mux.scala 47:70]
    node _io_A_out_T_36 = mux(_io_A_out_T_26, UInt<5>("h1a"), _io_A_out_T_35) @[Mux.scala 47:70]
    node _io_A_out_T_37 = mux(_io_A_out_T_25, UInt<5>("h19"), _io_A_out_T_36) @[Mux.scala 47:70]
    node _io_A_out_T_38 = mux(_io_A_out_T_24, UInt<5>("h18"), _io_A_out_T_37) @[Mux.scala 47:70]
    node _io_A_out_T_39 = mux(_io_A_out_T_23, UInt<5>("h17"), _io_A_out_T_38) @[Mux.scala 47:70]
    node _io_A_out_T_40 = mux(_io_A_out_T_22, UInt<5>("h16"), _io_A_out_T_39) @[Mux.scala 47:70]
    node _io_A_out_T_41 = mux(_io_A_out_T_21, UInt<5>("h15"), _io_A_out_T_40) @[Mux.scala 47:70]
    node _io_A_out_T_42 = mux(_io_A_out_T_20, UInt<5>("h14"), _io_A_out_T_41) @[Mux.scala 47:70]
    node _io_A_out_T_43 = mux(_io_A_out_T_19, UInt<5>("h13"), _io_A_out_T_42) @[Mux.scala 47:70]
    node _io_A_out_T_44 = mux(_io_A_out_T_18, UInt<5>("h12"), _io_A_out_T_43) @[Mux.scala 47:70]
    node _io_A_out_T_45 = mux(_io_A_out_T_17, UInt<5>("h11"), _io_A_out_T_44) @[Mux.scala 47:70]
    node _io_A_out_T_46 = mux(_io_A_out_T_16, UInt<5>("h10"), _io_A_out_T_45) @[Mux.scala 47:70]
    node _io_A_out_T_47 = mux(_io_A_out_T_15, UInt<4>("hf"), _io_A_out_T_46) @[Mux.scala 47:70]
    node _io_A_out_T_48 = mux(_io_A_out_T_14, UInt<4>("he"), _io_A_out_T_47) @[Mux.scala 47:70]
    node _io_A_out_T_49 = mux(_io_A_out_T_13, UInt<4>("hd"), _io_A_out_T_48) @[Mux.scala 47:70]
    node _io_A_out_T_50 = mux(_io_A_out_T_12, UInt<4>("hc"), _io_A_out_T_49) @[Mux.scala 47:70]
    node _io_A_out_T_51 = mux(_io_A_out_T_11, UInt<4>("hb"), _io_A_out_T_50) @[Mux.scala 47:70]
    node _io_A_out_T_52 = mux(_io_A_out_T_10, UInt<4>("ha"), _io_A_out_T_51) @[Mux.scala 47:70]
    node _io_A_out_T_53 = mux(_io_A_out_T_9, UInt<4>("h9"), _io_A_out_T_52) @[Mux.scala 47:70]
    node _io_A_out_T_54 = mux(_io_A_out_T_8, UInt<4>("h8"), _io_A_out_T_53) @[Mux.scala 47:70]
    node _io_A_out_T_55 = mux(_io_A_out_T_7, UInt<3>("h7"), _io_A_out_T_54) @[Mux.scala 47:70]
    node _io_A_out_T_56 = mux(_io_A_out_T_6, UInt<3>("h6"), _io_A_out_T_55) @[Mux.scala 47:70]
    node _io_A_out_T_57 = mux(_io_A_out_T_5, UInt<3>("h5"), _io_A_out_T_56) @[Mux.scala 47:70]
    node _io_A_out_T_58 = mux(_io_A_out_T_4, UInt<3>("h4"), _io_A_out_T_57) @[Mux.scala 47:70]
    node _io_A_out_T_59 = mux(_io_A_out_T_3, UInt<2>("h3"), _io_A_out_T_58) @[Mux.scala 47:70]
    node _io_A_out_T_60 = mux(_io_A_out_T_2, UInt<2>("h2"), _io_A_out_T_59) @[Mux.scala 47:70]
    node _io_A_out_T_61 = mux(_io_A_out_T_1, UInt<1>("h1"), _io_A_out_T_60) @[Mux.scala 47:70]
    node _io_A_out_T_62 = mux(_io_A_out_T, UInt<1>("h0"), _io_A_out_T_61) @[Mux.scala 47:70]
    io.A_out <= _io_A_out_T_62 @[RISCVALU.scala 95:12]

  module PExtALU :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rs1 : UInt<32>, flip rs2 : UInt<32>, flip ALU_SEL : UInt<3>, flip EXT_SEL : UInt<1>, rd : UInt<32>}

    reg RD : UInt<32>, clock with :
      reset => (UInt<1>("h0"), RD) @[RISCVALU.scala 113:15]
    RD <= UInt<1>("h0") @[RISCVALU.scala 115:6]
    inst Shift of ShiftLeft @[RISCVALU.scala 117:21]
    Shift.clock <= clock
    Shift.reset <= reset
    inst Add of Adder @[RISCVALU.scala 119:19]
    Add.clock <= clock
    Add.reset <= reset
    inst Invert of InvertBits @[RISCVALU.scala 121:22]
    Invert.clock <= clock
    Invert.reset <= reset
    inst AND of ANDBits @[RISCVALU.scala 123:19]
    AND.clock <= clock
    AND.reset <= reset
    inst OR of ORBits @[RISCVALU.scala 125:18]
    OR.clock <= clock
    OR.reset <= reset
    inst XOR of XORBits @[RISCVALU.scala 127:19]
    XOR.clock <= clock
    XOR.reset <= reset
    inst CLZ of CountLeadingZeros @[RISCVALU.scala 129:19]
    CLZ.clock <= clock
    CLZ.reset <= reset
    Shift.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 133:17]
    Shift.io.bits <= UInt<1>("h0") @[RISCVALU.scala 134:17]
    Add.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 136:15]
    Add.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 137:15]
    Invert.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 139:18]
    AND.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 141:15]
    AND.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 142:15]
    OR.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 144:14]
    OR.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 145:14]
    XOR.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 147:15]
    XOR.io.B_in <= UInt<1>("h0") @[RISCVALU.scala 148:15]
    CLZ.io.A_in <= UInt<1>("h0") @[RISCVALU.scala 150:15]
    node _T = eq(io.EXT_SEL, UInt<1>("h0")) @[RISCVALU.scala 153:19]
    when _T : @[RISCVALU.scala 153:38]
      node _T_1 = asUInt(UInt<1>("h0")) @[RISCVALU.scala 155:24]
      node _T_2 = asUInt(io.ALU_SEL) @[RISCVALU.scala 155:24]
      node _T_3 = eq(_T_1, _T_2) @[RISCVALU.scala 155:24]
      when _T_3 : @[RISCVALU.scala 155:24]
        Shift.io.A_in <= io.rs1 @[RISCVALU.scala 159:23]
        Shift.io.bits <= UInt<1>("h1") @[RISCVALU.scala 160:23]
        Add.io.A_in <= Shift.io.A_out @[RISCVALU.scala 162:21]
        Add.io.B_in <= io.rs2 @[RISCVALU.scala 163:21]
        RD <= Add.io.sum @[RISCVALU.scala 164:12]
      else :
        node _T_4 = asUInt(UInt<1>("h1")) @[RISCVALU.scala 155:24]
        node _T_5 = asUInt(io.ALU_SEL) @[RISCVALU.scala 155:24]
        node _T_6 = eq(_T_4, _T_5) @[RISCVALU.scala 155:24]
        when _T_6 : @[RISCVALU.scala 155:24]
          Shift.io.A_in <= io.rs1 @[RISCVALU.scala 169:23]
          Shift.io.bits <= UInt<2>("h2") @[RISCVALU.scala 170:23]
          Add.io.A_in <= Shift.io.A_out @[RISCVALU.scala 172:21]
          Add.io.B_in <= io.rs2 @[RISCVALU.scala 173:21]
          RD <= Add.io.sum @[RISCVALU.scala 174:12]
        else :
          node _T_7 = asUInt(UInt<2>("h2")) @[RISCVALU.scala 155:24]
          node _T_8 = asUInt(io.ALU_SEL) @[RISCVALU.scala 155:24]
          node _T_9 = eq(_T_7, _T_8) @[RISCVALU.scala 155:24]
          when _T_9 : @[RISCVALU.scala 155:24]
            Shift.io.A_in <= io.rs1 @[RISCVALU.scala 179:23]
            Shift.io.bits <= UInt<2>("h3") @[RISCVALU.scala 180:23]
            Add.io.A_in <= Shift.io.A_out @[RISCVALU.scala 182:21]
            Add.io.B_in <= io.rs2 @[RISCVALU.scala 183:21]
            RD <= Add.io.sum @[RISCVALU.scala 184:12]
    else :
      node _T_10 = eq(io.EXT_SEL, UInt<1>("h1")) @[RISCVALU.scala 189:23]
      when _T_10 : @[RISCVALU.scala 189:42]
        node _T_11 = asUInt(UInt<2>("h3")) @[RISCVALU.scala 191:23]
        node _T_12 = asUInt(io.ALU_SEL) @[RISCVALU.scala 191:23]
        node _T_13 = eq(_T_11, _T_12) @[RISCVALU.scala 191:23]
        when _T_13 : @[RISCVALU.scala 191:23]
          Invert.io.A_in <= io.rs2 @[RISCVALU.scala 197:23]
          AND.io.A_in <= io.rs1 @[RISCVALU.scala 199:20]
          AND.io.B_in <= Invert.io.A_out @[RISCVALU.scala 200:20]
          RD <= AND.io.and @[RISCVALU.scala 201:11]
        else :
          node _T_14 = asUInt(UInt<3>("h4")) @[RISCVALU.scala 191:23]
          node _T_15 = asUInt(io.ALU_SEL) @[RISCVALU.scala 191:23]
          node _T_16 = eq(_T_14, _T_15) @[RISCVALU.scala 191:23]
          when _T_16 : @[RISCVALU.scala 191:23]
            Invert.io.A_in <= io.rs2 @[RISCVALU.scala 206:23]
            OR.io.A_in <= io.rs1 @[RISCVALU.scala 208:19]
            OR.io.B_in <= Invert.io.A_out @[RISCVALU.scala 209:19]
            RD <= OR.io.or @[RISCVALU.scala 210:11]
          else :
            node _T_17 = asUInt(UInt<3>("h5")) @[RISCVALU.scala 191:23]
            node _T_18 = asUInt(io.ALU_SEL) @[RISCVALU.scala 191:23]
            node _T_19 = eq(_T_17, _T_18) @[RISCVALU.scala 191:23]
            when _T_19 : @[RISCVALU.scala 191:23]
              XOR.io.A_in <= io.rs1 @[RISCVALU.scala 216:20]
              XOR.io.B_in <= io.rs2 @[RISCVALU.scala 217:20]
              Invert.io.A_in <= XOR.io.xor @[RISCVALU.scala 219:23]
              RD <= Invert.io.A_out @[RISCVALU.scala 220:11]
            else :
              node _T_20 = asUInt(UInt<3>("h6")) @[RISCVALU.scala 191:23]
              node _T_21 = asUInt(io.ALU_SEL) @[RISCVALU.scala 191:23]
              node _T_22 = eq(_T_20, _T_21) @[RISCVALU.scala 191:23]
              when _T_22 : @[RISCVALU.scala 191:23]
                CLZ.io.A_in <= io.rs1 @[RISCVALU.scala 225:21]
                RD <= CLZ.io.A_out @[RISCVALU.scala 226:12]
    io.rd <= RD @[RISCVALU.scala 231:9]

