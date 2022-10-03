package ibex_jigsaw

import chisel3._
import chisel3.util._
import chisel3.experimental._

class IbexBundle extends Bundle{

    val clk_i                           = Input(Clock())
    val rst_ni                          = Input(Bool())
    val test_en_i                       = Input(Bool())
    // val ram_cfg_i_ram_cfg_en            = Input(Bool())
    // val ram_cfg_i_ram_cfg               = Input(UInt(4.W))
    // val ram_cfg_i_rf_cfg_en             = Input(Bool())
    // val ram_cfg_i_rf_cfg                = Input(UInt(4.W))
    val hart_id_i                       = Input(UInt(32.W))
    // val boot_addr_i                     = Input(UInt(32.W))
    val instr_req_o                     = Output(Bool())
    val instr_gnt_i                     = Input(Bool())
    val instr_rvalid_i                  = Input(Bool())
    val instr_addr_o                    = Output(UInt(32.W))
    val instr_rdata_i                   = Input(UInt(32.W))
    // val instr_rdata_intg_i              = Input(UInt(7.W))
    val instr_err_i                     = Input(Bool())
    val data_req_o                      = Output(Bool())
    val data_gnt_i                      = Input(Bool())
    val data_rvalid_i                   = Input(Bool())
    val data_we_o                       = Output(Bool())
    val data_be_o                       = Output(UInt(4.W))
    val data_addr_o                     = Output(UInt(32.W))
    val data_wdata_o                    = Output(UInt(32.W))
    // val data_wdata_intg_o               = Output(UInt(7.W))
    val data_rdata_i                    = Input(UInt(32.W))
    // val data_rdata_intg_i               = Input(UInt(7.W))
    val data_err_i                      = Input(Bool())
    val irq_software_i                  = Input(Bool())
    val irq_timer_i                     = Input(Bool())
    val irq_external_i                  = Input(Bool())
    val irq_fast_i                      = Input(UInt(15.W))
    val irq_nm_i                        = Input(Bool())
    val debug_req_i                     = Input(Bool())
    // val crash_dump_o                    = Output(Bool())
    // val crash_dump_o_current_pc         = Output(UInt(32.W))
    // val crash_dump_o_next_pc            = Output(UInt(32.W))
    // val crash_dump_o_last_data_addr     = Output(UInt(32.W))
    // val crash_dump_o_exception_addr     = Output(UInt(32.W))
    val fetch_enable_i                  = Input(Bool())
    val alert_minor_o                   = Output(Bool())
    val alert_major_o                   = Output(Bool())
    val core_sleep_o                    = Output(Bool())
    val scan_rst_ni                     = Input(Bool())

}
