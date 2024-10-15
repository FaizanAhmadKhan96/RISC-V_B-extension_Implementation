import chisel3._
import chisel3.experimental.ChiselEnum

package ALUType {

  object AluOP extends ChiselEnum {
//    type AluOP = Value
    val ADD_UW, SH1ADD, SH1ADD_UW, SH2ADD, SH2ADD_UW, SH3ADD, SH3ADD_UW = Value
  }

}