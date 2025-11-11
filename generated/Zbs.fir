circuit Zbs :
  module ShiftLeft :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip bits : UInt<5>, A_out : UInt<32>}

    node A_temp = dshl(io.A_in, io.bits) @[ZbsExt.scala 16:28]
    io.A_out <= A_temp @[ZbsExt.scala 18:15]

  module ShiftRight :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip bits : UInt<5>, A_out : UInt<32>}

    node A_temp = dshr(io.A_in, io.bits) @[ZbsExt.scala 29:28]
    io.A_out <= A_temp @[ZbsExt.scala 31:15]

  module InvertBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, A_out : UInt<32>}

    node A_temp = not(io.A_in) @[ZbsExt.scala 41:20]
    io.A_out <= A_temp @[ZbsExt.scala 43:15]

  module ANDBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, and : UInt<32>}

    node and_temp = and(io.A_in, io.B_in) @[ZbsExt.scala 54:30]
    io.and <= and_temp @[ZbsExt.scala 56:13]

  module ORBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, or : UInt<32>}

    node or_temp = or(io.A_in, io.B_in) @[ZbsExt.scala 67:29]
    io.or <= or_temp @[ZbsExt.scala 69:12]

  module XORBits :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, xor : UInt<32>}

    node xor_temp = xor(io.A_in, io.B_in) @[ZbsExt.scala 80:30]
    io.xor <= xor_temp @[ZbsExt.scala 82:13]

  module Zbs :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rs1 : UInt<32>, flip rs2 : UInt<32>, flip INSTR_SEL : UInt<3>, rd : UInt<32>}

    inst ShiftL of ShiftLeft @[ZbsExt.scala 96:22]
    ShiftL.clock <= clock
    ShiftL.reset <= reset
    inst ShiftR of ShiftRight @[ZbsExt.scala 98:22]
    ShiftR.clock <= clock
    ShiftR.reset <= reset
    inst Invert of InvertBits @[ZbsExt.scala 100:22]
    Invert.clock <= clock
    Invert.reset <= reset
    inst AND of ANDBits @[ZbsExt.scala 102:19]
    AND.clock <= clock
    AND.reset <= reset
    inst OR of ORBits @[ZbsExt.scala 104:18]
    OR.clock <= clock
    OR.reset <= reset
    inst XOR of XORBits @[ZbsExt.scala 106:19]
    XOR.clock <= clock
    XOR.reset <= reset
    node shamt = bits(io.rs2, 4, 0) @[ZbsExt.scala 111:18]
    ShiftL.io.A_in <= UInt<1>("h0") @[ZbsExt.scala 113:18]
    ShiftL.io.bits <= UInt<1>("h0") @[ZbsExt.scala 114:18]
    ShiftR.io.A_in <= UInt<1>("h0") @[ZbsExt.scala 116:18]
    ShiftR.io.bits <= UInt<1>("h0") @[ZbsExt.scala 117:18]
    Invert.io.A_in <= UInt<1>("h0") @[ZbsExt.scala 119:18]
    AND.io.A_in <= UInt<1>("h0") @[ZbsExt.scala 121:15]
    AND.io.B_in <= UInt<1>("h0") @[ZbsExt.scala 122:15]
    OR.io.A_in <= UInt<1>("h0") @[ZbsExt.scala 124:14]
    OR.io.B_in <= UInt<1>("h0") @[ZbsExt.scala 125:14]
    XOR.io.A_in <= UInt<1>("h0") @[ZbsExt.scala 127:15]
    XOR.io.B_in <= UInt<1>("h0") @[ZbsExt.scala 128:15]
    wire rd : UInt<32>
    rd <= UInt<32>("h0")
    node _T = asUInt(UInt<1>("h0")) @[ZbsExt.scala 132:24]
    node _T_1 = asUInt(io.INSTR_SEL) @[ZbsExt.scala 132:24]
    node _T_2 = eq(_T, _T_1) @[ZbsExt.scala 132:24]
    when _T_2 : @[ZbsExt.scala 132:24]
      ShiftL.io.A_in <= UInt<1>("h1") @[ZbsExt.scala 134:22]
      ShiftL.io.bits <= shamt @[ZbsExt.scala 135:22]
      Invert.io.A_in <= ShiftL.io.A_out @[ZbsExt.scala 137:22]
      AND.io.A_in <= io.rs1 @[ZbsExt.scala 139:19]
      AND.io.B_in <= Invert.io.A_out @[ZbsExt.scala 140:19]
      rd <= AND.io.and @[ZbsExt.scala 142:10]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[ZbsExt.scala 132:24]
      node _T_4 = asUInt(io.INSTR_SEL) @[ZbsExt.scala 132:24]
      node _T_5 = eq(_T_3, _T_4) @[ZbsExt.scala 132:24]
      when _T_5 : @[ZbsExt.scala 132:24]
        ShiftL.io.A_in <= UInt<1>("h1") @[ZbsExt.scala 146:22]
        ShiftL.io.bits <= shamt @[ZbsExt.scala 147:22]
        Invert.io.A_in <= ShiftL.io.A_out @[ZbsExt.scala 149:22]
        AND.io.A_in <= io.rs1 @[ZbsExt.scala 151:19]
        AND.io.B_in <= Invert.io.A_out @[ZbsExt.scala 152:19]
        rd <= AND.io.and @[ZbsExt.scala 153:10]
      else :
        node _T_6 = asUInt(UInt<2>("h2")) @[ZbsExt.scala 132:24]
        node _T_7 = asUInt(io.INSTR_SEL) @[ZbsExt.scala 132:24]
        node _T_8 = eq(_T_6, _T_7) @[ZbsExt.scala 132:24]
        when _T_8 : @[ZbsExt.scala 132:24]
          ShiftR.io.A_in <= io.rs1 @[ZbsExt.scala 156:22]
          ShiftR.io.bits <= shamt @[ZbsExt.scala 157:22]
          AND.io.A_in <= ShiftR.io.A_out @[ZbsExt.scala 159:19]
          AND.io.B_in <= UInt<1>("h1") @[ZbsExt.scala 160:19]
          rd <= AND.io.and @[ZbsExt.scala 162:10]
        else :
          node _T_9 = asUInt(UInt<2>("h3")) @[ZbsExt.scala 132:24]
          node _T_10 = asUInt(io.INSTR_SEL) @[ZbsExt.scala 132:24]
          node _T_11 = eq(_T_9, _T_10) @[ZbsExt.scala 132:24]
          when _T_11 : @[ZbsExt.scala 132:24]
            ShiftR.io.A_in <= io.rs1 @[ZbsExt.scala 166:22]
            ShiftR.io.bits <= shamt @[ZbsExt.scala 167:22]
            AND.io.A_in <= ShiftR.io.A_out @[ZbsExt.scala 169:19]
            AND.io.B_in <= UInt<1>("h1") @[ZbsExt.scala 170:19]
            rd <= AND.io.and @[ZbsExt.scala 171:10]
          else :
            node _T_12 = asUInt(UInt<3>("h4")) @[ZbsExt.scala 132:24]
            node _T_13 = asUInt(io.INSTR_SEL) @[ZbsExt.scala 132:24]
            node _T_14 = eq(_T_12, _T_13) @[ZbsExt.scala 132:24]
            when _T_14 : @[ZbsExt.scala 132:24]
              ShiftL.io.A_in <= UInt<1>("h1") @[ZbsExt.scala 174:22]
              ShiftL.io.bits <= shamt @[ZbsExt.scala 175:22]
              XOR.io.A_in <= io.rs1 @[ZbsExt.scala 177:19]
              XOR.io.B_in <= ShiftL.io.A_out @[ZbsExt.scala 178:19]
              rd <= XOR.io.xor @[ZbsExt.scala 180:10]
            else :
              node _T_15 = asUInt(UInt<3>("h5")) @[ZbsExt.scala 132:24]
              node _T_16 = asUInt(io.INSTR_SEL) @[ZbsExt.scala 132:24]
              node _T_17 = eq(_T_15, _T_16) @[ZbsExt.scala 132:24]
              when _T_17 : @[ZbsExt.scala 132:24]
                ShiftL.io.A_in <= UInt<1>("h1") @[ZbsExt.scala 184:22]
                ShiftL.io.bits <= shamt @[ZbsExt.scala 185:22]
                XOR.io.A_in <= io.rs1 @[ZbsExt.scala 187:19]
                XOR.io.B_in <= ShiftL.io.A_out @[ZbsExt.scala 188:19]
                rd <= XOR.io.xor @[ZbsExt.scala 190:10]
              else :
                node _T_18 = asUInt(UInt<3>("h6")) @[ZbsExt.scala 132:24]
                node _T_19 = asUInt(io.INSTR_SEL) @[ZbsExt.scala 132:24]
                node _T_20 = eq(_T_18, _T_19) @[ZbsExt.scala 132:24]
                when _T_20 : @[ZbsExt.scala 132:24]
                  ShiftL.io.A_in <= UInt<1>("h1") @[ZbsExt.scala 193:22]
                  ShiftL.io.bits <= shamt @[ZbsExt.scala 194:22]
                  OR.io.A_in <= io.rs1 @[ZbsExt.scala 196:18]
                  OR.io.B_in <= ShiftL.io.A_out @[ZbsExt.scala 197:18]
                  rd <= OR.io.or @[ZbsExt.scala 199:10]
                else :
                  node _T_21 = asUInt(UInt<3>("h7")) @[ZbsExt.scala 132:24]
                  node _T_22 = asUInt(io.INSTR_SEL) @[ZbsExt.scala 132:24]
                  node _T_23 = eq(_T_21, _T_22) @[ZbsExt.scala 132:24]
                  when _T_23 : @[ZbsExt.scala 132:24]
                    ShiftL.io.A_in <= UInt<1>("h1") @[ZbsExt.scala 203:22]
                    ShiftL.io.bits <= shamt @[ZbsExt.scala 204:22]
                    OR.io.A_in <= io.rs1 @[ZbsExt.scala 206:18]
                    OR.io.B_in <= ShiftL.io.A_out @[ZbsExt.scala 207:18]
                    rd <= OR.io.or @[ZbsExt.scala 209:10]
    io.rd <= rd @[ZbsExt.scala 213:9]

