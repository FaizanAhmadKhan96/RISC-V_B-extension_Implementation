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
         val shamtrol = (RS2 & 0x1F)     // Extract the lower 5 bits for rotation
         val expectedROLResult = ((RS1 << shamtrol) | (RS1 >> (32 - shamtrol))) & 0xFFFFFFFFL
         println(s"ROL Test: rs1 = $RS1, rs2 = $RS2, shamt = $shamtrol, expected result = $expectedROLResult")
     
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.ROL) // Set ALU operation to ROL
         dut.io.EXT_SEL.poke(Extension.Zbb) // ROL is part of Zbb extension
     
         dut.clock.step()
     
         dut.io.rd.expect(expectedROLResult.asUInt)

         // Test ROR
         val shamtror = (RS2 & 0x1F)    // Extract the lower 5 bits for rotation
         val expectedRORResult = ((RS1 >> shamtror) | (RS1 << (32 - shamtror))) & 0xFFFFFFFFL
         println(s"ROR Test: rs1 = $RS1, rs2 = $RS2, shamt = $shamtror, expected result = $expectedRORResult")
     
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.ROR) // Set ALU operation to ROR
         dut.io.EXT_SEL.poke(Extension.Zbb) // ROR is part of Zbb extension
     
         dut.clock.step()
     
         dut.io.rd.expect(expectedRORResult.asUInt)

         // Test RORI
         val shamtrori = (RS2 & 0x1F)     // Extract the lower 5 bits for rotation
         val realShamt = if (((shamtrori >> 4) & 1L) != 0L) { shamtrori & 0xFL } else { shamtrori }
         val expectedRORIResult = ((RS1 >> realShamt.toInt) | (RS1 << (32 - realShamt.toInt))) & 0xFFFFFFFFL

         println(s"RORI Test: rs1 = $RS1, rs2 = $RS2, shamt = $realShamt, expected result = $expectedRORIResult")
     
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
        
         // Test CLMULR (Carry-Less Multiply Reversed)
         val expectedCLMULRResult = {
           
           var result = 0L
           // For each bit position i in RS2 from 0 to 31:
           for (i <- 0 until 32) {
             // If RS2[i] is set then XOR with RS1 shifted right by (32 - i - 1)
             if (((RS2 >> i) & 1L) == 1L) {
               result ^= (RS1 >> (32 - i - 1)) & 0xFFFFFFFFL
             }
           }
           result
         }
         println(s"CLMULR Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedCLMULRResult")
        
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.CLMULR)
         dut.io.EXT_SEL.poke(Extension.Zbc)
         dut.clock.step()
         dut.io.rd.expect(expectedCLMULRResult.U)

        // Test BCLR
         val indexBCLR = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val expectedBCLRResult = RS1 & ~(1L << indexBCLR) & 0xFFFFFFFFL 
         println(s"BCLR Test: rs1 = $RS1, rs2 = $RS2, index = $indexBCLR, expected result = $expectedBCLRResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BCLR) // Set ALU operation to BCLR
         dut.io.EXT_SEL.poke(Extension.Zbs) // BCLR is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBCLRResult.asUInt)

         // Test BCLRI

         val indexBCLRI = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val realindexBCLRI = if (((indexBCLRI >> 4) & 1L) != 0L) { indexBCLRI & 0xFL } else { indexBCLRI }
         val expectedBCLRIResult = RS1 & ~(1L << realindexBCLRI ) & 0xFFFFFFFFL 
         println(s"BCLRI Test: rs1 = $RS1, rs2 = $RS2, index = $realindexBCLRI, expected result = $expectedBCLRIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BCLRI) // Set ALU operation to BCLRI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BCLRI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBCLRIResult.asUInt)

         // Test BEXT
         val indexBEXT = (RS2 & 0x1F)   // Extract the lower 5 bits for index
         val expectedBEXTResult = ((RS1 >> indexBEXT) & 1L) & 0xFFFFFFFFL 
         println(s"BEXT Test: rs1 = $RS1, rs2 = $RS2, index = $indexBEXT, expected result = $expectedBEXTResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BEXT) // Set ALU operation to BEXT
         dut.io.EXT_SEL.poke(Extension.Zbs) // BEXT is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBEXTResult.asUInt)

         // Test BEXTI

         val indexBEXTI = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val realindexBEXTI = if (((indexBEXTI >> 4) & 1L) != 0L) { indexBEXTI & 0xFL } else { indexBEXTI }
         val expectedBEXTIResult = ((RS1 >> realindexBEXTI) & 1L) & 0xFFFFFFFFL 
         println(s"BEXTI Test: rs1 = $RS1, rs2 = $RS2, index = $realindexBEXTI, expected result = $expectedBEXTIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BEXTI) // Set ALU operation to BEXTI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BEXTI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBEXTIResult.asUInt)
         
         // Test BINV
         val indexBINV = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val expectedBINVResult = RS1 ^ (1L << indexBINV) & 0xFFFFFFFFL 
         println(s"BINV Test: rs1 = $RS1, rs2 = $RS2, index = $indexBINV, expected result = $expectedBINVResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BINV) // Set ALU operation to BINV
         dut.io.EXT_SEL.poke(Extension.Zbs) // BINV is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBINVResult.asUInt)

         // Test BINVI

         val indexBINVI = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val realindexBINVI = if (((indexBINVI >> 4) & 1L) != 0L) { indexBINVI & 0xFL } else { indexBINVI }
         val expectedBINVIResult = RS1 ^ (1L << realindexBINVI) & 0xFFFFFFFFL  
         println(s"BINVI Test: rs1 = $RS1, rs2 = $RS2, index = $realindexBINVI, expected result = $expectedBINVIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BINVI) // Set ALU operation to BINVI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BINVI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBINVIResult.asUInt)

          // Test BSET
         val indexBSET = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val expectedBSETResult = RS1 | (1L << indexBSET) & 0xFFFFFFFFL 
         println(s"BSET Test: rs1 = $RS1, rs2 = $RS2, index = $indexBSET, expected result = $expectedBSETResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BSET) // Set ALU operation to BSET
         dut.io.EXT_SEL.poke(Extension.Zbs) // BSET is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBSETResult.asUInt)

         // Test BSETI

         val indexBSETI = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val realindexBSETI = if (((indexBSETI >> 4) & 1L) != 0L) { indexBSETI & 0xFL } else { indexBSETI }
         val expectedBSETIResult = RS1 | (1L << realindexBSETI) & 0xFFFFFFFFL  
         println(s"BSETI Test: rs1 = $RS1, rs2 = $RS2, index = $realindexBSETI, expected result = $expectedBSETIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.ALU_SEL.poke(AluOP.BSETI) // Set ALU operation to BSETI
         dut.io.EXT_SEL.poke(Extension.Zbs) // BSETI is part of Zbs extension
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBSETIResult.asUInt)

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

