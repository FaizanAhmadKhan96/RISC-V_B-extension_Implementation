import chisel3._
import chisel3.experimental.ChiselEnum

package ALUType {

  object AluOP extends ChiselEnum {
//    type AluOP = Value
    val ADD_UW = Value
  }

}