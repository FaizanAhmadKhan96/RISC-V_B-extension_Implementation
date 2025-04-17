import chisel3._
import chisel3.experimental.ChiselEnum

package ExtensionType {

  object Extension extends ChiselEnum {
//    type Extension = Value
    val Zba, Zbb, Zbc, Zbs = Value
  }

}