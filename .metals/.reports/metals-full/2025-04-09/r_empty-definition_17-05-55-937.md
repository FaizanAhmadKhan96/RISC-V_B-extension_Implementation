error id: riscvALU/`<import>`.
file://<WORKSPACE>/src/test/scala/RISCVALUTest.scala
empty definition using pc, found symbol in pc: riscvALU/`<import>`.
empty definition using semanticdb
|empty definition using fallback
non-local guesses:
	 -

Document text:

```scala
package riscvALU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import ALUType._
import ExtensionType._
import scala.util.Random
import scala.math._

class RISCVALUTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {

  val IT_Max = 10 //max number of random tests
  val max_input_value:Int = math.pow(2.toDouble, 32).toInt

   behavior of "RiscV ALU"

  it should "output correct results" in {
//"DUT" should "pass" in {
test(new BExtALU ).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

  val specialCases = Seq(
        (0xFFFFFFFFL, 0xFFFFFFFFL), // RS1 = all F, RS2 = all F
        (0x00000000L, 0x00000000L), // RS1 = all 0, RS2 = all 0
        (0x00000001L, 0xFFFFFFFFL), // RS1 = all 0, RS2 = all F
        (0xFFFFFFFFL, 0x00000000L)  // RS1 = all F, RS2 = all 0
      )

      def runTest(RS1: Long, RS2: Long): Unit = {
        // Test SH1ADD
        val shiftl_ADD = (RS1 << 1) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_SH1ADDresult = (shiftl_ADD + RS2) & 0xFFFFFFFFL
        println(s"SH1ADD Test: rs1 = $RS1, rs2 = $RS2, shiftl = $shiftl_ADD, expected result = $expected_SH1ADDresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.SH1ADD)
        dut.io.EXT_SEL.poke(Extension.Zba)

        dut.clock.step()

        dut.io.rd.expect(expected_SH1ADDresult.asUInt)

        // Test SH2ADD
        val shift2_ADD = (RS1 << 2) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_SH2ADDresult = (shift2_ADD + RS2) & 0xFFFFFFFFL
        println(s"SH2ADD Test: rs1 = $RS1, rs2 = $RS2, shift2 = $shift2_ADD, expected result = $expected_SH2ADDresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.SH2ADD)
        dut.io.EXT_SEL.poke(Extension.Zba)

        dut.clock.step()

        dut.io.rd.expect(expected_SH2ADDresult.asUInt)

        // Test SH3ADD
        val shift3_ADD = (RS1 << 3) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_SH3ADDresult = (shift3_ADD + RS2) & 0xFFFFFFFFL
        println(s"SH3ADD Test: rs1 = $RS1, rs2 = $RS2, shift3 = $shift3_ADD, expected result = $expected_SH3ADDresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.SH3ADD)
        dut.io.EXT_SEL.poke(Extension.Zba)

        dut.clock.step()

        dut.io.rd.expect(expected_SH3ADDresult.asUInt)

        // Test ANDN
        val INVERT_AND = ~(RS2) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_ANDNresult = (RS1 & INVERT_AND) & 0xFFFFFFFFL
        println(s"ANDN Test: rs1 = $RS1, rs2 = $RS2, invert_rs2 = $INVERT_AND, expected result = $expected_ANDNresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.ANDN)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expected_ANDNresult.asUInt)

        // Test ORN
        val INVERT_OR = ~(RS2) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_ORNresult = (RS1 | INVERT_OR) & 0xFFFFFFFFL
        println(s"ORN Test: rs1 = $RS1, rs2 = $RS2, invert_rs2 = $INVERT_OR, expected result = $expected_ORNresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.ORN)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expected_ORNresult.asUInt)

        // Test XOR
        val XOR = (RS1 ^ RS2) & 0xFFFFFFFFL
        val expected_XORresult = ~(XOR) & 0xFFFFFFFFL
        println(s"XOR Test: rs1 = $RS1, rs2 = $RS2, xor = $XOR, expected result = $expected_XORresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.XOR)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expected_XORresult.asUInt)

        // Test CLZ (Count Leading Zeros)
        val expected_CLZresult = RS1.toBinaryString.reverse.padTo(32, '0').reverse.indexOf('1') match {
          case -1 => 32 // If there is no '1', all bits are 0, so count is 32
          case index => index
        }
        println(s"CLZ Test: rs1 = $RS1, expected result = $expected_CLZresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.ALU_SEL.poke(AluOP.CLZ)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expected_CLZresult.U)

        // Test CTZ (Count Leading Zeros)
        val binary_string = RS1.toBinaryString.reverse.padTo(32, '0')
        val expected_CTZresult = binary_string.indexOf('1') match {
          case -1 => 32 // If there is no '1', all bits are 0, so count is 32
          case index => index
        }
        println(s"CTZ Test: rs1 = $RS1, expected result = $expected_CTZresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.ALU_SEL.poke(AluOP.CTZ)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expected_CTZresult.U)

        // Test CPOP (Count Population)
        val expected_CPOPresult = RS1.toBinaryString.count(_ == '1') // Count number of '1's in RS1
        println(s"CPOP Test: rs1 = $RS1, expected result = $expected_CPOPresult")

      
        dut.io.rs1.poke(RS1.U)
        dut.io.ALU_SEL.poke(AluOP.CPOP)
        dut.io.EXT_SEL.poke(Extension.Zbb)
      
        dut.clock.step()
      
        dut.io.rd.expect(expected_CPOPresult.U)

        // Test MAX (Signed Maximum)
        val signedRS1 = RS1.toInt // Convert RS1 to signed 32-bit integer
        val signedRS2 = RS2.toInt // Convert RS2 to signed 32-bit integer
        val expectedMaxResult = math.max(signedRS1, signedRS2).toLong & 0xFFFFFFFFL // Mask to retain lower 32 bits
        println(s"MAX Test: rs1 = $signedRS1, rs2 = $signedRS2, expected result = $expectedMaxResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.MAX)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expectedMaxResult.asUInt)

        // Test MAXU
        val expectedMaxUResult = math.max(RS1, RS2) 

        println(s"MAXU Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedMaxUResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.MAXU)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expectedMaxUResult.asUInt) 

        // Test MIN (Signed Minimum)
        val expectedMinResult = math.min(signedRS1, signedRS2).toLong & 0xFFFFFFFFL // Mask to retain lower 32 bits
        println(s"MIN Test: rs1 = $signedRS1, rs2 = $signedRS2, expected result = $expectedMinResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.MIN)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expectedMinResult.asUInt)

        // Test MINU
        val expectedMinUResult = math.min(RS1, RS2)

        println(s"MINU Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedMinUResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluOP.MINU)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expectedMinUResult.asUInt) 

        // Test SEXTB
        val byte = (RS1 & 0xFFL) // Extract least significant byte
        val expected_SextBResult = if ((byte & 0x80L) != 0) { // Check MSB of byte is 1
          (byte | 0xFFFFFF00L) // Sign-extend
        } else {
          byte                 // Zero-extend
        }

        println(s"SEXT_B Test: rs1 = $RS1, extracted byte = $byte, expected result = $expected_SextBResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.ALU_SEL.poke(AluOP.SEXTB)
        dut.io.EXT_SEL.poke(Extension.Zbb)

        dut.clock.step()

        dut.io.rd.expect(expected_SextBResult.asUInt)

        // Test SEXTH
        val half_word = RS1 & 0xFFFFL // Extract the least significant halfword
        val expected_SextHResult = if ((half_word & 0x8000L) != 0) { // Check MSB of byte is 1
          (half_word | 0xFFFF0000L) // Sign-extend
        } else {
          half_word                 // Zero-extend
        }
       
        println(s"SEXT.H Test: rs1 = $RS1, extracted_halfword = $half_word, expected result = $expected_SextHResult")
        
        dut.io.rs1.poke(RS1.U)
        dut.io.ALU_SEL.poke(AluOP.SEXTH)
        dut.io.EXT_SEL.poke(Extension.Zbb)
        
        dut.clock.step()
        
        dut.io.rd.expect(expected_SextHResult.asUInt)

        // Test SEXTH
         val expected_ZextHResult = half_word // Zero-extend

         println(s"ZEXTH Test: rs1 = $RS1, expected result = $expected_ZextHResult")
   
         dut.io.rs1.poke(RS1.U)
         dut.io.ALU_SEL.poke(AluOP.ZEXTH) // Select ZEXTH operation
         dut.io.EXT_SEL.poke(Extension.Zbb)
   
         dut.clock.step()
   
         dut.io.rd.expect(expected_ZextHResult.asUInt)

         // Test ROL
         val rolAmount = (RS2 & 0x1F).toInt // Extract the lower 5 bits for rotation
         val expectedROLResult = ((RS1 << rolAmount) | (RS1 >> (32 - rolAmount))) & 0xFFFFFFFFL
         println(s"ROL Test: rs1 = $RS1, rs2 = $RS2, rolAmount = $rolAmount, expected result = $expectedROLResult")
     
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.ROL) // Set ALU operation to ROL
         dut.io.EXT_SEL.poke(Extension.Zbb) // ROL is part of Zbb extension
     
         dut.clock.step()
     
         dut.io.rd.expect(expectedROLResult.asUInt)

         // Test ROR
         val rorAmount = (RS2 & 0x1F).toInt // Extract the lower 5 bits for rotation
         val expectedRORResult = ((RS1 >> rorAmount) | (RS1 << (32 - rorAmount))) & 0xFFFFFFFFL
         println(s"ROR Test: rs1 = $RS1, rs2 = $RS2, rorAmount = $rorAmount, expected result = $expectedRORResult")
     
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.ROR) // Set ALU operation to ROR
         dut.io.EXT_SEL.poke(Extension.Zbb) // ROR is part of Zbb extension
     
         dut.clock.step()
     
         dut.io.rd.expect(expectedRORResult.asUInt)

         // Test RORI
         val roriAmount = (RS2 & 0x1F).toInt // Extract the lower 5 bits for rotation
         val expectedRORIResult = if ((rorAmount & 0x10L) != 0) { // Check MSB of byte is 1
          0x00000000L // Error
        } else {
          ((RS1 >> roriAmount) | (RS1 << (32 - roriAmount))) & 0xFFFFFFFFL
        }
         println(s"RORI Test: rs1 = $RS1, rs2 = $RS2, roriAmount = $roriAmount, expected result = $expectedRORIResult")
     
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.RORI) // Set ALU operation to RORI
         dut.io.EXT_SEL.poke(Extension.Zbb) // RORI is part of Zbb extension
     
         dut.clock.step()
     
         dut.io.rd.expect(expectedRORIResult.asUInt)

         // Test ORCB

         val expectedORCBResult = (0 until 4).map 
         { i =>
         val byte = (RS1 >> (i * 8)) & 0xFFL // Extract the byte
         if (byte != 0) 0xFFL else 0x00L // Set to 0xFF or 0x00
         }.zipWithIndex.map 
         { case (byteResult, idx) =>
           byteResult << (idx * 8) // Shift each byte into its position
         }.reduce(_ | _) // Combine using bitwise OR
         
         println(s"ORCB Test: rs1 = $RS1, expected result = $expectedORCBResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.ALU_SEL.poke(AluOP.ORCB) // Select ORCB operation
         dut.io.EXT_SEL.poke(Extension.Zbb) // ORCB is part of Zbb extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedORCBResult.asUInt)

         // Test REV8
         val expectedREV8Result = (0 until 4).map { i =>
           ((RS1 >> (i * 8)) & 0xFFL) << ((3 - i) * 8) // Extract byte i and place it in reversed position
         }.reduce(_ | _) & 0xFFFFFFFFL
       
         println(s"REV8 Test: rs1 = $RS1, expected result = $expectedREV8Result")
       
         dut.io.rs1.poke(RS1.U)
         dut.io.ALU_SEL.poke(AluOP.REV8) // Select REV8
         dut.io.EXT_SEL.poke(Extension.Zbb) // REV8 is part of Zbb extension
       
         dut.clock.step()
       
         dut.io.rd.expect(expectedREV8Result.asUInt)

         // Test CLMUL
         val N = 32
         val expectedCLMULResult = {
           var result = 0x00000000L
           for (i <- 0 until N) {
             if (((RS2 >> i) & 1L) == 1) {
               result ^= (RS1 << i) & 0xFFFFFFFFL // XOR partial product and mask to retain 32 bits
             }
           }
           result
         }
         
         println(s"CLMUL Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedCLMULResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         
         dut.io.ALU_SEL.poke(AluOP.CLMUL) 
         dut.io.EXT_SEL.poke(Extension.Zbc) 
         dut.clock.step()
         
         dut.io.rd.expect(expectedCLMULResult.asUInt)

         // Test CLMULH (Carry-Less Multiply High-Part)
         val expectedCLMULHResult = {
           var result = 0L
           for (i <- 1 to N) {
             if (((RS2 >> i) & 1L) == 1) {
               // XOR partial result: RS1 shifted right by (N - i)
               // Ensure that we mask the result to 32 bits
               result ^= (RS1 >> (N - i)) & 0xFFFFFFFFL
             }
           }
           result
         }
         println(s"CLMULH Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedCLMULHResult")
         
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.CLMULH)
         dut.io.EXT_SEL.poke(Extension.Zbc)
         dut.clock.step()
         dut.io.rd.expect(expectedCLMULHResult.asUInt)

        // Test BCLR
         val indexBCLR = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index
         val expectedBCLRResult = RS1 & ~(1L << indexBCLR) & 0xFFFFFFFFL 
         println(s"BCLR Test: rs1 = $RS1, rs2 = $RS2, index = $indexBCLR, expected result = $expectedBCLRResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BCLR) // Set ALU operation to BCLR
         dut.io.EXT_SEL.poke(Extension.Zbs) // BCLR is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBCLRResult.asUInt)

         // Test BCLRI

         val isReservedBCLRI = (RS2 & 0x20L) != 0 // 0x20L = 1 << 5, checking if the 6th bit is set

         if (isReservedBCLRI) {

         val indexBCLRI = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index  
         val expectedBCLRIResult = 0x00000000L 
         println(s"BCLRI Test: rs1 = $RS1, rs2 = $RS2, index = $indexBCLRI, expected result = $expectedBCLRIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BCLRI) // Set ALU operation to BCLRI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BCLRI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBCLRIResult.asUInt)
         }

         else {

         val indexBCLRI = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index
         val expectedBCLRIResult = RS1 & ~(1L << indexBCLRI) & 0xFFFFFFFFL 
         println(s"BCLRI Test: rs1 = $RS1, rs2 = $RS2, index = $indexBCLRI, expected result = $expectedBCLRIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BCLRI) // Set ALU operation to BCLRI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BCLRI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBCLRIResult.asUInt)
         }

         // Test BEXT
         val indexBEXT = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index
         val expectedBEXTResult = ((RS1 >> indexBEXT) & 1L) & 0xFFFFFFFFL 
         println(s"BEXT Test: rs1 = $RS1, rs2 = $RS2, index = $indexBEXT, expected result = $expectedBEXTResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BEXT) // Set ALU operation to BEXT
         dut.io.EXT_SEL.poke(Extension.Zbs) // BEXT is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBEXTResult.asUInt)

         // Test BEXTI

         val isReservedBEXTI = (RS2 & 0x20L) != 0 // 0x20L = 1 << 5, checking if the 6th bit is set

         if (isReservedBEXTI) {

         val indexBEXTI = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index  
         val expectedBEXTIResult = 0x00000000L 
         println(s"BEXTI Test: rs1 = $RS1, rs2 = $RS2, index = $indexBEXTI, expected result = $expectedBEXTIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BEXTI) // Set ALU operation to BEXTI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BEXTI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBEXTIResult.asUInt)
         }

         else {

         val indexBEXTI = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index
         val expectedBEXTIResult = ((RS1 >> indexBEXTI) & 1L) & 0xFFFFFFFFL 
         println(s"BEXTI Test: rs1 = $RS1, rs2 = $RS2, index = $indexBEXTI, expected result = $expectedBEXTIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BEXTI) // Set ALU operation to BEXTI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BEXTI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBEXTIResult.asUInt)
         }
         
          // Test BSET
         val indexBSET = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index
         val expectedBSETResult = RS1 | (1L << indexBSET) & 0xFFFFFFFFL 
         println(s"BSET Test: rs1 = $RS1, rs2 = $RS2, index = $indexBSET, expected result = $expectedBSETResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BSET) // Set ALU operation to BSET
         dut.io.EXT_SEL.poke(Extension.Zbs) // BSET is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBSETResult.asUInt)

         // Test BSETI

         val isReservedBSETI = (RS2 & 0x20L) != 0 // 0x20L = 1 << 5, checking if the 6th bit is set

         if (isReservedBSETI) {

         val indexBSETI = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index  
         val expectedBSETIResult = 0x00000000L 
         println(s"BSETI Test: rs1 = $RS1, rs2 = $RS2, index = $indexBSETI, expected result = $expectedBSETIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BSETI) // Set ALU operation to BSETI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BSETI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBSETIResult.asUInt)
         }

         else {

         val indexBSETI = (RS2 & 0x1F)//.toInt // Extract the lower 5 bits for index
         val expectedBSETIResult = RS1 | (1L << indexBSETI) & 0xFFFFFFFFL  
         println(s"BSETI Test: rs1 = $RS1, rs2 = $RS2, index = $indexBSETI, expected result = $expectedBSETIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BSETI) // Set ALU operation to BSETI
         dut.io.EXT_SEL.poke(Extension.Zbs) // Assuming BSETI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBSETIResult.asUInt)
         }

      }

      // Test special cases
      specialCases.foreach { case (rs1, rs2) => runTest(rs1, rs2) }

      // Test random cases
      for (_ <- 0 until IT_Max) {
        val RS1 = Random.nextInt(max_input_value)
        val RS2 = Random.nextInt(max_input_value)
        runTest(RS1, RS2)
      }
    }
  }
}


```

#### Short summary: 

empty definition using pc, found symbol in pc: riscvALU/`<import>`.