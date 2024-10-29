import chisel3._
import chisel3.experimental.ChiselEnum

package ALUType {

  object AluOP extends ChiselEnum {
//    type AluOP = Value
    val SH1ADD, SH2ADD, SH3ADD, ANDN, ORN, XOR = Value
  }

}