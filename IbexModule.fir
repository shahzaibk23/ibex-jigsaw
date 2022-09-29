circuit IbexModule :
  extmodule BlackBoxIbexCore :
    input clk_i : Clock
    input rst_ni : UInt<1>
    input test_en_i : UInt<1>
    input ram_cfg_i_ram_cfg_en : UInt<1>
    input ram_cfg_i_ram_cfg : UInt<4>
    input ram_cfg_i_rf_cfg_en : UInt<1>
    input ram_cfg_i_rf_cfg : UInt<4>
    input hart_id_i : UInt<32>
    input boot_addr_i : UInt<32>
    output instr_req_o : UInt<1>
    input instr_gnt_i : UInt<1>
    input instr_rvalid_i : UInt<1>
    output instr_addr_o : UInt<32>
    input instr_rdata_i : UInt<32>
    input instr_err_i : UInt<1>
    output data_req_o : UInt<1>
    input data_gnt_i : UInt<1>
    input data_rvalid_i : UInt<1>
    output data_we_o : UInt<1>
    output data_be_o : UInt<4>
    output data_addr_o : UInt<32>
    output data_wdata_o : UInt<32>
    input data_rdata_i : UInt<32>
    input data_err_i : UInt<1>
    input irq_software_i : UInt<1>
    input irq_timer_i : UInt<1>
    input irq_external_i : UInt<1>
    input irq_fast_i : UInt<15>
    input irq_nm_i : UInt<1>
    input debug_req_i : UInt<1>
    output crash_dump_o_current_pc : UInt<32>
    output crash_dump_o_next_pc : UInt<32>
    output crash_dump_o_last_data_addr : UInt<32>
    output crash_dump_o_exception_addr : UInt<32>
    input fetch_enable_i : UInt<1>
    output alert_minor_o : UInt<1>
    output alert_major_o : UInt<1>
    output core_sleep_o : UInt<1>
    input scan_rst_ni : UInt<1>
    defname = BlackBoxIbexCore
    parameter PMP_ENABLE = 0
    parameter DBG_HW_BREAK_NUM = 1
    parameter PMP_NUM_REGIONS = 4
    parameter WB_STAGE = 0
    parameter RV32E = 0
    parameter MHPM_COUNTER_NUM = 0
    parameter RV32B = 'ibex_pkg::RV32BNone'
    parameter REGFILE = 'ibex_pkg::RegFileFF'
    parameter BRANCH_TARGET_ALU = 0
    parameter MHPM_COUNTER_WIDTH = 0
    parameter DM_HALT_ADDR = 437323776
    parameter PMP_GRANULARITY = 0
    parameter RV32M = 'ibex_pkg::RV32MFast'
    parameter DM_EXCEPTION_ADDR = 437323784
    parameter BRANCH_PREDICTOR = 0

  module IbexModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip clk_i : Clock, flip rst_ni : UInt<1>, flip test_en_i : UInt<1>, flip ram_cfg_i_ram_cfg_en : UInt<1>, flip ram_cfg_i_ram_cfg : UInt<4>, flip ram_cfg_i_rf_cfg_en : UInt<1>, flip ram_cfg_i_rf_cfg : UInt<4>, flip hart_id_i : UInt<32>, flip boot_addr_i : UInt<32>, instr_req_o : UInt<1>, flip instr_gnt_i : UInt<1>, flip instr_rvalid_i : UInt<1>, instr_addr_o : UInt<32>, flip instr_rdata_i : UInt<32>, flip instr_err_i : UInt<1>, data_req_o : UInt<1>, flip data_gnt_i : UInt<1>, flip data_rvalid_i : UInt<1>, data_we_o : UInt<1>, data_be_o : UInt<4>, data_addr_o : UInt<32>, data_wdata_o : UInt<32>, flip data_rdata_i : UInt<32>, flip data_err_i : UInt<1>, flip irq_software_i : UInt<1>, flip irq_timer_i : UInt<1>, flip irq_external_i : UInt<1>, flip irq_fast_i : UInt<15>, flip irq_nm_i : UInt<1>, flip debug_req_i : UInt<1>, crash_dump_o_current_pc : UInt<32>, crash_dump_o_next_pc : UInt<32>, crash_dump_o_last_data_addr : UInt<32>, crash_dump_o_exception_addr : UInt<32>, flip fetch_enable_i : UInt<1>, alert_minor_o : UInt<1>, alert_major_o : UInt<1>, core_sleep_o : UInt<1>, flip scan_rst_ni : UInt<1>}

    inst core of BlackBoxIbexCore @[IbexModule.scala 11:22]
    core.scan_rst_ni is invalid
    core.core_sleep_o is invalid
    core.alert_major_o is invalid
    core.alert_minor_o is invalid
    core.fetch_enable_i is invalid
    core.crash_dump_o_exception_addr is invalid
    core.crash_dump_o_last_data_addr is invalid
    core.crash_dump_o_next_pc is invalid
    core.crash_dump_o_current_pc is invalid
    core.debug_req_i is invalid
    core.irq_nm_i is invalid
    core.irq_fast_i is invalid
    core.irq_external_i is invalid
    core.irq_timer_i is invalid
    core.irq_software_i is invalid
    core.data_err_i is invalid
    core.data_rdata_i is invalid
    core.data_wdata_o is invalid
    core.data_addr_o is invalid
    core.data_be_o is invalid
    core.data_we_o is invalid
    core.data_rvalid_i is invalid
    core.data_gnt_i is invalid
    core.data_req_o is invalid
    core.instr_err_i is invalid
    core.instr_rdata_i is invalid
    core.instr_addr_o is invalid
    core.instr_rvalid_i is invalid
    core.instr_gnt_i is invalid
    core.instr_req_o is invalid
    core.boot_addr_i is invalid
    core.hart_id_i is invalid
    core.ram_cfg_i_rf_cfg is invalid
    core.ram_cfg_i_rf_cfg_en is invalid
    core.ram_cfg_i_ram_cfg is invalid
    core.ram_cfg_i_ram_cfg_en is invalid
    core.test_en_i is invalid
    core.rst_ni is invalid
    core.clk_i is invalid
    core.scan_rst_ni <= io.scan_rst_ni @[IbexModule.scala 12:13]
    io.core_sleep_o <= core.core_sleep_o @[IbexModule.scala 12:13]
    io.alert_major_o <= core.alert_major_o @[IbexModule.scala 12:13]
    io.alert_minor_o <= core.alert_minor_o @[IbexModule.scala 12:13]
    core.fetch_enable_i <= io.fetch_enable_i @[IbexModule.scala 12:13]
    io.crash_dump_o_exception_addr <= core.crash_dump_o_exception_addr @[IbexModule.scala 12:13]
    io.crash_dump_o_last_data_addr <= core.crash_dump_o_last_data_addr @[IbexModule.scala 12:13]
    io.crash_dump_o_next_pc <= core.crash_dump_o_next_pc @[IbexModule.scala 12:13]
    io.crash_dump_o_current_pc <= core.crash_dump_o_current_pc @[IbexModule.scala 12:13]
    core.debug_req_i <= io.debug_req_i @[IbexModule.scala 12:13]
    core.irq_nm_i <= io.irq_nm_i @[IbexModule.scala 12:13]
    core.irq_fast_i <= io.irq_fast_i @[IbexModule.scala 12:13]
    core.irq_external_i <= io.irq_external_i @[IbexModule.scala 12:13]
    core.irq_timer_i <= io.irq_timer_i @[IbexModule.scala 12:13]
    core.irq_software_i <= io.irq_software_i @[IbexModule.scala 12:13]
    core.data_err_i <= io.data_err_i @[IbexModule.scala 12:13]
    core.data_rdata_i <= io.data_rdata_i @[IbexModule.scala 12:13]
    io.data_wdata_o <= core.data_wdata_o @[IbexModule.scala 12:13]
    io.data_addr_o <= core.data_addr_o @[IbexModule.scala 12:13]
    io.data_be_o <= core.data_be_o @[IbexModule.scala 12:13]
    io.data_we_o <= core.data_we_o @[IbexModule.scala 12:13]
    core.data_rvalid_i <= io.data_rvalid_i @[IbexModule.scala 12:13]
    core.data_gnt_i <= io.data_gnt_i @[IbexModule.scala 12:13]
    io.data_req_o <= core.data_req_o @[IbexModule.scala 12:13]
    core.instr_err_i <= io.instr_err_i @[IbexModule.scala 12:13]
    core.instr_rdata_i <= io.instr_rdata_i @[IbexModule.scala 12:13]
    io.instr_addr_o <= core.instr_addr_o @[IbexModule.scala 12:13]
    core.instr_rvalid_i <= io.instr_rvalid_i @[IbexModule.scala 12:13]
    core.instr_gnt_i <= io.instr_gnt_i @[IbexModule.scala 12:13]
    io.instr_req_o <= core.instr_req_o @[IbexModule.scala 12:13]
    core.boot_addr_i <= io.boot_addr_i @[IbexModule.scala 12:13]
    core.hart_id_i <= io.hart_id_i @[IbexModule.scala 12:13]
    core.ram_cfg_i_rf_cfg <= io.ram_cfg_i_rf_cfg @[IbexModule.scala 12:13]
    core.ram_cfg_i_rf_cfg_en <= io.ram_cfg_i_rf_cfg_en @[IbexModule.scala 12:13]
    core.ram_cfg_i_ram_cfg <= io.ram_cfg_i_ram_cfg @[IbexModule.scala 12:13]
    core.ram_cfg_i_ram_cfg_en <= io.ram_cfg_i_ram_cfg_en @[IbexModule.scala 12:13]
    core.test_en_i <= io.test_en_i @[IbexModule.scala 12:13]
    core.rst_ni <= io.rst_ni @[IbexModule.scala 12:13]
    core.clk_i <= io.clk_i @[IbexModule.scala 12:13]

