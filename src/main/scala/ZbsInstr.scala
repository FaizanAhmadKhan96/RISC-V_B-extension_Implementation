import chisel3._
import chisel3.experimental.ChiselEnum

package ZbsInstr {

  object ZbsOP extends ChiselEnum {
    val BCLR , BCLRI, BEXT, BEXTI, BINV, BINVI, BSET, BSETI = Value
  }

}