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

  val IT_Max = 1000 //max number of random tests
  val max_input_value:Int = math.pow(2.toDouble, 32).toInt

   behavior of "RiscV ALU"

  it should "output correct results" in {
//"DUT" should "pass" in {
test(new PExtALU ).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

    for (i <- 0 until IT_Max) {
  val RS1 = Random.nextInt(max_input_value)
  val RS2 = Random.nextInt(max_input_value)

  // Test SH1ADD
  val shiftl_ADD = (RS1 << 1) & 0xFFFFFFFFL  // Mask to retain only lower 32 bits
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
  val shift3_ADD = (RS1 << 3) & 0xFFFFFFFFL  // Mask to retain only lower 32 bits
  val expected_SH3ADDresult = (shift3_ADD + RS2) & 0xFFFFFFFFL
  println(s"SH3ADD Test: rs1 = $RS1, rs2 = $RS2, shift3 = $shift3_ADD, expected result = $expected_SH3ADDresult")

  dut.io.rs1.poke(RS1.U)
  dut.io.rs2.poke(RS2.U)
  dut.io.ALU_SEL.poke(AluOP.SH3ADD)
  dut.io.EXT_SEL.poke(Extension.Zba)

  dut.clock.step()

  dut.io.rd.expect(expected_SH3ADDresult.asUInt)

  // Test ANDN
  val INVERT_AND = ~(RS2) & 0xFFFFFFFFL  // Mask to retain only lower 32 bits
  val expected_ANDNresult = (RS1 & INVERT_AND) & 0xFFFFFFFFL
  println(s"ANDN Test: rs1 = $RS1, rs2 = $RS2, invert_rs2 = $INVERT_AND, expected result = $expected_ANDNresult")

  dut.io.rs1.poke(RS1.U)
  dut.io.rs2.poke(RS2.U)
  dut.io.ALU_SEL.poke(AluOP.ANDN)
  dut.io.EXT_SEL.poke(Extension.Zbb)

  dut.clock.step()

  dut.io.rd.expect(expected_ANDNresult.asUInt)

  // Test ORN
  val INVERT_OR = ~(RS2) & 0xFFFFFFFFL  // Mask to retain only lower 32 bits
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
  dut.io.ALU_SEL.poke(AluOP.ORN)
  dut.io.EXT_SEL.poke(Extension.Zbb)

  dut.clock.step()

  dut.io.rd.expect(expected_ORNresult.asUInt)
}
}
}
}