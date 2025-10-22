package ZbbExt

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import ZbbInstr._
import scala.util.Random
import scala.math._

class ZbbExtTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {

  val IT_Max = 10 //max number of random tests
  val max_input_value:Int = math.pow(2.toDouble, 32).toInt

   behavior of "Zbb Extension"

  it should "output correct results" in {
test(new Zbb ).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

  val specialCases = Seq(
        (0xFFFFFFFFL, 0xFFFFFFFFL), // RS1 = all F, RS2 = all F
        (0x00000000L, 0x00000000L), // RS1 = all 0, RS2 = all 0
        (0x00000001L, 0xFFFFFFFFL), // RS1 = all 0, RS2 = all F
        (0xFFFFFFFFL, 0x00000000L)  // RS1 = all F, RS2 = all 0
      )

      def runTest(RS1: Long, RS2: Long): Unit = {
        // Test ANDN
        val INVERT_AND = ~(RS2) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_ANDNresult = (RS1 & INVERT_AND) & 0xFFFFFFFFL
        println(s"ANDN Test: rs1 = $RS1, rs2 = $RS2, invert_rs2 = $INVERT_AND, expected result = $expected_ANDNresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.INSTR_SEL.poke(ZbbOP.ANDN)

        dut.clock.step()

        dut.io.rd.expect(expected_ANDNresult.asUInt)

        // Test ORN
        val INVERT_OR = ~(RS2) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_ORNresult = (RS1 | INVERT_OR) & 0xFFFFFFFFL
        println(s"ORN Test: rs1 = $RS1, rs2 = $RS2, invert_rs2 = $INVERT_OR, expected result = $expected_ORNresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.INSTR_SEL.poke(ZbbOP.ORN)

        dut.clock.step()

        dut.io.rd.expect(expected_ORNresult.asUInt)

        // Test XNOR
        val XOR = (RS1 ^ RS2) & 0xFFFFFFFFL
        val expected_XNORresult = ~(XOR) & 0xFFFFFFFFL
        println(s"XNOR Test: rs1 = $RS1, rs2 = $RS2, xor = $XOR, expected result = $expected_XNORresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.INSTR_SEL.poke(ZbbOP.XNOR)

        dut.clock.step()

        dut.io.rd.expect(expected_XNORresult.asUInt)

        // Test CLZ (Count Leading Zeros)
        val expected_CLZresult = RS1.toBinaryString.reverse.padTo(32, '0').reverse.indexOf('1') match {
          case -1 => 32 // If there is no '1', all bits are 0, so count is 32
          case index => index
        }
        println(s"CLZ Test: rs1 = $RS1, expected result = $expected_CLZresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.INSTR_SEL.poke(ZbbOP.CLZ)

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
        dut.io.INSTR_SEL.poke(ZbbOP.CTZ)

        dut.clock.step()

        dut.io.rd.expect(expected_CTZresult.U)

        // Test CPOP (Count Population)
        val expected_CPOPresult = RS1.toBinaryString.count(_ == '1') // Count number of '1's in RS1
        println(s"CPOP Test: rs1 = $RS1, expected result = $expected_CPOPresult")

      
        dut.io.rs1.poke(RS1.U)
        dut.io.INSTR_SEL.poke(ZbbOP.CPOP)
      
        dut.clock.step()
      
        dut.io.rd.expect(expected_CPOPresult.U)

        // Test MAX (Signed Maximum)
        val signedRS1 = RS1.toInt // Convert RS1 to signed 32-bit integer
        val signedRS2 = RS2.toInt // Convert RS2 to signed 32-bit integer
        val expectedMaxResult = math.max(signedRS1, signedRS2).toLong & 0xFFFFFFFFL // Mask to retain lower 32 bits
        println(s"MAX Test: rs1 = $signedRS1, rs2 = $signedRS2, expected result = $expectedMaxResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.INSTR_SEL.poke(ZbbOP.MAX)

        dut.clock.step()

        dut.io.rd.expect(expectedMaxResult.asUInt)

        // Test MAXU
        val expectedMaxUResult = math.max(RS1, RS2) 

        println(s"MAXU Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedMaxUResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.INSTR_SEL.poke(ZbbOP.MAXU)

        dut.clock.step()

        dut.io.rd.expect(expectedMaxUResult.asUInt) 

        // Test MIN (Signed Minimum)
        val expectedMinResult = math.min(signedRS1, signedRS2).toLong & 0xFFFFFFFFL // Mask to retain lower 32 bits
        println(s"MIN Test: rs1 = $signedRS1, rs2 = $signedRS2, expected result = $expectedMinResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.INSTR_SEL.poke(ZbbOP.MIN)

        dut.clock.step()

        dut.io.rd.expect(expectedMinResult.asUInt)

        // Test MINU
        val expectedMinUResult = math.min(RS1, RS2)

        println(s"MINU Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedMinUResult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.INSTR_SEL.poke(ZbbOP.MINU)

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
        dut.io.INSTR_SEL.poke(ZbbOP.SEXTB)

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
        dut.io.INSTR_SEL.poke(ZbbOP.SEXTH)
        
        dut.clock.step()
        
        dut.io.rd.expect(expected_SextHResult.asUInt)

        // Test ZEXTH
         val expected_ZextHResult = half_word // Zero-extend

         println(s"ZEXTH Test: rs1 = $RS1, expected result = $expected_ZextHResult")
   
         dut.io.rs1.poke(RS1.U)
         dut.io.INSTR_SEL.poke(ZbbOP.ZEXTH) // Select ZEXTH operation
   
         dut.clock.step()
   
         dut.io.rd.expect(expected_ZextHResult.asUInt)

         // Test ROL
         val shamtrol = (RS2 & 0x1F)     // Extract the lower 5 bits for rotation
         val expectedROLResult = ((RS1 << shamtrol) | (RS1 >> (32 - shamtrol))) & 0xFFFFFFFFL
         println(s"ROL Test: rs1 = $RS1, rs2 = $RS2, shamt = $shamtrol, expected result = $expectedROLResult")
     
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbbOP.ROL) // Set ALU operation to ROL
     
         dut.clock.step()
     
         dut.io.rd.expect(expectedROLResult.asUInt)

         // Test ROR
         val shamtror = (RS2 & 0x1F)    // Extract the lower 5 bits for rotation
         val expectedRORResult = ((RS1 >> shamtror) | (RS1 << (32 - shamtror))) & 0xFFFFFFFFL
         println(s"ROR Test: rs1 = $RS1, rs2 = $RS2, shamt = $shamtror, expected result = $expectedRORResult")
     
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbbOP.ROR) // Set ALU operation to ROR
     
         dut.clock.step()
     
         dut.io.rd.expect(expectedRORResult.asUInt)

         // Test RORI
         val shamtrori = (RS2 & 0x1F)     // Extract the lower 5 bits for rotation
         val realShamt = if (((shamtrori >> 4) & 1L) != 0L) { shamtrori & 0xFL } else { shamtrori }
         val expectedRORIResult = ((RS1 >> realShamt.toInt) | (RS1 << (32 - realShamt.toInt))) & 0xFFFFFFFFL

         println(s"RORI Test: rs1 = $RS1, rs2 = $RS2, shamt = $realShamt, expected result = $expectedRORIResult")
     
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbbOP.RORI) // Set ALU operation to RORI
     
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
         dut.io.INSTR_SEL.poke(ZbbOP.ORCB) // Select ORCB operation
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedORCBResult.asUInt)

         // Test REV8
         val expectedREV8Result = (0 until 4).map { i =>
           ((RS1 >> (i * 8)) & 0xFFL) << ((3 - i) * 8) // Extract byte i and place it in reversed position
         }.reduce(_ | _) & 0xFFFFFFFFL
       
         println(s"REV8 Test: rs1 = $RS1, expected result = $expectedREV8Result")
       
         dut.io.rs1.poke(RS1.U)
         dut.io.INSTR_SEL.poke(ZbbOP.REV8) // Select REV8
       
         dut.clock.step()
       
         dut.io.rd.expect(expectedREV8Result.asUInt)
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