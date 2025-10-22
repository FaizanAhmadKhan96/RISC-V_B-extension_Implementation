import chisel3._
import chisel3.experimental.ChiselEnum

package ZbaInstr {

  object ZbaOP extends ChiselEnum {
//    type ZbaOP = Value
    val SH1ADD, SH2ADD, SH3ADD = Value
  }

}