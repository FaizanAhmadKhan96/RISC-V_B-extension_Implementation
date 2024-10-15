package riscvALU

import chisel3._
import chisel3.util._
import ALUType._
import scala.annotation.switch

// Implementing n bit shift left
class ShiftLeft(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val bits = Input(UInt(log2Ceil(N).W))
    val A_out = Output(UInt(N.W))
  })

    val A_temp  = (io.A_in << io.bits).asUInt

    io.A_out  := A_temp(N-1, 0)
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

class PExtALU extends Module {
  val io = IO(new Bundle {
    val operand_A = Input(UInt(64.W))
    val operand_B = Input(UInt(64.W))
    val ALU_SEL = Input(AluOP())
    val result = Output(UInt(64.W))
  })

  val index = io.operand_A(31,0).asUInt
  val zero_extended_index = Cat(0.U(32.W), index)
  val base = io.operand_B

  val A = io.operand_A

  val result = Reg(UInt(64.W))

  result := 0.U

  val Shift = Module(new ShiftLeft(64))

  val Add = Module(new Adder(64))

   // Initialize all module inputs to avoid uninitialized reference errors
 
  Shift.io.A_in := 0.U
  Shift.io.bits := 0.U

  Add.io.A_in := 0.U
  Add.io.B_in := 0.U

    switch(io.ALU_SEL) {
      is(AluOP.ADD_UW) {

        Add.io.A_in := zero_extended_index
        Add.io.B_in := base

        result := Add.io.sum
      }

      is(AluOP.SH1ADD) {
      
        Shift.io.A_in := A
        Shift.io.bits := 1.U
        
        Add.io.A_in := Shift.io.A_out
        Add.io.B_in := base
        result := Add.io.sum
      }
    }

    io.result := result
}


object GenerateVerilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new PExtALU(), Array("--target-dir", "generated"))
}