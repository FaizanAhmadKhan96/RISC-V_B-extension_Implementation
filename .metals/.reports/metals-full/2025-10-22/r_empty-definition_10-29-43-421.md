error id: file://<WORKSPACE>/src/test/ZbaExtTest.scala:`<none>`.
file://<WORKSPACE>/src/test/ZbaExtTest.scala
empty definition using pc, found symbol in pc: `<none>`.
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -AluOP.
	 -AluOP#
	 -AluOP().
	 -scala/Predef.AluOP.
	 -scala/Predef.AluOP#
	 -scala/Predef.AluOP().
offset: 1784
uri: file://<WORKSPACE>/src/test/ZbaExtTest.scala
text:
```scala
package ZbaExt

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import ZbaInstr._
import scala.util.Random
import scala.math._

class ZbaExtTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {

  val IT_Max = 10 //max number of random tests
  val max_input_value:Int = math.pow(2.toDouble, 32).toInt

   behavior of "Zba Extension"

  it should "output correct results" in {
//"DUT" should "pass" in {
test(new Zba ).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

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
        dut.io.INSTR_SEL.poke(ZbaOP.SH1ADD)

        dut.clock.step()

        dut.io.rd.expect(expected_SH1ADDresult.asUInt)

        // Test SH2ADD
        val shift2_ADD = (RS1 << 2) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_SH2ADDresult = (shift2_ADD + RS2) & 0xFFFFFFFFL
        println(s"SH2ADD Test: rs1 = $RS1, rs2 = $RS2, shift2 = $shift2_ADD, expected result = $expected_SH2ADDresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.ALU_SEL.poke(AluO@@P.SH2ADD)

        dut.clock.step()

        dut.io.rd.expect(expected_SH2ADDresult.asUInt)

        // Test SH3ADD
        val shift3_ADD = (RS1 << 3) & 0xFFFFFFFFL // Mask to retain only lower 32 bits
        val expected_SH3ADDresult = (shift3_ADD + RS2) & 0xFFFFFFFFL
        println(s"SH3ADD Test: rs1 = $RS1, rs2 = $RS2, shift3 = $shift3_ADD, expected result = $expected_SH3ADDresult")

        dut.io.rs1.poke(RS1.U)
        dut.io.rs2.poke(RS2.U)
        dut.io.INSTR_SEL.poke(ZbaOP.SH3ADD)

        dut.clock.step()

        dut.io.rd.expect(expected_SH3ADDresult.asUInt)
```


#### Short summary: 

empty definition using pc, found symbol in pc: `<none>`.