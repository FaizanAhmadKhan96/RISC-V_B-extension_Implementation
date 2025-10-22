package ZbsExt

import chisel3._
import chisel3.util._
import ZbsInstr._
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

// Implementing n bit shift right
class ShiftRight(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val bits = Input(UInt(log2Ceil(N).W))
    val A_out = Output(UInt(N.W))
  })

    val A_temp  = (io.A_in >> io.bits).asUInt

    io.A_out  := A_temp
}

// Implementing n bits bitwise inversion
class InvertBits(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val A_out = Output(UInt(N.W))
  })

    val A_temp  = (~(io.A_in)).asUInt

    io.A_out  := A_temp
}

// Implementing n bits bitwise AND
class ANDBits(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val B_in = Input(UInt(N.W))
    val and = Output(UInt(N.W))
  })

    val and_temp  = (io.A_in & io.B_in).asUInt

    io.and  := and_temp
}

// Implementing n bits bitwise OR
class ORBits(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val B_in = Input(UInt(N.W))
    val or = Output(UInt(N.W))
  })

    val or_temp  = (io.A_in | io.B_in).asUInt

    io.or  := or_temp
}

// Implementing n bits bitwise XOR
class XORBits(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val B_in = Input(UInt(N.W))
    val xor = Output(UInt(N.W))
  })

    val xor_temp  = (io.A_in ^ io.B_in).asUInt

    io.xor  := xor_temp
}

class Zbs extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(32.W))
    val rs2 = Input(UInt(32.W))
    val INSTR_SEL = Input(ZbsOP())
    val rd = Output(UInt(32.W))
  }) 

  val RS1 = io.rs1
  val RS2 = io.rs2

  val ShiftL = Module(new ShiftLeft(32))

  val ShiftR = Module(new ShiftRight(32))

  val Invert = Module(new InvertBits(32))

  val AND = Module(new ANDBits(32))

  val OR = Module(new ORBits(32))

  val XOR = Module(new XORBits(32))

  // Compute log2 of N to determine the number of shift bits which is 5 for 32 bits (Instructions ROL, ROR, RORI)
  val shamtBits = log2Ceil(32)

  val shamt = RS2(shamtBits - 1, 0)

  ShiftL.io.A_in := 0.U
  ShiftL.io.bits := 0.U

  ShiftR.io.A_in := 0.U
  ShiftR.io.bits := 0.U

  Invert.io.A_in := 0.U

  AND.io.A_in := 0.U
  AND.io.B_in := 0.U

  OR.io.A_in := 0.U
  OR.io.B_in := 0.U

  XOR.io.A_in := 0.U
  XOR.io.B_in := 0.U

  val rd = WireDefault(0.U(32.W))

  switch(io.INSTR_SEL) {
    is(ZbsOP.BCLR) {
      ShiftL.io.A_in := 1.U 
      ShiftL.io.bits := shamt

      Invert.io.A_in := ShiftL.io.A_out

      AND.io.A_in := RS1
      AND.io.B_in := Invert.io.A_out

      rd := AND.io.and
    }
    is(ZbsOP.BCLRI) {
      // If shamt[4] is high, drop it and use only shamt(3,0).
      // Otherwise use shamt as is.
      val realShamt = Mux(shamt(4) === 1.U, shamt(3,0), shamt)
        
      ShiftL.io.A_in := 1.U
      ShiftL.io.bits := realShamt

      Invert.io.A_in := ShiftL.io.A_out

      AND.io.A_in := RS1
      AND.io.B_in := Invert.io.A_out
      rd := AND.io.and
    }
    is(ZbsOP.BEXT) {
      ShiftR.io.A_in := RS1
      ShiftR.io.bits := shamt 

      AND.io.A_in := ShiftR.io.A_out
      AND.io.B_in := 1.U

      rd := AND.io.and
    }
    is(ZbsOP.BEXTI) {
      // If shamt[4] is high, drop it and use only shamt(3,0).
      // Otherwise use shamt as is.
      val realShamt = Mux(shamt(4) === 1.U, shamt(3,0), shamt)
        
      ShiftR.io.A_in := RS1
      ShiftR.io.bits := realShamt 

      AND.io.A_in := ShiftR.io.A_out
      AND.io.B_in := 1.U
      rd := AND.io.and
    }
    is(ZbsOP.BINV) {
      ShiftL.io.A_in := 1.U 
      ShiftL.io.bits := shamt

      XOR.io.A_in := RS1
      XOR.io.B_in := ShiftL.io.A_out

      rd := XOR.io.xor
    }
    is(ZbsOP.BINVI) {
      // If shamt[4] is high, drop it and use only shamt(3,0).
      // Otherwise use shamt as is.
      val realShamt = Mux(shamt(4) === 1.U, shamt(3,0), shamt)
           
      ShiftL.io.A_in := 1.U 
      ShiftL.io.bits := realShamt 
    
      XOR.io.A_in := RS1
      XOR.io.B_in := ShiftL.io.A_out
    
      rd := XOR.io.xor
    }
    is(ZbsOP.BSET) {
      ShiftL.io.A_in := 1.U 
      ShiftL.io.bits := shamt

      OR.io.A_in := RS1
      OR.io.B_in := ShiftL.io.A_out

      rd := OR.io.or
    }
    is(ZbsOP.BSETI) {
      // If shamt[4] is high, drop it and use only shamt(3,0).
      // Otherwise use shamt as is.
      val realShamt = Mux(shamt(4) === 1.U, shamt(3,0), shamt)
           
      ShiftL.io.A_in := 1.U 
      ShiftL.io.bits := realShamt 
    
      OR.io.A_in := RS1
      OR.io.B_in := ShiftL.io.A_out
    
      rd := OR.io.or
    }
  }

  io.rd := rd
}

object GenerateVerilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Zbs(), Array("--target-dir", "generated"))
}