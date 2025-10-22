error id: file://<WORKSPACE>/src/main/scala/ZbaExt.scala:[674..681) in Input.VirtualFile("file://<WORKSPACE>/src/main/scala/ZbaExt.scala", "package Zba

import chisel3._
import chisel3.util._
import ZbaInstr._
import scala.annotation.switch

// Implementing n bit shift left
class ShiftLeft(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val bits = Input(UInt(log2Ceil(N).W))
    val A_out = Output(UInt(N.W))
  })

    val A_temp  = (io.A_in << io.bits).asUInt

    io.A_out  := A_temp
}

// Implementing n bit adder block 
class Adder(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val B_in = Input(UInt(N.W))
    val sum = Output(UInt(N.W))
  })

    val sum_temp  = (io.A_in + io.B_in).asUInt

    io.sum  := sum_temp
}

class  extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(32.W))
    val rs2 = Input(UInt(32.W))
    val ALU_SEL = Input(AluOP())
    val EXT_SEL = Input(Extension())
    val rd = Output(UInt(32.W))
  }) ")
file://<WORKSPACE>/file:<WORKSPACE>/src/main/scala/ZbaExt.scala
file://<WORKSPACE>/src/main/scala/ZbaExt.scala:34: error: expected identifier; obtained extends
class  extends Module {
       ^
#### Short summary: 

expected identifier; obtained extends