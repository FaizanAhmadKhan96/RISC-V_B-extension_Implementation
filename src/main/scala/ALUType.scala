import chisel3._
import chisel3.experimental.ChiselEnum

package ALUType {

  object AluOP extends ChiselEnum {
//    type AluOP = Value
    val SH1ADD, SH2ADD, SH3ADD, ANDN, ORN, XOR, CLZ, CTZ, CPOP, MAX, MAXU, MIN, MINU, SEXTB, SEXTH, ZEXTH, ROL, ROR, RORI, ORCB, REV8, CLMUL, BCLR , BCLRI, BEXT, BEXTI, BINV, BINVI, BSET, BSETI = Value
  }

}