module IbexModule(
  input         clock,
  input         reset,
  input         io_clk_i,
  input         io_rst_ni,
  input         io_test_en_i,
  input         io_ram_cfg_i_ram_cfg_en,
  input  [3:0]  io_ram_cfg_i_ram_cfg,
  input         io_ram_cfg_i_rf_cfg_en,
  input  [3:0]  io_ram_cfg_i_rf_cfg,
  input  [31:0] io_hart_id_i,
  input  [31:0] io_boot_addr_i,
  output        io_instr_req_o,
  input         io_instr_gnt_i,
  input         io_instr_rvalid_i,
  output [31:0] io_instr_addr_o,
  input  [31:0] io_instr_rdata_i,
  input         io_instr_err_i,
  output        io_data_req_o,
  input         io_data_gnt_i,
  input         io_data_rvalid_i,
  output        io_data_we_o,
  output [3:0]  io_data_be_o,
  output [31:0] io_data_addr_o,
  output [31:0] io_data_wdata_o,
  input  [31:0] io_data_rdata_i,
  input         io_data_err_i,
  input         io_irq_software_i,
  input         io_irq_timer_i,
  input         io_irq_external_i,
  input  [14:0] io_irq_fast_i,
  input         io_irq_nm_i,
  input         io_debug_req_i,
  output [31:0] io_crash_dump_o_current_pc,
  output [31:0] io_crash_dump_o_next_pc,
  output [31:0] io_crash_dump_o_last_data_addr,
  output [31:0] io_crash_dump_o_exception_addr,
  input         io_fetch_enable_i,
  output        io_alert_minor_o,
  output        io_alert_major_o,
  output        io_core_sleep_o,
  input         io_scan_rst_ni
);
  wire  core_clk_i; // @[IbexModule.scala 11:22]
  wire  core_rst_ni; // @[IbexModule.scala 11:22]
  wire  core_test_en_i; // @[IbexModule.scala 11:22]
  wire  core_ram_cfg_i_ram_cfg_en; // @[IbexModule.scala 11:22]
  wire [3:0] core_ram_cfg_i_ram_cfg; // @[IbexModule.scala 11:22]
  wire  core_ram_cfg_i_rf_cfg_en; // @[IbexModule.scala 11:22]
  wire [3:0] core_ram_cfg_i_rf_cfg; // @[IbexModule.scala 11:22]
  wire [31:0] core_hart_id_i; // @[IbexModule.scala 11:22]
  wire [31:0] core_boot_addr_i; // @[IbexModule.scala 11:22]
  wire  core_instr_req_o; // @[IbexModule.scala 11:22]
  wire  core_instr_gnt_i; // @[IbexModule.scala 11:22]
  wire  core_instr_rvalid_i; // @[IbexModule.scala 11:22]
  wire [31:0] core_instr_addr_o; // @[IbexModule.scala 11:22]
  wire [31:0] core_instr_rdata_i; // @[IbexModule.scala 11:22]
  wire  core_instr_err_i; // @[IbexModule.scala 11:22]
  wire  core_data_req_o; // @[IbexModule.scala 11:22]
  wire  core_data_gnt_i; // @[IbexModule.scala 11:22]
  wire  core_data_rvalid_i; // @[IbexModule.scala 11:22]
  wire  core_data_we_o; // @[IbexModule.scala 11:22]
  wire [3:0] core_data_be_o; // @[IbexModule.scala 11:22]
  wire [31:0] core_data_addr_o; // @[IbexModule.scala 11:22]
  wire [31:0] core_data_wdata_o; // @[IbexModule.scala 11:22]
  wire [31:0] core_data_rdata_i; // @[IbexModule.scala 11:22]
  wire  core_data_err_i; // @[IbexModule.scala 11:22]
  wire  core_irq_software_i; // @[IbexModule.scala 11:22]
  wire  core_irq_timer_i; // @[IbexModule.scala 11:22]
  wire  core_irq_external_i; // @[IbexModule.scala 11:22]
  wire [14:0] core_irq_fast_i; // @[IbexModule.scala 11:22]
  wire  core_irq_nm_i; // @[IbexModule.scala 11:22]
  wire  core_debug_req_i; // @[IbexModule.scala 11:22]
  wire [31:0] core_crash_dump_o_current_pc; // @[IbexModule.scala 11:22]
  wire [31:0] core_crash_dump_o_next_pc; // @[IbexModule.scala 11:22]
  wire [31:0] core_crash_dump_o_last_data_addr; // @[IbexModule.scala 11:22]
  wire [31:0] core_crash_dump_o_exception_addr; // @[IbexModule.scala 11:22]
  wire  core_fetch_enable_i; // @[IbexModule.scala 11:22]
  wire  core_alert_minor_o; // @[IbexModule.scala 11:22]
  wire  core_alert_major_o; // @[IbexModule.scala 11:22]
  wire  core_core_sleep_o; // @[IbexModule.scala 11:22]
  wire  core_scan_rst_ni; // @[IbexModule.scala 11:22]
  BlackBoxIbexCore
    #(.PMP_ENABLE(0), .DBG_HW_BREAK_NUM(1), .PMP_NUM_REGIONS(4), .WB_STAGE(0), .RV32E(0), .MHPM_COUNTER_NUM(0), .RV32B(ibex_pkg::RV32BNone), .REGFILE(ibex_pkg::RegFileFF), .BRANCH_TARGET_ALU(0), .MHPM_COUNTER_WIDTH(0), .DM_HALT_ADDR(437323776), .PMP_GRANULARITY(0), .RV32M(ibex_pkg::RV32MFast), .DM_EXCEPTION_ADDR(437323784), .BRANCH_PREDICTOR(0))
    core ( // @[IbexModule.scala 11:22]
    .clk_i(core_clk_i),
    .rst_ni(core_rst_ni),
    .test_en_i(core_test_en_i),
    .ram_cfg_i_ram_cfg_en(core_ram_cfg_i_ram_cfg_en),
    .ram_cfg_i_ram_cfg(core_ram_cfg_i_ram_cfg),
    .ram_cfg_i_rf_cfg_en(core_ram_cfg_i_rf_cfg_en),
    .ram_cfg_i_rf_cfg(core_ram_cfg_i_rf_cfg),
    .hart_id_i(core_hart_id_i),
    .boot_addr_i(core_boot_addr_i),
    .instr_req_o(core_instr_req_o),
    .instr_gnt_i(core_instr_gnt_i),
    .instr_rvalid_i(core_instr_rvalid_i),
    .instr_addr_o(core_instr_addr_o),
    .instr_rdata_i(core_instr_rdata_i),
    .instr_err_i(core_instr_err_i),
    .data_req_o(core_data_req_o),
    .data_gnt_i(core_data_gnt_i),
    .data_rvalid_i(core_data_rvalid_i),
    .data_we_o(core_data_we_o),
    .data_be_o(core_data_be_o),
    .data_addr_o(core_data_addr_o),
    .data_wdata_o(core_data_wdata_o),
    .data_rdata_i(core_data_rdata_i),
    .data_err_i(core_data_err_i),
    .irq_software_i(core_irq_software_i),
    .irq_timer_i(core_irq_timer_i),
    .irq_external_i(core_irq_external_i),
    .irq_fast_i(core_irq_fast_i),
    .irq_nm_i(core_irq_nm_i),
    .debug_req_i(core_debug_req_i),
    .crash_dump_o_current_pc(core_crash_dump_o_current_pc),
    .crash_dump_o_next_pc(core_crash_dump_o_next_pc),
    .crash_dump_o_last_data_addr(core_crash_dump_o_last_data_addr),
    .crash_dump_o_exception_addr(core_crash_dump_o_exception_addr),
    .fetch_enable_i(core_fetch_enable_i),
    .alert_minor_o(core_alert_minor_o),
    .alert_major_o(core_alert_major_o),
    .core_sleep_o(core_core_sleep_o),
    .scan_rst_ni(core_scan_rst_ni)
  );
  assign io_instr_req_o = core_instr_req_o; // @[IbexModule.scala 12:13]
  assign io_instr_addr_o = core_instr_addr_o; // @[IbexModule.scala 12:13]
  assign io_data_req_o = core_data_req_o; // @[IbexModule.scala 12:13]
  assign io_data_we_o = core_data_we_o; // @[IbexModule.scala 12:13]
  assign io_data_be_o = core_data_be_o; // @[IbexModule.scala 12:13]
  assign io_data_addr_o = core_data_addr_o; // @[IbexModule.scala 12:13]
  assign io_data_wdata_o = core_data_wdata_o; // @[IbexModule.scala 12:13]
  assign io_crash_dump_o_current_pc = core_crash_dump_o_current_pc; // @[IbexModule.scala 12:13]
  assign io_crash_dump_o_next_pc = core_crash_dump_o_next_pc; // @[IbexModule.scala 12:13]
  assign io_crash_dump_o_last_data_addr = core_crash_dump_o_last_data_addr; // @[IbexModule.scala 12:13]
  assign io_crash_dump_o_exception_addr = core_crash_dump_o_exception_addr; // @[IbexModule.scala 12:13]
  assign io_alert_minor_o = core_alert_minor_o; // @[IbexModule.scala 12:13]
  assign io_alert_major_o = core_alert_major_o; // @[IbexModule.scala 12:13]
  assign io_core_sleep_o = core_core_sleep_o; // @[IbexModule.scala 12:13]
  assign core_clk_i = io_clk_i; // @[IbexModule.scala 12:13]
  assign core_rst_ni = io_rst_ni; // @[IbexModule.scala 12:13]
  assign core_test_en_i = io_test_en_i; // @[IbexModule.scala 12:13]
  assign core_ram_cfg_i_ram_cfg_en = io_ram_cfg_i_ram_cfg_en; // @[IbexModule.scala 12:13]
  assign core_ram_cfg_i_ram_cfg = io_ram_cfg_i_ram_cfg; // @[IbexModule.scala 12:13]
  assign core_ram_cfg_i_rf_cfg_en = io_ram_cfg_i_rf_cfg_en; // @[IbexModule.scala 12:13]
  assign core_ram_cfg_i_rf_cfg = io_ram_cfg_i_rf_cfg; // @[IbexModule.scala 12:13]
  assign core_hart_id_i = io_hart_id_i; // @[IbexModule.scala 12:13]
  assign core_boot_addr_i = io_boot_addr_i; // @[IbexModule.scala 12:13]
  assign core_instr_gnt_i = io_instr_gnt_i; // @[IbexModule.scala 12:13]
  assign core_instr_rvalid_i = io_instr_rvalid_i; // @[IbexModule.scala 12:13]
  assign core_instr_rdata_i = io_instr_rdata_i; // @[IbexModule.scala 12:13]
  assign core_instr_err_i = io_instr_err_i; // @[IbexModule.scala 12:13]
  assign core_data_gnt_i = io_data_gnt_i; // @[IbexModule.scala 12:13]
  assign core_data_rvalid_i = io_data_rvalid_i; // @[IbexModule.scala 12:13]
  assign core_data_rdata_i = io_data_rdata_i; // @[IbexModule.scala 12:13]
  assign core_data_err_i = io_data_err_i; // @[IbexModule.scala 12:13]
  assign core_irq_software_i = io_irq_software_i; // @[IbexModule.scala 12:13]
  assign core_irq_timer_i = io_irq_timer_i; // @[IbexModule.scala 12:13]
  assign core_irq_external_i = io_irq_external_i; // @[IbexModule.scala 12:13]
  assign core_irq_fast_i = io_irq_fast_i; // @[IbexModule.scala 12:13]
  assign core_irq_nm_i = io_irq_nm_i; // @[IbexModule.scala 12:13]
  assign core_debug_req_i = io_debug_req_i; // @[IbexModule.scala 12:13]
  assign core_fetch_enable_i = io_fetch_enable_i; // @[IbexModule.scala 12:13]
  assign core_scan_rst_ni = io_scan_rst_ni; // @[IbexModule.scala 12:13]
endmodule
