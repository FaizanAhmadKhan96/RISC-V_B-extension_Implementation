package riscvALU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import ALUType._
import scala.util.Random
import scala.math._

class RISCVALUTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {

  val IT_Max = 1000 //max number of random tests
  val max_input_value:Long = math.pow(2.toDouble,64).toLong

   behavior of "RiscV ALU"

  it should "output correct results" in {
//"DUT" should "pass" in {
test(new PExtALU ).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

    for (i <- 0 until IT_Max) {
  val a = Random.nextLong(max_input_value)
  val b = Random.nextLong(max_input_value)

  // Test ADD_UW
  val index = a & 0xFFFFFFFFL
  val expected_ADDUWresult = (index + b) % max_input_value
  println(s"ADD_UW Test: a = $a, b = $b, index = $index, expected result = $expected_ADDUWresult")

  dut.io.operand_A.poke(a.U)
  dut.io.operand_B.poke(b.U)
  dut.io.ALU_SEL.poke(AluOP.ADD_UW)

  dut.clock.step()

  dut.io.result.expect(expected_ADDUWresult.asUInt)

  // Test SH1ADD
  //val shiftl = (a << 1) & 0xFFFFFFFFFFFFFFFFL  // Mask to retain only lower 64 bits
  //val expected_SH1ADDresult = (shiftl + b) % max_input_value
  //println(s"SH1ADD Test: a = $a, b = $b, shiftl = $shiftl, expected result = $expected_SH1ADDresult")
//
  //dut.io.operand_A.poke(a.U)
  //dut.io.operand_B.poke(b.U)
  //dut.io.ALU_SEL.poke(AluOP.SH1ADD)
//
  //dut.clock.step()
//
  //dut.io.result.expect(expected_SH1ADDresult.asUInt)
}
}
}
}