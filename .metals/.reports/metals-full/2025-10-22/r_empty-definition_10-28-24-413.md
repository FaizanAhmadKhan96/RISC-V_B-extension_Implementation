error id: file://<WORKSPACE>/src/main/scala/ZbaExt.scala:`<none>`.
file://<WORKSPACE>/src/main/scala/ZbaExt.scala
empty definition using pc, found symbol in pc: `<none>`.
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/Input.
	 -chisel3/Input#
	 -chisel3/Input().
	 -chisel3/util/Input.
	 -chisel3/util/Input#
	 -chisel3/util/Input().
	 -ZbaInstr.Input.
	 -ZbaInstr.Input#
	 -ZbaInstr.Input().
	 -Input.
	 -Input#
	 -Input().
	 -scala/Predef.Input.
	 -scala/Predef.Input#
	 -scala/Predef.Input().
offset: 809
uri: file://<WORKSPACE>/src/main/scala/ZbaExt.scala
text:
```scala
package ZbaExt

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

class Zba extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(32.W))
    val rs2 = Input(UInt(32.W))
    val INSTR_SEL = I@@nput(ZbaOP())
    val rd = Output(UInt(32.W))
  }) 

  val shiftL = Module(new ShiftLeft(32))
  val add = Module(new Adder(32))

  shiftL.io.A_in := 0.U
  shiftL.io.bits := 0.U
  add.io.A_in := 0.U
  add.io.B_in := 0.U

  val rd = WireDefault(0.U(32.W))

  switch(io.INSTR.SEL) {
    is(ZbaOP.SH1ADD) {
      shiftL.io.A_in := io.rs1
      shiftL.io.bits := 1.U
      add.io.A_in := shiftL.io.A_out
      add.io.B_in := io.rs2
      rd := add.io.sum
    }
    is(ZbaOP.SH2ADD) {
      shiftL.io.A_in := io.rs1
      shiftL.io.bits := 2.U
      add.io.A_in := shiftL.io.A_out
      add.io.B_in := io.rs2
      rd := add.io.sum
    }
    is(ZbaOP.SH3ADD) {
      shiftL.io.A_in := io.rs1
      shiftL.io.bits := 3.U
      add.io.A_in := shiftL.io.A_out
      add.io.B_in := io.rs2
      rd := add.io.sum
    }
  }

  io.rd := rd
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: `<none>`.