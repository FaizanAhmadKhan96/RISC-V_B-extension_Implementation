import chisel3._
import chisel3.experimental.ChiselEnum

package ZbbInstr {

  object ZbbOP extends ChiselEnum {
    val ANDN, ORN, XNOR, CLZ, CTZ, CPOP, MAX, MAXU, MIN, MINU, SEXTB, SEXTH, ZEXTH, ROL, ROR, RORI, ORCB, REV8 = Value
  }

}