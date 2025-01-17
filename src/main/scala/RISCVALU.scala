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

//Implementing the CLMUL (carry-less multiply, low-part) instruction
//class Clmul(N: Int) extends Module {
//  val io = IO(new Bundle {
//    val A_in = Input(UInt(N.W))  
//    val B_in = Input(UInt(N.W))  
//    val C_out = Output(UInt(N.W)) 
//  })
//
//  // Temporary output register
//  val result = RegInit(0.U(N.W))
//
//  //val result = Wire(UInt(N.W))
//  //result := 0.U
//
//  // Iterate over each bit of B_in (rs2)
//  for (i <- 0 until N) {
//    val bitSet = (io.B_in >> i.U) & 1.U // Check if bit i of B_in is set
//    val partialProduct = Mux(bitSet === 1.U, io.A_in << i.U, 0.U) // Conditionally calculate the partial product
//    result := result ^ partialProduct // XOR the partial product with the current result
//  }
//
//  // Iterate over the bits of rs2
//  //for (i <- 0 until N) {
//  //  when((io.B_in >> i)(0) === 1.U) { // Check if bit `i` of rs2 is set
//  //    result := result ^ (io.A_in << i) // XOR with the shifted rs1_val
//  //  }
//  //}
//
//  io.C_out := result.asUInt // Assign the final result to the output
//
//}

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

  val signed_RS1 = RS1.asSInt
  val signed_RS2 = RS2.asSInt

  val RD = RegInit(0.U(32.W))

  val index = RS2 & 31.U // Mask RS2 to 5 bits (valid range: 0-31)

  // Check for reserved encoding (shamt[5] = 1)
  val isReserved = RS2(5) === 1.U 

  val ShiftL = Module(new ShiftLeft(32))

  val ShiftR = Module(new ShiftRight(32))

  val Add = Module(new Adder(32))

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

  //val CLMUL = Module(new Clmul(32))

  // Compute log2 of N to determine the number of shift bits which is 5 for 32 bits (Instructions ROL, ROR, RORI)
  val shamtBits = log2Ceil(32)

   // Initialize all module inputs to avoid uninitialized reference errors
 
  ShiftL.io.A_in := 0.U
  ShiftL.io.bits := 0.U

  ShiftR.io.A_in := 0.U
  ShiftR.io.bits := 0.U

  Add.io.A_in := 0.U
  Add.io.B_in := 0.U

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

  //CLMUL.io.A_in := 0.U
  //CLMUL.io.B_in := 0.U

      // Control logic for ALU operations based on EXT_SEL and ALU_SEL
  when(io.EXT_SEL === Extension.Zba) {
     // Extension Zba is selected
    switch(io.ALU_SEL) {

    // Instruction SH1ADD is selected
      is(AluOP.SH1ADD) {
        ShiftL.io.A_in := RS1
        ShiftL.io.bits := 1.U
        
        Add.io.A_in := ShiftL.io.A_out
        Add.io.B_in := RS2
        RD := Add.io.sum
      }

    // Instruction SHADD is selected
      is(AluOP.SH2ADD) {
        ShiftL.io.A_in := RS1
        ShiftL.io.bits := 2.U
        
        Add.io.A_in := ShiftL.io.A_out
        Add.io.B_in := RS2
        RD := Add.io.sum
      }

    // Instruction SH3ADD is selected   
      is(AluOP.SH3ADD) {
        ShiftL.io.A_in := RS1
        ShiftL.io.bits := 3.U
        
        Add.io.A_in := ShiftL.io.A_out
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

     // CLZ instruction is selected
      is(AluOP.CLZ) {
        CLZ.io.A_in := RS1
        RD := CLZ.io.A_out
      }

      // CTZ instruction is selected
      is(AluOP.CTZ) {
        CTZ.io.A_in := RS1
        RD := CTZ.io.A_out
      }

      // CPOP instruction is selected
      is(AluOP.CPOP) {
        CPOP.io.A_in := RS1
        RD := CPOP.io.A_out
      }

      // Instruction MAX is selected
     is(AluOP.MAX) {
       
       MAX.io.A_in := signed_RS1
       MAX.io.B_in := signed_RS2

       RD := MAX.io.max
     }

      // Instruction MAXU is selected
     is(AluOP.MAXU) {
       
       MAXU.io.A_in := RS1
       MAXU.io.B_in := RS2

       RD := MAXU.io.maxu
     }

     // Instruction MIN is selected
     is(AluOP.MIN) {
       
       MIN.io.A_in := signed_RS1
       MIN.io.B_in := signed_RS2

       RD := MIN.io.min
     }

     // Instruction MINU is selected
     is(AluOP.MINU) {
       
       MINU.io.A_in := RS1
       MINU.io.B_in := RS2

       RD := MINU.io.minu
     }

     // SEXTB instruction is selected
      is(AluOP.SEXTB) {
        SEXTB.io.A_in := RS1
        RD := SEXTB.io.A_out
      }

      // SEXTH instruction is selected
      is(AluOP.SEXTH) {
        SEXTH.io.A_in := RS1
        RD := SEXTH.io.A_out
      }

      // ZEXTH instruction is selected
      is(AluOP.ZEXTH) {
        ZEXTH.io.A_in := RS1
        RD := ZEXTH.io.A_out
      }

      // ROL instruction is selected
      is(AluOP.ROL) {

      // Extract the least significant shamtBits from B_in
        val shamt = RS2(shamtBits - 1, 0)

        val leftShiftBits = shamt
        val rightShiftBits = 32.U - shamt

        ShiftL.io.A_in := RS1
        ShiftL.io.bits := leftShiftBits

        ShiftR.io.A_in := RS1
        ShiftR.io.bits := rightShiftBits

        OR.io.A_in := ShiftL.io.A_out
        OR.io.B_in := ShiftR.io.A_out

        RD := OR.io.or
      }

      // ROL instruction is selected
      is(AluOP.ROR) {

      // Extract the least significant shamtBits from B_in
        val shamt = RS2(shamtBits - 1, 0)

        val leftShiftBits = 32.U - shamt
        val rightShiftBits = shamt

        ShiftL.io.A_in := RS1
        ShiftL.io.bits := leftShiftBits

        ShiftR.io.A_in := RS1
        ShiftR.io.bits := rightShiftBits

        OR.io.A_in := ShiftR.io.A_out
        OR.io.B_in := ShiftL.io.A_out

        RD := OR.io.or
      }

      // ROL instruction is selected
      is(AluOP.RORI) {

      // Extract the least significant shamtBits from B_in
        val shamt = RS2(shamtBits - 1, 0)

        val leftShiftBits = 32.U - shamt
        val rightShiftBits = shamt

        ShiftL.io.A_in := RS1
        ShiftL.io.bits := leftShiftBits

        ShiftR.io.A_in := RS1
        ShiftR.io.bits := rightShiftBits

        OR.io.A_in := ShiftR.io.A_out
        OR.io.B_in := ShiftL.io.A_out

         // Detect an illegal instruction (reserved encoding) for RV32
        // val illegal = shamt(4) === 1.U//

        //RD :=  Mux(illegal, 0.U,OR.io.or)

        // TODO: "For RV32, the encodings corresponding to shamt[5]=1 are reserved."

        RD := OR.io.or
      }

      // ORCB instruction is selected
      is(AluOP.ORCB) {
        ORCB.io.A_in := RS1
        RD := ORCB.io.A_out
      }

      // REV8 instruction is selected
      is(AluOP.REV8) {
        REV8.io.A_in := RS1
        RD := REV8.io.A_out
      }

      //is(AluOP.CLMUL) { // Add a case for the CLMUL instruction
      //CLMUL.io.A_in := RS1
      //CLMUL.io.B_in := RS2
      //RD := CLMUL.io.C_out
    }
  }

      .elsewhen(io.EXT_SEL === Extension.Zbs) {
       // Extension Zbs is selected
       switch(io.ALU_SEL) {

      // BCLR instruction is selected
      is(AluOP.BCLR) {

        //AND.io.A_in := RS2
        //AND.io.B_in := 31.U

        //index := AND.io.and

        ShiftL.io.A_in := 1.U 
        ShiftL.io.bits := index

        Invert.io.A_in := ShiftL.io.A_out

        AND.io.A_in := RS1
        AND.io.B_in := Invert.io.A_out

        RD := AND.io.and
      }

      // BCLR instruction is selected
      is(AluOP.BCLRI) {
          when(!isReserved) { // Proceed only if not a reserved encoding
          ShiftL.io.A_in := 1.U
          ShiftL.io.bits := index

          Invert.io.A_in := ShiftL.io.A_out

          AND.io.A_in := RS1
          AND.io.B_in := Invert.io.A_out
          RD := AND.io.and
        }.otherwise {
          // Handle reserved encoding (e.g., set RD to 0)
          RD := 0.U // Alternatively, raise an exception if needed
        }
      }

      // BEXT instruction is selected
      is(AluOP.BEXT) {

        ShiftR.io.A_in := RS1
        ShiftR.io.bits := index 

        AND.io.A_in := ShiftR.io.A_out
        AND.io.B_in := 1.U

        RD := AND.io.and
      }

      // BEXTI instruction is selected
      is(AluOP.BEXTI) {
          when(!isReserved) { // Proceed only if not a reserved encoding
          ShiftR.io.A_in := RS1
          ShiftR.io.bits := index

          AND.io.A_in := ShiftR.io.A_out
          AND.io.B_in := 1.U
          RD := AND.io.and
        }.otherwise {
          // Handle reserved encoding (e.g., set RD to 0)
          RD := 0.U // Alternatively, raise an exception if needed
        }
      }

      // BSET instruction is selected
      is(AluOP.BSET) {

        ShiftL.io.A_in := 1.U 
        ShiftL.io.bits := index

        OR.io.A_in := RS1
        OR.io.B_in := ShiftL.io.A_out

        RD := OR.io.or
      }

      // BSETI instruction is selected
      is(AluOP.BSETI) {
          when(!isReserved) { // Proceed only if not a reserved encoding
          ShiftL.io.A_in := 1.U 
          ShiftL.io.bits := index
  
          OR.io.A_in := RS1
          OR.io.B_in := ShiftL.io.A_out
  
          RD := OR.io.or
        }.otherwise {
          // Handle reserved encoding (e.g., set RD to 0)
          RD := 0.U // Alternatively, raise an exception if needed
        }
      }
      
     }
    }

  io.rd := RD // Output the result

} 
  

object GenerateVerilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new PExtALU(), Array("--target-dir", "generated"))
}