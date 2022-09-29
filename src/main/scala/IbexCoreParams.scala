package ibex_jigsaw

import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

case class IbexCoreParams(
  val bootFreqHz: BigInt = BigInt(1700000000),
  val pmpEnable: Int = 0,
  val pmpGranularity: Int = 0,
  val pmpNumRegions: Int = 4,
  val mhpmCounterNum: Int = 0,
  val mhpmCounterWidth: Int = 0,
  val rv32e: Int = 0,
  val rv32m: String = "ibex_pkg::RV32MFast",
  val rv32b: String = "ibex_pkg::RV32BNone",
  val regFile: String = "ibex_pkg::RegFileFF",
  val branchTargetALU: Int = 0,
  val wbStage: Int = 0,
  val branchPredictor: Int = 0,
  val dbgHwBreakNum: Int = 1,
  val dmHaltAddr: Int = 0x1A110800,
  val dmExceptionAddr: Int = 0x1A110808
)
