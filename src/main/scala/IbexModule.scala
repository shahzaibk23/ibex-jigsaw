package ibex_jigsaw

import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

class IbexModule extends Module{
  val io = IO(new IbexBundle)
    val coreParams = IbexCoreParams()
    val core = Module(new BlackBoxIbexCore(coreParams))
    core.io <> io
}



object main extends App {
  
    (new ChiselStage).emitSystemVerilog(new IbexModule())

}