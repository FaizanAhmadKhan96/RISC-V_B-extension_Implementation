package ZbcExt

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import ZbcInstr._
import scala.util.Random
import scala.math._

class ZbcExtTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {

  val IT_Max = 10 //max number of random tests
  val max_input_value:Int = math.pow(2.toDouble, 32).toInt

   behavior of "Zbc Extension"

  it should "output correct results" in {
test(new Zbc ).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

  val specialCases = Seq(
        (0xFFFFFFFFL, 0xFFFFFFFFL), // RS1 = all F, RS2 = all F
        (0x00000000L, 0x00000000L), // RS1 = all 0, RS2 = all 0
        (0x00000001L, 0xFFFFFFFFL), // RS1 = all 0, RS2 = all F
        (0xFFFFFFFFL, 0x00000000L)  // RS1 = all F, RS2 = all 0
      )

      def runTest(RS1: Long, RS2: Long): Unit = {
         // Test CLMUL
         val N = 32
         val expectedCLMULResult = {
           var result = 0x00000000L
           for (i <- 0 until (N-1)) {
             if (((RS2 >> i) & 1L) == 1) {
               result ^= (RS1 << i) & 0xFFFFFFFFL // XOR partial product and mask to retain 32 bits
             }
           }
           result
         }
         
         println(s"CLMUL Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedCLMULResult")
         
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         
         dut.io.INSTR_SEL.poke(ZbcOP.CLMUL) 
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
         dut.io.INSTR_SEL.poke(ZbcOP.CLMULH)
         dut.clock.step()
         dut.io.rd.expect(expectedCLMULHResult.asUInt)
        
         // Test CLMULR (Carry-Less Multiply Reversed)
         val expectedCLMULRResult = {
           
           var result = 0L
           // For each bit position i in RS2 from 0 to 31:
           for (i <- 0 until (N-1)) {
             // If RS2[i] is set then XOR with RS1 shifted right by (32 - i - 1)
             if (((RS2 >> i) & 1L) == 1L) {
               result ^= (RS1 >> (N - i - 1)) & 0xFFFFFFFFL
             }
           }
           result
         }
         println(s"CLMULR Test: rs1 = $RS1, rs2 = $RS2, expected result = $expectedCLMULRResult")
        
         dut.io.rs1.poke(RS1.U)
         dut.io.rs2.poke(RS2.U)
         dut.io.INSTR_SEL.poke(ZbcOP.CLMULR)
         dut.clock.step()
         dut.io.rd.expect(expectedCLMULRResult.U)
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