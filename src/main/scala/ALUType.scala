import chisel3._
import chisel3.experimental.ChiselEnum

package ALUType {

  object AluOP extends ChiselEnum {
//    type AluOP = Value
    val SH1ADD, SH2ADD, SH3ADD, ANDN, ORN, XOR, CLZ, CTZ, CPOP, MAX, MAXU, MIN, MINU, SEXTB, SEXTH, ZEXTH, ROL, ROR, RORI, ORCB, REV8, CLMUL, CLMULH, CLMULR, BCLR , BCLRI, BEXT, BEXTI, BINV, BINVI, BSET, BSETI = Value
  }

}

//class Clmul(N: Int) extends Module {
//  val io = IO(new Bundle {
//    val A_in = Input(UInt(N.W))  // Input operand A
//    val B_in = Input(UInt(N.W))  // Input operand B
//    val C_out = Output(UInt(N.W)) // Output result
//  })
//
//  // Register to hold the intermediate result
//  //val tempResult = RegInit(0.U(N.W)) // Initialize to 0
//
//  // Iterate over each bit of B_in (rs2) and compute the carry-less multiplication
//  for (i <- 0 until N) {
//    val bitSet = (io.B_in >> i.U) & 1.U // Check if bit i of B_in is set
//    val partialProduct = Mux(bitSet === 1.U, io.A_in << i.U, 0.U) // Compute the partial product
//    val result = tempResult ^ partialProduct // XOR the partial product with the current result
//  }
//
//  // Register the final result
//  val tempResult = RegNext(result, 0.U) // Delay the final result by one clock cycle
//  //val result = RegNext(delay) // Delay the final result by one clock cycle
//  io.C_out := result // Output the result
//}