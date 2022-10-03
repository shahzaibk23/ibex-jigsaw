package ibex_jigsaw

import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

import caravan.bus.tilelink.{TilelinkConfig, TilelinkAdapter}

import jigsaw.rams.fpga.BlockRam

class IbexJigsaw(programFile:Option[String]) extends Module{
    val io=IO(new Bundle{
        val pin = Output(Bool())
    })

    implicit val config: TilelinkConfig = TilelinkConfig()

    val instr_adapter = Module(new TilelinkAdapter)
    val data_adapter = Module(new TilelinkAdapter)

    val instr_mem = Module(BlockRam.createNonMaskableRAM(programFile, bus=config, rows=1024))
    val data_mem  = Module(BlockRam.createMaskableRAM(bus=config, rows=1024))

    instr_adapter.io.reqOut <> instr_mem.io.req
    instr_mem.io.rsp <> instr_adapter.io.rspIn

    data_adapter.io.reqOut <> data_mem.io.req
    data_mem.io.rsp <> data_adapter.io.rspIn
    

    val coreParams = IbexCoreParams()
    val ibex = Module(new BlackBoxIbexCore(coreParams))

    val clk = WireInit(clock.asUInt()(0))
    val rst = WireInit(reset.asUInt()(0))

    ibex.io.clk_i := clock
    ibex.io.rst_ni := ~rst
    ibex.io.test_en_i := true.B
    ibex.io.hart_id_i := "hF14".U


    instr_adapter.io.reqIn.valid := ibex.io.instr_req_o
    instr_adapter.io.reqIn.bits.addrRequest := ibex.io.instr_addr_o(31,2)
    instr_adapter.io.reqIn.bits.isWrite := false.B
    instr_adapter.io.reqIn.bits.activeByteLane := 0.U
    instr_adapter.io.reqIn.bits.dataRequest := 0.U
    ibex.io.instr_gnt_i := instr_adapter.io.reqIn.ready
    ibex.io.instr_rvalid_i := instr_adapter.io.rspOut.valid
    ibex.io.instr_rdata_i := instr_adapter.io.rspOut.bits.dataResponse
    // ibex.io.instr_rdata_intg_i := 0.U
    ibex.io.instr_err_i := instr_adapter.io.rspOut.bits.error
    instr_adapter.io.rspOut.ready := true.B



    data_adapter.io.reqIn.valid := ibex.io.data_req_o
    data_adapter.io.reqIn.bits.addrRequest := ibex.io.data_addr_o
    data_adapter.io.reqIn.bits.dataRequest := ibex.io.data_wdata_o
    data_adapter.io.reqIn.bits.isWrite := ibex.io.data_we_o
    data_adapter.io.reqIn.bits.activeByteLane := ibex.io.data_be_o
    ibex.io.data_gnt_i := data_adapter.io.reqIn.ready
    ibex.io.data_rvalid_i := data_adapter.io.rspOut.valid
    ibex.io.data_rdata_i := data_adapter.io.rspOut.bits.dataResponse
    // ibex.io.data_rdata_intg_i := 0.U
    ibex.io.data_err_i := data_adapter.io.rspOut.bits.error
    data_adapter.io.rspOut.ready := true.B


    ibex.io.debug_req_i := false.B
    ibex.io.irq_software_i := false.B
    ibex.io.irq_timer_i := false.B
    ibex.io.irq_external_i := false.B
    ibex.io.irq_fast_i := false.B
    ibex.io.irq_nm_i := false.B
    ibex.io.fetch_enable_i := true.B
    ibex.io.scan_rst_ni := true.B

    io.pin := ibex.io.core_sleep_o

}

object main extends App {
    val programFile = Some("instructions.hex")
    (new ChiselStage).emitSystemVerilog(new IbexJigsaw(programFile))
}