circuit Zba :
  module ShiftLeft :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip bits : UInt<5>, A_out : UInt<32>}

    node A_temp = dshl(io.A_in, io.bits) @[ZbaExt.scala 16:28]
    io.A_out <= A_temp @[ZbaExt.scala 18:15]

  module Adder :
    input clock : Clock
    input reset : Reset
    output io : { flip A_in : UInt<32>, flip B_in : UInt<32>, sum : UInt<32>}

    node _sum_temp_T = add(io.A_in, io.B_in) @[ZbaExt.scala 29:30]
    node sum_temp = tail(_sum_temp_T, 1) @[ZbaExt.scala 29:30]
    io.sum <= sum_temp @[ZbaExt.scala 31:13]

  module Zba :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rs1 : UInt<32>, flip rs2 : UInt<32>, flip INSTR_SEL : UInt<2>, rd : UInt<32>}

    inst shiftL of ShiftLeft @[ZbaExt.scala 42:22]
    shiftL.clock <= clock
    shiftL.reset <= reset
    inst add of Adder @[ZbaExt.scala 43:19]
    add.clock <= clock
    add.reset <= reset
    shiftL.io.A_in <= UInt<1>("h0") @[ZbaExt.scala 45:18]
    shiftL.io.bits <= UInt<1>("h0") @[ZbaExt.scala 46:18]
    add.io.A_in <= UInt<1>("h0") @[ZbaExt.scala 47:15]
    add.io.B_in <= UInt<1>("h0") @[ZbaExt.scala 48:15]
    wire rd : UInt<32>
    rd <= UInt<32>("h0")
    node _T = asUInt(UInt<1>("h0")) @[ZbaExt.scala 52:24]
    node _T_1 = asUInt(io.INSTR_SEL) @[ZbaExt.scala 52:24]
    node _T_2 = eq(_T, _T_1) @[ZbaExt.scala 52:24]
    when _T_2 : @[ZbaExt.scala 52:24]
      shiftL.io.A_in <= io.rs1 @[ZbaExt.scala 54:22]
      shiftL.io.bits <= UInt<1>("h1") @[ZbaExt.scala 55:22]
      add.io.A_in <= shiftL.io.A_out @[ZbaExt.scala 56:19]
      add.io.B_in <= io.rs2 @[ZbaExt.scala 57:19]
      rd <= add.io.sum @[ZbaExt.scala 58:10]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[ZbaExt.scala 52:24]
      node _T_4 = asUInt(io.INSTR_SEL) @[ZbaExt.scala 52:24]
      node _T_5 = eq(_T_3, _T_4) @[ZbaExt.scala 52:24]
      when _T_5 : @[ZbaExt.scala 52:24]
        shiftL.io.A_in <= io.rs1 @[ZbaExt.scala 61:22]
        shiftL.io.bits <= UInt<2>("h2") @[ZbaExt.scala 62:22]
        add.io.A_in <= shiftL.io.A_out @[ZbaExt.scala 63:19]
        add.io.B_in <= io.rs2 @[ZbaExt.scala 64:19]
        rd <= add.io.sum @[ZbaExt.scala 65:10]
      else :
        node _T_6 = asUInt(UInt<2>("h2")) @[ZbaExt.scala 52:24]
        node _T_7 = asUInt(io.INSTR_SEL) @[ZbaExt.scala 52:24]
        node _T_8 = eq(_T_6, _T_7) @[ZbaExt.scala 52:24]
        when _T_8 : @[ZbaExt.scala 52:24]
          shiftL.io.A_in <= io.rs1 @[ZbaExt.scala 68:22]
          shiftL.io.bits <= UInt<2>("h3") @[ZbaExt.scala 69:22]
          add.io.A_in <= shiftL.io.A_out @[ZbaExt.scala 70:19]
          add.io.B_in <= io.rs2 @[ZbaExt.scala 71:19]
          rd <= add.io.sum @[ZbaExt.scala 72:10]
    io.rd <= rd @[ZbaExt.scala 76:9]

