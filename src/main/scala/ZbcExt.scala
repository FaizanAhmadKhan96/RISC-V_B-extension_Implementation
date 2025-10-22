package ZbcExt

import chisel3._
import chisel3.util._
import ZbcInstr._
import scala.annotation.switch

//Implementing the CLMUL (carry-less multiply, low-part) instruction
class Clmul(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val B_in = Input(UInt(N.W))
    val C_out = Output(UInt(N.W))
  })

  // Compute each shifted term and XOR them in parallel
  val terms = (0 until (N-1)).map { i =>
    val shifted = (io.A_in << i)          // Shift and truncate to N bits
    Mux(io.B_in(i), shifted, 0.U)        // Mask with rs2's bit
  }

  // XOR all terms together
  io.C_out := terms.reduce(_ ^ _)
}

//Implementing the CLMULH (carry-less multiply, high-part) instruction
class Clmulh(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))
    val B_in = Input(UInt(N.W))
    val C_out = Output(UInt(N.W))
  })

  // Generate terms for each bit position from 1 to N-1 (inclusive)
  val terms = (1 until N).map { i =>
    val shifted = io.A_in >> (N - i).U // Right shift A_in by (N - i)
    Mux(io.B_in(i), shifted, 0.U) // Select shifted value or zero based on the bit
  }

  // XOR all generated terms to get the final result
  io.C_out := terms.reduce(_ ^ _)
}

// Implementing CLMULR (carry-less multiply, reversed)
class Clmulr(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in  = Input(UInt(N.W))
    val B_in  = Input(UInt(N.W))
    val C_out = Output(UInt(N.W))
  })

  // For each bit i in B_in, shift A_in right by (N - i - 1) bits,
  // then use the bit from B_in as the mask. The terms are XORed together.
  val terms = (0 until (N-1)).map { i =>
    // Note: (N - i - 1).U gives the shift amount in UInt.
    val shifted = io.A_in >> ((N - i - 1).U)
    Mux(io.B_in(i), shifted, 0.U)
  }

  // XOR all the generated terms together to produce the final result.
  io.C_out := terms.reduce(_ ^ _)
}

class Zbc extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(32.W))
    val rs2 = Input(UInt(32.W))
    val INSTR_SEL = Input(ZbcOP())
    val rd = Output(UInt(32.W))
  }) 

  val RS1 = io.rs1
  val RS2 = io.rs2

  val CLMUL = Module(new Clmul(32))

  val CLMULH = Module(new Clmulh(32))

  val CLMULR = Module(new Clmulr(32))

  CLMUL.io.A_in := 0.U
  CLMUL.io.B_in := 0.U

  CLMULH.io.A_in := 0.U
  CLMULH.io.B_in := 0.U

  CLMULR.io.A_in := 0.U
  CLMULR.io.B_in := 0.U

  val rd = WireDefault(0.U(32.W))

  switch(io.INSTR_SEL) {
    is(ZbcOP.CLMUL) { 
      CLMUL.io.A_in := RS1
      CLMUL.io.B_in := RS2
      rd := CLMUL.io.C_out
    }
    is(ZbcOP.CLMULH) { 
      CLMULH.io.A_in := RS1
      CLMULH.io.B_in := RS2
      rd := CLMULH.io.C_out
    }
    is(ZbcOP.CLMULR) { 
      CLMULR.io.A_in := RS1
      CLMULR.io.B_in := RS2
      rd := CLMULR.io.C_out
    }
  }

  io.rd := rd
}

object GenerateVerilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Zbc(), Array("--target-dir", "generated"))
}