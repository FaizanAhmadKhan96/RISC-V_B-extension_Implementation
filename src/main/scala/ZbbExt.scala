package ZbbExt

import chisel3._
import chisel3.util._
import ZbbInstr._
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

// Implementing n bits leading zero counter CLZ
class CountLeadingZeros(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W)) // Input signal
    val A_out = Output(UInt(log2Ceil(N+1).W)) // Output leading zero count
  })

  // Reverse the bits and use PriorityEncoder to find leading zeros
  val reversed = Reverse(io.A_in) // Reverse the input bits so that MSB is at LSB
  val leadingZeros = PriorityEncoder(reversed) // PriorityEncoder finds the first 1 by counting from LSB
 
  // If the input is all zeros, set the result to N (32 for 32-bit input)
  io.A_out := Mux(io.A_in === 0.U, N.U, leadingZeros)
}

// Counting trailing zeros using priority encoder
class CountTrailingZeros(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))       // Input signal
    val A_out = Output(UInt(log2Ceil(N+1).W)) // Output trailing zero count
  })

  // PriorityEncoder finds the first '1', which corresponds to the trailing zero count
  val trailingZeros = PriorityEncoder(io.A_in)

  // If the input is all zeros, set the result to N (word size)
  io.A_out := Mux(io.A_in === 0.U, N.U, trailingZeros)
}

// Implementing count population instruction counting number of true or 1 bits
class CountPopulation(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in  = Input(UInt(N.W))  
    val A_out  = Output(UInt(N.W)) 
  })

  // Count the number of 1's in rs
  io.A_out := PopCount(io.A_in)
}

// Finding maximum signed operand between A_in and B_in
class MaxInstruction (N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(SInt(N.W)) 
    val B_in = Input(SInt(N.W)) 
    val max = Output(UInt(N.W)) 
  })

  // Compare A_in and B_in, and assign the maximum value to max
  io.max := Mux(io.A_in < io.B_in, io.B_in, io.A_in).asUInt
}

// Finding maximum unsigned operand between rA_in and B_in
class MaxUInstruction (N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W)) 
    val B_in = Input(UInt(N.W)) 
    val maxu = Output(UInt(N.W)) 
  })

  // Compare A_in and B_in, and assign the maximum value to maxu
  io.maxu := Mux(io.A_in < io.B_in, io.B_in, io.A_in)
}

// Finding minimum signed operand between A_in and B_in
class MinInstruction (N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(SInt(N.W)) 
    val B_in = Input(SInt(N.W)) 
    val min = Output(UInt(N.W)) 
  })

  // Compare A_in and B_in, and assign the maximum value to min
  io.min := Mux(io.A_in < io.B_in, io.A_in, io.B_in).asUInt
}

// Finding minimum unsigned operand between A_in and B_in
class MinUInstruction (N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W)) 
    val B_in = Input(UInt(N.W)) 
    val minu = Output(UInt(N.W)) 
  })

  // Compare A_in and B_in, and assign the maximum value to minu
  io.minu := Mux(io.A_in < io.B_in, io.A_in, io.B_in)
}

// Sign extention after most significant bit of least significant byte (7,0) all the way upto the most significant bit (32 bit) of operand rs1
class SextB (N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))  
    val A_out = Output(UInt(N.W)) 
  })

  // Extract the least significant byte
  val byte = io.A_in(7, 0)

  // Sign-extend the byte to 32 bits
  val signExtended = Cat(Fill(24, byte(7)), byte) // Fill the upper 24 bits with the MSB (bit 7)

  // Output the result
  io.A_out := signExtended
}

// Sign extention after most significant bit of least significant halfword (15,0) all the way upto the most significant bit (32 bit) of operand rs1
class SextH (N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))  
    val A_out = Output(UInt(N.W)) 
  })

  // Extract the least significant half word
  val halfword = io.A_in(15, 0)

  // Sign-extend the byte to 32 bits
  val signExtendedH = Cat(Fill(16, halfword(15)), halfword) // Fill the upper 24 bits with the MSB (bit 7)

  // Output the result
  io.A_out := signExtendedH
}

// Zero extention after most significant bit of least significant halfword (15,0) all the way upto the most significant bit (32 bit) of operand rs1
class ZextH(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W)) 
    val A_out = Output(UInt(N.W)) 
  })

  // Extract the least-significant 16 bits and zero-extend to N bits (32)
  io.A_out := io.A_in(15, 0).asUInt & Fill(N, 1.U(1.W))
}

// Taking OR of every byte individually and then combining the result
class OrcB(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W)) 
    val A_out = Output(UInt(N.W))
  })

  // Number of bytes in the input register
  val numBytes = N / 8
  val inputBytes = Wire(Vec(numBytes, UInt(8.W)))

  // Extract each byte
  for (i <- 0 until numBytes) {
    inputBytes(i) := io.A_in(8 * (i + 1) - 1, 8 * i)
  }

  // OR combine each byte
  val outputBytes = Wire(Vec(numBytes, UInt(8.W)))

  for (i <- 0 until numBytes) {
    // Check if any bit in the byte is set
    when(inputBytes(i) === 0.U) {
      outputBytes(i) := 0x00.U
    }.otherwise {
      outputBytes(i) := 0xFF.U
    }
  }
  
  // Combine the processed bytes into the output register
  io.A_out := outputBytes.asUInt
}

// Reversing the order of bytes
class Rev8(N: Int) extends Module {
  val io = IO(new Bundle {
    val A_in = Input(UInt(N.W))  
    val A_out = Output(UInt(N.W)) 
  })

  // Calculate the number of bytes in the register
  val numBytes = N / 8

  // Reverse the bytes
  val ByteOrder = Wire(Vec(numBytes, UInt(8.W)))
  for (i <- 0 until numBytes) {
    ByteOrder(i) := io.A_in((i + 1) * 8 - 1, i * 8) // Extract byte i
  }

  // Concatenate reversed bytes and assign to ReverseOrder
  val ReverseOrder = ByteOrder.reverse

  // Convert to Vec and then to UInt
  io.A_out := VecInit(ReverseOrder).asUInt 
}

class Zbb extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(32.W))
    val rs2 = Input(UInt(32.W))
    val INSTR_SEL = Input(ZbbOP())
    val rd = Output(UInt(32.W))
  }) 

  val RS1 = io.rs1
  val RS2 = io.rs2

  val signed_RS1 = RS1.asSInt
  val signed_RS2 = RS2.asSInt

  val ShiftL = Module(new ShiftLeft(32))

  val ShiftR = Module(new ShiftRight(32))

  val Invert = Module(new InvertBits(32))

  val AND = Module(new ANDBits(32))

  val OR = Module(new ORBits(32))

  val XOR = Module(new XORBits(32))

  val CLZ = Module(new CountLeadingZeros(32))

  val CTZ = Module(new CountTrailingZeros(32))

  val CPOP = Module(new CountPopulation(32))

  val MAX = Module(new MaxInstruction(32))

  val MAXU = Module(new MaxUInstruction(32))

  val MIN = Module(new MinInstruction(32))

  val MINU = Module(new MinUInstruction(32))

  val SEXTB = Module(new SextB(32))

  val SEXTH = Module(new SextH(32))

  val ZEXTH = Module(new ZextH(32))

  val ORCB = Module(new OrcB(32))

  val REV8 = Module(new Rev8(32))

  // Compute log2 of N to determine the number of shift bits which is 5 for 32 bits (Instructions ROL, ROR, RORI)
  val shamtBits = log2Ceil(32)

  val shamt = RS2(shamtBits - 1, 0)

   // Initialize all module inputs to avoid uninitialized reference errors
 
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

  CLZ.io.A_in := 0.U

  CTZ.io.A_in := 0.U

  CPOP.io.A_in := 0.U

  MAX.io.A_in := 0.S
  MAX.io.B_in := 0.S

  MAXU.io.A_in := 0.U
  MAXU.io.B_in := 0.U

  MIN.io.A_in := 0.S
  MIN.io.B_in := 0.S

  MINU.io.A_in := 0.U
  MINU.io.B_in := 0.U

  SEXTB.io.A_in := 0.U

  SEXTH.io.A_in := 0.U

  ZEXTH.io.A_in := 0.U

  ORCB.io.A_in := 0.U

  REV8.io.A_in := 0.U

  val rd = WireDefault(0.U(32.W))

  switch(io.INSTR_SEL) {
    is(ZbbOP.ANDN) {
      Invert.io.A_in := RS2
       
      AND.io.A_in := RS1
      AND.io.B_in := Invert.io.A_out
      rd := AND.io.and
    }
    
    is(ZbbOP.ORN) {
      Invert.io.A_in := RS2
       
      OR.io.A_in := RS1
      OR.io.B_in := Invert.io.A_out
      rd := OR.io.or
    }

    is(ZbbOP.XNOR) {
      XOR.io.A_in := RS1
      XOR.io.B_in := RS2

      Invert.io.A_in := XOR.io.xor
      rd := Invert.io.A_out
    }

    is(ZbbOP.CLZ) {
      CLZ.io.A_in := RS1
      rd := CLZ.io.A_out
    }

    is(ZbbOP.CTZ) {
      CTZ.io.A_in := RS1
      rd := CTZ.io.A_out
    }

    is(ZbbOP.CPOP) {
      CPOP.io.A_in := RS1
      rd := CPOP.io.A_out
    }

    is(ZbbOP.MAX) {
      MAX.io.A_in := signed_RS1
      MAX.io.B_in := signed_RS2

      rd := MAX.io.max
    }

    is(ZbbOP.MAXU) {
      MAXU.io.A_in := RS1
      MAXU.io.B_in := RS2

      rd := MAXU.io.maxu
    }

    is(ZbbOP.MIN) {
      MIN.io.A_in := signed_RS1
      MIN.io.B_in := signed_RS2

      rd := MIN.io.min
    }

    is(ZbbOP.MINU) {
      MINU.io.A_in := RS1
      MINU.io.B_in := RS2

      rd := MINU.io.minu
    }

    is(ZbbOP.SEXTB) {
      SEXTB.io.A_in := RS1
      rd := SEXTB.io.A_out
    }

    is(ZbbOP.SEXTH) {
      SEXTH.io.A_in := RS1
      rd := SEXTH.io.A_out
    }

    is(ZbbOP.ZEXTH) {
      ZEXTH.io.A_in := RS1
      rd := ZEXTH.io.A_out
    }

    is(ZbbOP.ROL) {
      
      val leftShiftBits = shamt
      val rightShiftBits = 32.U - shamt

      ShiftL.io.A_in := RS1
      ShiftL.io.bits := leftShiftBits

      ShiftR.io.A_in := RS1
      ShiftR.io.bits := rightShiftBits

      OR.io.A_in := ShiftL.io.A_out
      OR.io.B_in := ShiftR.io.A_out

      rd := OR.io.or
    }

    is(ZbbOP.ROR) {

      val leftShiftBits = 32.U - shamt
      val rightShiftBits = shamt

      ShiftL.io.A_in := RS1
      ShiftL.io.bits := leftShiftBits

      ShiftR.io.A_in := RS1
      ShiftR.io.bits := rightShiftBits

      OR.io.A_in := ShiftR.io.A_out
      OR.io.B_in := ShiftL.io.A_out

      rd := OR.io.or
    }

    is(ZbbOP.RORI) {
      
      val leftShiftBits = 32.U - shamt
      val rightShiftBits = shamt
        
      ShiftL.io.A_in := RS1
      ShiftL.io.bits := leftShiftBits

      ShiftR.io.A_in := RS1
      ShiftR.io.bits := rightShiftBits
        
      OR.io.A_in := ShiftR.io.A_out
      OR.io.B_in := ShiftL.io.A_out
        
      rd := OR.io.or
    }

    is(ZbbOP.ORCB) {
      ORCB.io.A_in := RS1
      rd := ORCB.io.A_out
    }
    is(ZbbOP.REV8) {
      REV8.io.A_in := RS1
      rd := REV8.io.A_out
    }
  }

  io.rd := rd
}

object GenerateVerilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Zbb(), Array("--target-dir", "generated"))
}