package ZbsExt

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import ZbsInstr._
import scala.util.Random
import scala.math._

class ZbsExtTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {

  val IT_Max = 10 //max number of random tests
  val max_input_value:Int = math.pow(2.toDouble, 32).toInt

   behavior of "Zbs Extension"

  it should "output correct results" in {
test(new Zbs ).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

  val specialCases = Seq(
        (0xFFFFFFFFL, 0xFFFFFFFFL), // RS1 = all F, RS2 = all F
        (0x00000000L, 0x00000000L), // RS1 = all 0, RS2 = all 0
        (0x00000001L, 0xFFFFFFFFL), // RS1 = all 0, RS2 = all F
        (0xFFFFFFFFL, 0x00000000L)  // RS1 = all F, RS2 = all 0
      )

      def runTest(RS1: Long, RS2: Long): Unit = {
        // Test BCLR
         val indexBCLR = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val expectedBCLRResult = RS1 & ~(1L << indexBCLR) & 0xFFFFFFFFL 
         println(s"BCLR Test: rs1 = $RS1, rs2 = $RS2, index = $indexBCLR, expected result = $expectedBCLRResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbsOP.BCLR) // Set ALU operation to BCLR
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBCLRResult.asUInt)

         // Test BCLRI

         val indexBCLRI = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val realindexBCLRI = if (((indexBCLRI >> 4) & 1L) != 0L) { indexBCLRI & 0xFL } else { indexBCLRI }
         val expectedBCLRIResult = RS1 & ~(1L << realindexBCLRI ) & 0xFFFFFFFFL 
         println(s"BCLRI Test: rs1 = $RS1, rs2 = $RS2, index = $realindexBCLRI, expected result = $expectedBCLRIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbsOP.BCLRI) // Set ALU operation to BCLRI
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBCLRIResult.asUInt)

         // Test BEXT
         val indexBEXT = (RS2 & 0x1F)   // Extract the lower 5 bits for index
         val expectedBEXTResult = ((RS1 >> indexBEXT) & 1L) & 0xFFFFFFFFL 
         println(s"BEXT Test: rs1 = $RS1, rs2 = $RS2, index = $indexBEXT, expected result = $expectedBEXTResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbsOP.BEXT) // Set ALU operation to BEXT
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBEXTResult.asUInt)

         // Test BEXTI

         val indexBEXTI = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val realindexBEXTI = if (((indexBEXTI >> 4) & 1L) != 0L) { indexBEXTI & 0xFL } else { indexBEXTI }
         val expectedBEXTIResult = ((RS1 >> realindexBEXTI) & 1L) & 0xFFFFFFFFL 
         println(s"BEXTI Test: rs1 = $RS1, rs2 = $RS2, index = $realindexBEXTI, expected result = $expectedBEXTIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbsOP.BEXTI) // Set ALU operation to BEXTI
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBEXTIResult.asUInt)
         
         // Test BINV
         val indexBINV = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val expectedBINVResult = RS1 ^ (1L << indexBINV) & 0xFFFFFFFFL 
         println(s"BINV Test: rs1 = $RS1, rs2 = $RS2, index = $indexBINV, expected result = $expectedBINVResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbsOP.BINV) // Set ALU operation to BINV
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBINVResult.asUInt)

         // Test BINVI

         val indexBINVI = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val realindexBINVI = if (((indexBINVI >> 4) & 1L) != 0L) { indexBINVI & 0xFL } else { indexBINVI }
         val expectedBINVIResult = RS1 ^ (1L << realindexBINVI) & 0xFFFFFFFFL  
         println(s"BINVI Test: rs1 = $RS1, rs2 = $RS2, index = $realindexBINVI, expected result = $expectedBINVIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbsOP.BINVI) // Set ALU operation to BINVI
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBINVIResult.asUInt)

          // Test BSET
         val indexBSET = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val expectedBSETResult = RS1 | (1L << indexBSET) & 0xFFFFFFFFL 
         println(s"BSET Test: rs1 = $RS1, rs2 = $RS2, index = $indexBSET, expected result = $expectedBSETResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbsOP.BSET) // Set ALU operation to BSET
         
         dut.clock.step()
         
         dut.io.rd.expect(expectedBSETResult.asUInt)

         // Test BSETI

         val indexBSETI = (RS2 & 0x1F)    // Extract the lower 5 bits for index
         val realindexBSETI = if (((indexBSETI >> 4) & 1L) != 0L) { indexBSETI & 0xFL } else { indexBSETI }
         val expectedBSETIResult = RS1 | (1L << realindexBSETI) & 0xFFFFFFFFL  
         println(s"BSETI Test: rs1 = $RS1, rs2 = $RS2, index = $realindexBSETI, expected result = $expectedBSETIResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbsOP.BSETI) // Set ALU operation to BSETI
         
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