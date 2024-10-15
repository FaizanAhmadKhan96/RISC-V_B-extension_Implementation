package riscvALU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import ALUType._
import scala.util.Random
import scala.math._

class RISCVALUTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {

  val IT_Max = 10 //max number of random tests
  val max_input_value:BigInt = BigInt(2).pow(64)

   behavior of "RiscV ALU"

  it should "output correct results" in {
//"DUT" should "pass" in {
test(new PExtALU ).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

    for (i <- 0 until IT_Max) {
  val a = BigInt(64, Random)
  val b = BigInt(64, Random)

  // Test ADD_UW
  val index_ADDUW = a & BigInt("FFFFFFFF", 16)
  val expected_ADDUWresult = (index_ADDUW  + b) % max_input_value
  println(s"ADD_UW Test: a = $a, b = $b, index = $index_ADDUW, expected result = $expected_ADDUWresult")

  dut.io.operand_A.poke(a.U)
  dut.io.operand_B.poke(b.U)
  dut.io.ALU_SEL.poke(AluOP.ADD_UW)

  dut.clock.step()

  dut.io.result.expect(expected_ADDUWresult.asUInt)

  // Test SH1ADD
  val shiftl_ADD = (a << 1) & BigInt("FFFFFFFFFFFFFFFF", 16)  // Mask to retain only lower 64 bits
  val expected_SH1ADDresult = (shiftl_ADD + b) % max_input_value
  println(s"SH1ADD Test: a = $a, b = $b, shiftl = $shiftl_ADD, expected result = $expected_SH1ADDresult")

  dut.io.operand_A.poke(a.U)
  dut.io.operand_B.poke(b.U)
  dut.io.ALU_SEL.poke(AluOP.SH1ADD)

  dut.clock.step()

  dut.io.result.expect(expected_SH1ADDresult.asUInt)

  // Test SH1ADD_UW
  val index_SH1ADDUW  = a & BigInt("FFFFFFFF", 16)
  val shiftl_ADDUW = (index_SH1ADDUW  << 1) & BigInt("FFFFFFFFFFFFFFFF", 16)  // Mask to retain only lower 64 bits
  val expected_SH1ADDUWresult = (shiftl_ADDUW + b) % max_input_value
  println(s"SH1ADD_UW Test: a = $a, b = $b, index = $index_SH1ADDUW, shiftl = $shiftl_ADDUW, expected result = $expected_SH1ADDresult")

  dut.io.operand_A.poke(a.U)
  dut.io.operand_B.poke(b.U)
  dut.io.ALU_SEL.poke(AluOP.SH1ADD_UW)

  dut.clock.step()

  dut.io.result.expect(expected_SH1ADDUWresult.asUInt)

  // Test SH2ADD
  val shift2_ADD = (a << 2) & BigInt("FFFFFFFFFFFFFFFF", 16)  // Mask to retain only lower 64 bits
  val expected_SH2ADDresult = (shift2_ADD + b) % max_input_value
  println(s"SH2ADD Test: a = $a, b = $b, shift2 = $shift2_ADD, expected result = $expected_SH2ADDresult")

  dut.io.operand_A.poke(a.U)
  dut.io.operand_B.poke(b.U)
  dut.io.ALU_SEL.poke(AluOP.SH2ADD)

  dut.clock.step()

  dut.io.result.expect(expected_SH2ADDresult.asUInt)

  // Test SH2ADD_UW
  val index_SH2ADDUW  = a & BigInt("FFFFFFFF", 16)
  val shift2_ADDUW = (index_SH2ADDUW  << 2) & BigInt("FFFFFFFFFFFFFFFF", 16)  // Mask to retain only lower 64 bits
  val expected_SH2ADDUWresult = (shift2_ADDUW + b) % max_input_value
  println(s"SH2ADD_UW Test: a = $a, b = $b, index = $index_SH2ADDUW, shift2 = $shift2_ADDUW, expected result = $expected_SH2ADDresult")

  dut.io.operand_A.poke(a.U)
  dut.io.operand_B.poke(b.U)
  dut.io.ALU_SEL.poke(AluOP.SH2ADD_UW)

  dut.clock.step()

  dut.io.result.expect(expected_SH2ADDUWresult.asUInt)

  // Test SH3ADD
  val shift3_ADD = (a << 3) & BigInt("FFFFFFFFFFFFFFFF", 16)  // Mask to retain only lower 64 bits
  val expected_SH3ADDresult = (shift3_ADD + b) % max_input_value
  println(s"SH3ADD Test: a = $a, b = $b, shift3 = $shift3_ADD, expected result = $expected_SH3ADDresult")

  dut.io.operand_A.poke(a.U)
  dut.io.operand_B.poke(b.U)
  dut.io.ALU_SEL.poke(AluOP.SH3ADD)

  dut.clock.step()

  dut.io.result.expect(expected_SH3ADDresult.asUInt)

  // Test SH2ADD_UW
  val index_SH3ADDUW  = a & BigInt("FFFFFFFF", 16)
  val shift3_ADDUW = (index_SH3ADDUW  << 3) & BigInt("FFFFFFFFFFFFFFFF", 16)  // Mask to retain only lower 64 bits
  val expected_SH3ADDUWresult = (shift3_ADDUW + b) % max_input_value
  println(s"SH3ADD_UW Test: a = $a, b = $b, index = $index_SH3ADDUW, shift3 = $shift3_ADDUW, expected result = $expected_SH3ADDresult")

  dut.io.operand_A.poke(a.U)
  dut.io.operand_B.poke(b.U)
  dut.io.ALU_SEL.poke(AluOP.SH3ADD_UW)

  dut.clock.step()

  dut.io.result.expect(expected_SH3ADDUWresult.asUInt)
}
}
}
}