import chisel3._
import chisel3.experimental.ChiselEnum

package ZbcInstr {

  object ZbcOP extends ChiselEnum {
    val CLMUL, CLMULH, CLMULR = Value
  }

}