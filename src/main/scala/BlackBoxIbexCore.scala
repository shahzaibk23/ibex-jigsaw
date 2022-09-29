package ibex_jigsaw

import chisel3._
import chisel3.util._
import chisel3.experimental._

import scala.collection.mutable.{ListBuffer}
import sys.process._


class BlackBoxIbexCore(
    config: IbexCoreParams
) extends BlackBox(
    Map(
        "PMP_ENABLE" -> IntParam(config.pmpEnable),
        "PMP_GRANULARITY" -> IntParam(config.pmpGranularity),
        "PMP_NUM_REGIONS" -> IntParam(config.pmpNumRegions),
        "MHPM_COUNTER_NUM" -> IntParam(config.mhpmCounterNum),
        "MHPM_COUNTER_WIDTH" -> IntParam(config.mhpmCounterWidth),
        "RV32E" -> IntParam(config.rv32e),
        "RV32M" -> RawParam(config.rv32m),
        "RV32B" -> RawParam(config.rv32b),
        "REGFILE" -> RawParam(config.regFile),
        "BRANCH_TARGET_ALU" -> IntParam(config.branchTargetALU),
        "WB_STAGE" -> IntParam(config.wbStage),
        "BRANCH_PREDICTOR" -> IntParam(config.branchPredictor),
        "DBG_HW_BREAK_NUM" -> IntParam(config.dbgHwBreakNum),
        "DM_HALT_ADDR" -> IntParam(config.dmHaltAddr),
        "DM_EXCEPTION_ADDR" -> IntParam(config.dmExceptionAddr)
    )
) with HasBlackBoxPath {

    val io = IO(new IbexBundle)

    val rootDir     = System.getProperty("user.dir")
    val ibexSrcDir = s"$rootDir/src/main/resources/ibex_module"

    val proc = s"make -C $ibexSrcDir default"
    require (proc.! == 0, "Failed to run preprocessing step")

    // generated from preprocessing step
    addPath(s"$ibexSrcDir/blackBoxIbexCore.preprocessed.sv")
}


