package riscvALU

import chisel3._
import chisel3.util._
import ALUType._
import ExtensionType._
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

class PExtALU extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(32.W))
    val rs2 = Input(UInt(32.W))
    val ALU_SEL = Input(AluOP())
    val EXT_SEL = Input(Extension())
    val rd = Output(UInt(32.W))
  }) 

  //val index = io.operand_A(31,0).asUInt
  //val zero_extended_index = Cat(0.U(32.W), index)

  val RS1 = io.rs1
  val RS2 = io.rs2

  val RD = Reg(UInt(32.W))

  RD := 0.U

  val Shift = Module(new ShiftLeft(32))

  val Add = Module(new Adder(32))

  val Invert = Module(new InvertBits(32))

  val AND = Module(new ANDBits(32))

  val OR = Module(new ORBits(32))

  val XOR = Module(new XORBits(32))

   // Initialize all module inputs to avoid uninitialized reference errors
 
  Shift.io.A_in := 0.U
  Shift.io.bits := 0.U

  Add.io.A_in := 0.U
  Add.io.B_in := 0.U

  Invert.io.A_in := 0.U

  AND.io.A_in := 0.U
  AND.io.B_in := 0.U

  OR.io.A_in := 0.U
  OR.io.B_in := 0.U

  XOR.io.A_in := 0.U
  XOR.io.B_in := 0.U

      // Control logic for ALU operations based on EXT_SEL and ALU_SEL
  when(io.EXT_SEL === Extension.Zba) {
     // Extension Zba is selected
    switch(io.ALU_SEL) {

    // Instruction SH1ADD is selected
      is(AluOP.SH1ADD) {
        Shift.io.A_in := RS1
        Shift.io.bits := 1.U
        
        Add.io.A_in := Shift.io.A_out
        Add.io.B_in := RS2
        RD := Add.io.sum
      }

    // Instruction SHADD is selected
      is(AluOP.SH2ADD) {
        Shift.io.A_in := RS1
        Shift.io.bits := 2.U
        
        Add.io.A_in := Shift.io.A_out
        Add.io.B_in := RS2
        RD := Add.io.sum
      }

    // Instruction SH3ADD is selected   
      is(AluOP.SH3ADD) {
        Shift.io.A_in := RS1
        Shift.io.bits := 3.U
        
        Add.io.A_in := Shift.io.A_out
        Add.io.B_in := RS2
        RD := Add.io.sum
      }
    }
 }   
 
 .elsewhen(io.EXT_SEL === Extension.Zbb) {
   // Extension Zbb is selected
   switch(io.ALU_SEL) {

    // Logical with negate instructions

   // Instruction ANDN is selected
     is(AluOP.ANDN) {
       Invert.io.A_in := RS2
       
       AND.io.A_in := RS1
       AND.io.B_in := Invert.io.A_out
       RD := AND.io.and
     }

     // Instruction ORN is selected
     is(AluOP.ORN) {
       Invert.io.A_in := RS2
       
       OR.io.A_in := RS1
       OR.io.B_in := Invert.io.A_out
       RD := OR.io.or
     }

     // Instruction XOR is selected
     is(AluOP.XOR) {
       
       XOR.io.A_in := RS1
       XOR.io.B_in := RS2

       Invert.io.A_in := XOR.io.xor
       RD := Invert.io.A_out
     }
   }
  }

  io.rd := RD // Output the result

} 
  

object GenerateVerilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new PExtALU(), Array("--target-dir", "generated"))
}