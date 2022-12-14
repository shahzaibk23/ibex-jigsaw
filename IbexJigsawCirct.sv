// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifdef RANDOMIZE_REG_INIT
  `define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
  `define RANDOMIZE
`endif

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifdef RANDOMIZE
  `ifdef VERILATOR
    `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
  `else
    `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
  `endif
`else
  `define INIT_RANDOM_PROLOG_
`endif

// VCS coverage exclude_file
module mem_0_combMem(	// BlockRam.scala:141:24
  input  [9:0] R0_addr,
  input        R0_en,
               R0_clk,
  input  [9:0] W0_addr,
  input        W0_en,
               W0_clk,
  input  [7:0] W0_data,
  output [7:0] R0_data);

  reg [7:0] Memory[0:1023];	// BlockRam.scala:141:24
  reg       _GEN;	// BlockRam.scala:141:24
  reg [9:0] _GEN_0;	// BlockRam.scala:141:24
  always @(posedge R0_clk) begin	// BlockRam.scala:141:24
    _GEN <= R0_en;	// BlockRam.scala:141:24
    _GEN_0 <= R0_addr;	// BlockRam.scala:141:24
  end // always @(posedge)
  always @(posedge W0_clk) begin	// BlockRam.scala:141:24
    if (W0_en)	// BlockRam.scala:141:24
      Memory[W0_addr] <= W0_data;	// BlockRam.scala:141:24
  end // always @(posedge)
  `ifndef SYNTHESIS	// BlockRam.scala:141:24
    `ifdef RANDOMIZE_MEM_INIT	// BlockRam.scala:141:24
      integer initvar;	// BlockRam.scala:141:24
      reg [31:0] _RANDOM_MEM;	// BlockRam.scala:141:24
    `endif
    `ifdef RANDOMIZE_REG_INIT	// BlockRam.scala:141:24
      reg [31:0] _RANDOM;	// BlockRam.scala:141:24
    `endif
    initial begin	// BlockRam.scala:141:24
      `INIT_RANDOM_PROLOG_	// BlockRam.scala:141:24
      `ifdef RANDOMIZE_MEM_INIT	// BlockRam.scala:141:24
        for (initvar = 0; initvar < 1024; initvar = initvar + 1) begin
          _RANDOM_MEM = {`RANDOM};
          Memory[initvar] = _RANDOM_MEM[7:0];
        end	// BlockRam.scala:141:24
      `endif
      `ifdef RANDOMIZE_REG_INIT	// BlockRam.scala:141:24
        _RANDOM = {`RANDOM};	// BlockRam.scala:141:24
        _GEN = _RANDOM[0];	// BlockRam.scala:141:24
        _GEN_0 = _RANDOM[10:1];	// BlockRam.scala:141:24
      `endif
    end // initial
  `endif
  assign R0_data = _GEN ? Memory[_GEN_0] : 8'bx;	// BlockRam.scala:141:24
endmodule

// VCS coverage exclude_file
module mem_combMem(	// BlockRam.scala:82:24
  input  [9:0]  R0_addr,
  input         R0_en,
                R0_clk,
  input  [9:0]  W0_addr,
  input         W0_en,
                W0_clk,
  input  [31:0] W0_data,
  output [31:0] R0_data);

  reg [31:0] Memory[0:1023];	// BlockRam.scala:82:24
  reg        _GEN;	// BlockRam.scala:82:24
  reg [9:0]  _GEN_0;	// BlockRam.scala:82:24
  always @(posedge R0_clk) begin	// BlockRam.scala:82:24
    _GEN <= R0_en;	// BlockRam.scala:82:24
    _GEN_0 <= R0_addr;	// BlockRam.scala:82:24
  end // always @(posedge)
  always @(posedge W0_clk) begin	// BlockRam.scala:82:24
    if (W0_en)	// BlockRam.scala:82:24
      Memory[W0_addr] <= W0_data;	// BlockRam.scala:82:24
  end // always @(posedge)
  `ifndef SYNTHESIS	// BlockRam.scala:82:24
    `ifdef RANDOMIZE_MEM_INIT	// BlockRam.scala:82:24
      integer initvar;	// BlockRam.scala:82:24
      reg [31:0] _RANDOM_MEM;	// BlockRam.scala:82:24
    `endif
    `ifdef RANDOMIZE_REG_INIT	// BlockRam.scala:82:24
      reg [31:0] _RANDOM;	// BlockRam.scala:82:24
    `endif
    initial begin	// BlockRam.scala:82:24
      `INIT_RANDOM_PROLOG_	// BlockRam.scala:82:24
      `ifdef RANDOMIZE_MEM_INIT	// BlockRam.scala:82:24
        for (initvar = 0; initvar < 1024; initvar = initvar + 1) begin
          _RANDOM_MEM = {`RANDOM};
          Memory[initvar] = _RANDOM_MEM[31:0];
        end	// BlockRam.scala:82:24
      `endif
      `ifdef RANDOMIZE_REG_INIT	// BlockRam.scala:82:24
        _RANDOM = {`RANDOM};	// BlockRam.scala:82:24
        _GEN = _RANDOM[0];	// BlockRam.scala:82:24
        _GEN_0 = _RANDOM[10:1];	// BlockRam.scala:82:24
      `endif
    end // initial
  `endif
  assign R0_data = _GEN ? Memory[_GEN_0] : 32'bx;	// BlockRam.scala:82:24
endmodule

module TilelinkHost(
  input         clock,
                reset,
                io_tlSlaveReceiver_valid,
                io_tlSlaveReceiver_bits_d_denied,
  input  [31:0] io_tlSlaveReceiver_bits_d_data,
  input         io_reqIn_valid,
  input  [31:0] io_reqIn_bits_addrRequest,
  output        io_tlMasterTransmitter_valid,
  output [2:0]  io_tlMasterTransmitter_bits_a_opcode,
  output [31:0] io_tlMasterTransmitter_bits_a_address,
  output        io_reqIn_ready,
                io_rspOut_valid,
  output [31:0] io_rspOut_bits_dataResponse,
  output        io_rspOut_bits_error);

  reg         stateReg;	// TilelinkHost.scala:19:27
  reg  [31:0] addrReg;	// TilelinkHost.scala:20:27
  wire [31:0] _GEN = stateReg | ~io_reqIn_valid ? addrReg : io_reqIn_bits_addrRequest;	// TilelinkHost.scala:19:27, :20:27, :42:45, :56:28, :60:29
  wire        _GEN_0 = stateReg & io_tlSlaveReceiver_valid;	// TilelinkHost.scala:19:27, :50:45, :56:28, :84:43
  always @(posedge clock) begin
    if (reset) begin
      stateReg <= 1'h0;	// TilelinkHost.scala:19:27
      addrReg <= 32'h0;	// TilelinkHost.scala:20:27
    end
    else begin
      stateReg <= stateReg ? (~stateReg | ~io_tlSlaveReceiver_valid) & stateReg : io_reqIn_valid | stateReg;	// TilelinkHost.scala:19:27, :33:33, :56:28, :60:29, :77:22, :84:43, :87:34, :89:39, :95:22
      addrReg <= _GEN;	// TilelinkHost.scala:20:27, :42:45, :56:28, :60:29
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif
    initial begin
      automatic logic [31:0] _RANDOM_0;
      automatic logic [31:0] _RANDOM_1;
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        stateReg = _RANDOM_0[0];	// TilelinkHost.scala:19:27
        addrReg = {_RANDOM_0[31:1], _RANDOM_1[0]};	// TilelinkHost.scala:19:27, :20:27
      `endif
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif
  `endif
  assign io_tlMasterTransmitter_valid = ~stateReg & io_reqIn_valid;	// TilelinkHost.scala:19:27, :48:45, :56:{19,28}, :60:29
  assign io_tlMasterTransmitter_bits_a_opcode = stateReg ? 3'h0 : {io_reqIn_valid, 2'h0};	// TilelinkHost.scala:19:27, :40:45, :56:28, :60:29, :62:53
  assign io_tlMasterTransmitter_bits_a_address = _GEN;	// TilelinkHost.scala:42:45, :56:28, :60:29
  assign io_reqIn_ready = ~stateReg | ~stateReg;	// TilelinkHost.scala:19:27, :33:33, :56:{19,28}, :84:43, :87:34
  assign io_rspOut_valid = _GEN_0;	// TilelinkHost.scala:50:45, :56:28, :84:43
  assign io_rspOut_bits_dataResponse = _GEN_0 ? io_tlSlaveReceiver_bits_d_data : 32'h0;	// TilelinkHost.scala:50:45, :56:28, :84:43
  assign io_rspOut_bits_error = stateReg & io_tlSlaveReceiver_valid & io_tlSlaveReceiver_bits_d_denied;	// TilelinkHost.scala:19:27, :51:45, :56:28, :84:43
endmodule

module TilelinkDevice(
  input         clock,
                reset,
                io_tlMasterReceiver_valid,
  input  [2:0]  io_tlMasterReceiver_bits_a_opcode,
  input  [31:0] io_tlMasterReceiver_bits_a_address,
  input         io_rspIn_valid,
  input  [31:0] io_rspIn_bits_dataResponse,
  input         io_rspIn_bits_error,
  output        io_tlSlaveTransmitter_valid,
                io_tlSlaveTransmitter_bits_d_denied,
  output [31:0] io_tlSlaveTransmitter_bits_d_data,
  output        io_reqOut_valid,
  output [31:0] io_reqOut_bits_addrRequest,
  output        io_reqOut_bits_isWrite);

  reg  stateReg;	// TilelinkDevice.scala:17:27
  wire _GEN = stateReg & io_rspIn_valid;	// TilelinkDevice.scala:17:27, :30:45, :41:28, :56:43
  always @(posedge clock) begin
    if (reset)
      stateReg <= 1'h0;	// TilelinkDevice.scala:17:27
    else
      stateReg <= stateReg ? (~stateReg | ~io_rspIn_valid) & stateReg : io_tlMasterReceiver_valid | stateReg;	// TilelinkDevice.scala:17:27, :41:28, :43:40, :51:22, :56:43, :60:29, :72:22
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif
    initial begin
      automatic logic [31:0] _RANDOM_0;
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        stateReg = _RANDOM_0[0];	// TilelinkDevice.scala:17:27
      `endif
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif
  `endif
  assign io_tlSlaveTransmitter_valid = _GEN;	// TilelinkDevice.scala:30:45, :41:28, :56:43
  assign io_tlSlaveTransmitter_bits_d_denied = stateReg & io_rspIn_valid & io_rspIn_bits_error;	// TilelinkDevice.scala:17:27, :35:45, :41:28, :56:43
  assign io_tlSlaveTransmitter_bits_d_data = _GEN ? io_rspIn_bits_dataResponse : 32'h0;	// TilelinkDevice.scala:30:45, :41:28, :56:43
  assign io_reqOut_valid = ~stateReg & io_tlMasterReceiver_valid;	// TilelinkDevice.scala:17:27, :27:37, :41:{19,28}, :43:40
  assign io_reqOut_bits_addrRequest = stateReg | ~io_tlMasterReceiver_valid ? 32'h0 : io_tlMasterReceiver_bits_a_address;	// TilelinkDevice.scala:17:27, :23:37, :41:28, :43:40
  assign io_reqOut_bits_isWrite = ~stateReg & io_tlMasterReceiver_valid & (io_tlMasterReceiver_bits_a_opcode == 3'h0 |
                io_tlMasterReceiver_bits_a_opcode == 3'h1);	// TilelinkDevice.scala:17:27, :26:37, :41:{19,28}, :43:40, :48:{73,91,128}
endmodule

module TilelinkAdapter(
  input         clock,
                reset,
                io_reqIn_valid,
  input  [31:0] io_reqIn_bits_addrRequest,
  input         io_rspIn_valid,
  input  [31:0] io_rspIn_bits_dataResponse,
  input         io_rspIn_bits_error,
  output        io_reqIn_ready,
                io_rspOut_valid,
  output [31:0] io_rspOut_bits_dataResponse,
  output        io_rspOut_bits_error,
                io_reqOut_valid,
  output [31:0] io_reqOut_bits_addrRequest,
  output        io_reqOut_bits_isWrite);

  wire        _tlSlave_io_tlSlaveTransmitter_valid;	// TilelinkAdapter.scala:19:25
  wire        _tlSlave_io_tlSlaveTransmitter_bits_d_denied;	// TilelinkAdapter.scala:19:25
  wire [31:0] _tlSlave_io_tlSlaveTransmitter_bits_d_data;	// TilelinkAdapter.scala:19:25
  wire        _tlHost_io_tlMasterTransmitter_valid;	// TilelinkAdapter.scala:18:24
  wire [2:0]  _tlHost_io_tlMasterTransmitter_bits_a_opcode;	// TilelinkAdapter.scala:18:24
  wire [31:0] _tlHost_io_tlMasterTransmitter_bits_a_address;	// TilelinkAdapter.scala:18:24
  TilelinkHost tlHost (	// TilelinkAdapter.scala:18:24
    .clock                                 (clock),
    .reset                                 (reset),
    .io_tlSlaveReceiver_valid              (_tlSlave_io_tlSlaveTransmitter_valid),	// TilelinkAdapter.scala:19:25
    .io_tlSlaveReceiver_bits_d_denied      (_tlSlave_io_tlSlaveTransmitter_bits_d_denied),	// TilelinkAdapter.scala:19:25
    .io_tlSlaveReceiver_bits_d_data        (_tlSlave_io_tlSlaveTransmitter_bits_d_data),	// TilelinkAdapter.scala:19:25
    .io_reqIn_valid                        (io_reqIn_valid),
    .io_reqIn_bits_addrRequest             (io_reqIn_bits_addrRequest),
    .io_tlMasterTransmitter_valid          (_tlHost_io_tlMasterTransmitter_valid),
    .io_tlMasterTransmitter_bits_a_opcode  (_tlHost_io_tlMasterTransmitter_bits_a_opcode),
    .io_tlMasterTransmitter_bits_a_address (_tlHost_io_tlMasterTransmitter_bits_a_address),
    .io_reqIn_ready                        (io_reqIn_ready),
    .io_rspOut_valid                       (io_rspOut_valid),
    .io_rspOut_bits_dataResponse           (io_rspOut_bits_dataResponse),
    .io_rspOut_bits_error                  (io_rspOut_bits_error)
  );
  TilelinkDevice tlSlave (	// TilelinkAdapter.scala:19:25
    .clock                               (clock),
    .reset                               (reset),
    .io_tlMasterReceiver_valid           (_tlHost_io_tlMasterTransmitter_valid),	// TilelinkAdapter.scala:18:24
    .io_tlMasterReceiver_bits_a_opcode   (_tlHost_io_tlMasterTransmitter_bits_a_opcode),	// TilelinkAdapter.scala:18:24
    .io_tlMasterReceiver_bits_a_address  (_tlHost_io_tlMasterTransmitter_bits_a_address),	// TilelinkAdapter.scala:18:24
    .io_rspIn_valid                      (io_rspIn_valid),
    .io_rspIn_bits_dataResponse          (io_rspIn_bits_dataResponse),
    .io_rspIn_bits_error                 (io_rspIn_bits_error),
    .io_tlSlaveTransmitter_valid         (_tlSlave_io_tlSlaveTransmitter_valid),
    .io_tlSlaveTransmitter_bits_d_denied (_tlSlave_io_tlSlaveTransmitter_bits_d_denied),
    .io_tlSlaveTransmitter_bits_d_data   (_tlSlave_io_tlSlaveTransmitter_bits_d_data),
    .io_reqOut_valid                     (io_reqOut_valid),
    .io_reqOut_bits_addrRequest          (io_reqOut_bits_addrRequest),
    .io_reqOut_bits_isWrite              (io_reqOut_bits_isWrite)
  );
endmodule

module TilelinkHost_1(
  input         clock,
                reset,
                io_tlSlaveReceiver_valid,
  input  [31:0] io_tlSlaveReceiver_bits_d_data,
  input         io_reqIn_valid,
  input  [31:0] io_reqIn_bits_addrRequest,
                io_reqIn_bits_dataRequest,
  input  [3:0]  io_reqIn_bits_activeByteLane,
  input         io_reqIn_bits_isWrite,
  output        io_tlMasterTransmitter_valid,
  output [2:0]  io_tlMasterTransmitter_bits_a_opcode,
  output [31:0] io_tlMasterTransmitter_bits_a_address,
  output [3:0]  io_tlMasterTransmitter_bits_a_mask,
  output [31:0] io_tlMasterTransmitter_bits_a_data,
  output        io_reqIn_ready,
                io_rspOut_valid,
  output [31:0] io_rspOut_bits_dataResponse);

  reg         stateReg;	// TilelinkHost.scala:19:27
  reg  [31:0] addrReg;	// TilelinkHost.scala:20:27
  wire        _GEN = stateReg | ~io_reqIn_valid;	// TilelinkHost.scala:19:27, :40:45, :56:28, :60:29
  wire [31:0] _GEN_0 = _GEN ? addrReg : io_reqIn_bits_addrRequest;	// TilelinkHost.scala:20:27, :40:45, :42:45, :56:28, :60:29
  wire        _GEN_1 = stateReg & io_tlSlaveReceiver_valid;	// TilelinkHost.scala:19:27, :50:45, :56:28, :84:43
  always @(posedge clock) begin
    if (reset) begin
      stateReg <= 1'h0;	// TilelinkHost.scala:19:27
      addrReg <= 32'h0;	// TilelinkHost.scala:20:27, :41:45
    end
    else begin
      stateReg <= stateReg ? (~stateReg | ~io_tlSlaveReceiver_valid) & stateReg : io_reqIn_valid | stateReg;	// TilelinkHost.scala:19:27, :33:33, :56:28, :60:29, :77:22, :84:43, :87:34, :89:39, :95:22
      addrReg <= _GEN_0;	// TilelinkHost.scala:20:27, :42:45, :56:28, :60:29
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif
    initial begin
      automatic logic [31:0] _RANDOM_0;
      automatic logic [31:0] _RANDOM_1;
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        stateReg = _RANDOM_0[0];	// TilelinkHost.scala:19:27
        addrReg = {_RANDOM_0[31:1], _RANDOM_1[0]};	// TilelinkHost.scala:19:27, :20:27
      `endif
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif
  `endif
  assign io_tlMasterTransmitter_valid = ~stateReg & io_reqIn_valid;	// TilelinkHost.scala:19:27, :48:45, :56:{19,28}, :60:29
  assign io_tlMasterTransmitter_bits_a_opcode = _GEN ? 3'h0 : io_reqIn_bits_isWrite ? {2'h0, io_reqIn_bits_activeByteLane != 4'hF} : 3'h4;	// TilelinkHost.scala:40:45, :56:28, :60:29, :62:{59,116}
  assign io_tlMasterTransmitter_bits_a_address = _GEN_0;	// TilelinkHost.scala:42:45, :56:28, :60:29
  assign io_tlMasterTransmitter_bits_a_mask = _GEN ? 4'h0 : io_reqIn_bits_activeByteLane;	// TilelinkHost.scala:40:45, :46:45, :56:28, :60:29
  assign io_tlMasterTransmitter_bits_a_data = _GEN ? 32'h0 : io_reqIn_bits_dataRequest;	// TilelinkHost.scala:40:45, :41:45, :56:28, :60:29
  assign io_reqIn_ready = ~stateReg | ~stateReg;	// TilelinkHost.scala:19:27, :33:33, :56:{19,28}, :84:43, :87:34
  assign io_rspOut_valid = _GEN_1;	// TilelinkHost.scala:50:45, :56:28, :84:43
  assign io_rspOut_bits_dataResponse = _GEN_1 ? io_tlSlaveReceiver_bits_d_data : 32'h0;	// TilelinkHost.scala:41:45, :50:45, :56:28, :84:43
endmodule

module TilelinkDevice_1(
  input         clock,
                reset,
                io_tlMasterReceiver_valid,
  input  [2:0]  io_tlMasterReceiver_bits_a_opcode,
  input  [31:0] io_tlMasterReceiver_bits_a_address,
  input  [3:0]  io_tlMasterReceiver_bits_a_mask,
  input  [31:0] io_tlMasterReceiver_bits_a_data,
  input         io_rspIn_valid,
  input  [31:0] io_rspIn_bits_dataResponse,
  output        io_tlSlaveTransmitter_valid,
  output [31:0] io_tlSlaveTransmitter_bits_d_data,
  output        io_reqOut_valid,
  output [31:0] io_reqOut_bits_addrRequest,
                io_reqOut_bits_dataRequest,
  output [3:0]  io_reqOut_bits_activeByteLane,
  output        io_reqOut_bits_isWrite);

  reg  stateReg;	// TilelinkDevice.scala:17:27
  wire _GEN = stateReg | ~io_tlMasterReceiver_valid;	// TilelinkDevice.scala:17:27, :23:37, :41:28, :43:40
  wire _GEN_0 = stateReg & io_rspIn_valid;	// TilelinkDevice.scala:17:27, :30:45, :41:28, :56:43
  always @(posedge clock) begin
    if (reset)
      stateReg <= 1'h0;	// TilelinkDevice.scala:17:27
    else
      stateReg <= stateReg ? (~stateReg | ~io_rspIn_valid) & stateReg : io_tlMasterReceiver_valid | stateReg;	// TilelinkDevice.scala:17:27, :41:28, :43:40, :51:22, :56:43, :60:29, :72:22
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif
    initial begin
      automatic logic [31:0] _RANDOM_0;
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        stateReg = _RANDOM_0[0];	// TilelinkDevice.scala:17:27
      `endif
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif
  `endif
  assign io_tlSlaveTransmitter_valid = _GEN_0;	// TilelinkDevice.scala:30:45, :41:28, :56:43
  assign io_tlSlaveTransmitter_bits_d_data = _GEN_0 ? io_rspIn_bits_dataResponse : 32'h0;	// TilelinkDevice.scala:23:37, :30:45, :41:28, :56:43
  assign io_reqOut_valid = ~stateReg & io_tlMasterReceiver_valid;	// TilelinkDevice.scala:17:27, :27:37, :41:{19,28}, :43:40
  assign io_reqOut_bits_addrRequest = _GEN ? 32'h0 : io_tlMasterReceiver_bits_a_address;	// TilelinkDevice.scala:23:37, :41:28, :43:40
  assign io_reqOut_bits_dataRequest = _GEN ? 32'h0 : io_tlMasterReceiver_bits_a_data;	// TilelinkDevice.scala:23:37, :24:37, :41:28, :43:40
  assign io_reqOut_bits_activeByteLane = _GEN ? 4'h0 : io_tlMasterReceiver_bits_a_mask;	// TilelinkDevice.scala:23:37, :25:37, :41:28, :43:40
  assign io_reqOut_bits_isWrite = ~stateReg & io_tlMasterReceiver_valid & (io_tlMasterReceiver_bits_a_opcode == 3'h0 |
                io_tlMasterReceiver_bits_a_opcode == 3'h1);	// TilelinkDevice.scala:17:27, :26:37, :41:{19,28}, :43:40, :48:{73,91,128}
endmodule

module TilelinkAdapter_1(
  input         clock,
                reset,
                io_reqIn_valid,
  input  [31:0] io_reqIn_bits_addrRequest,
                io_reqIn_bits_dataRequest,
  input  [3:0]  io_reqIn_bits_activeByteLane,
  input         io_reqIn_bits_isWrite,
                io_rspIn_valid,
  input  [31:0] io_rspIn_bits_dataResponse,
  output        io_reqIn_ready,
                io_rspOut_valid,
  output [31:0] io_rspOut_bits_dataResponse,
  output        io_reqOut_valid,
  output [31:0] io_reqOut_bits_addrRequest,
                io_reqOut_bits_dataRequest,
  output [3:0]  io_reqOut_bits_activeByteLane,
  output        io_reqOut_bits_isWrite);

  wire        _tlSlave_io_tlSlaveTransmitter_valid;	// TilelinkAdapter.scala:19:25
  wire [31:0] _tlSlave_io_tlSlaveTransmitter_bits_d_data;	// TilelinkAdapter.scala:19:25
  wire        _tlHost_io_tlMasterTransmitter_valid;	// TilelinkAdapter.scala:18:24
  wire [2:0]  _tlHost_io_tlMasterTransmitter_bits_a_opcode;	// TilelinkAdapter.scala:18:24
  wire [31:0] _tlHost_io_tlMasterTransmitter_bits_a_address;	// TilelinkAdapter.scala:18:24
  wire [3:0]  _tlHost_io_tlMasterTransmitter_bits_a_mask;	// TilelinkAdapter.scala:18:24
  wire [31:0] _tlHost_io_tlMasterTransmitter_bits_a_data;	// TilelinkAdapter.scala:18:24
  TilelinkHost_1 tlHost (	// TilelinkAdapter.scala:18:24
    .clock                                 (clock),
    .reset                                 (reset),
    .io_tlSlaveReceiver_valid              (_tlSlave_io_tlSlaveTransmitter_valid),	// TilelinkAdapter.scala:19:25
    .io_tlSlaveReceiver_bits_d_data        (_tlSlave_io_tlSlaveTransmitter_bits_d_data),	// TilelinkAdapter.scala:19:25
    .io_reqIn_valid                        (io_reqIn_valid),
    .io_reqIn_bits_addrRequest             (io_reqIn_bits_addrRequest),
    .io_reqIn_bits_dataRequest             (io_reqIn_bits_dataRequest),
    .io_reqIn_bits_activeByteLane          (io_reqIn_bits_activeByteLane),
    .io_reqIn_bits_isWrite                 (io_reqIn_bits_isWrite),
    .io_tlMasterTransmitter_valid          (_tlHost_io_tlMasterTransmitter_valid),
    .io_tlMasterTransmitter_bits_a_opcode  (_tlHost_io_tlMasterTransmitter_bits_a_opcode),
    .io_tlMasterTransmitter_bits_a_address (_tlHost_io_tlMasterTransmitter_bits_a_address),
    .io_tlMasterTransmitter_bits_a_mask    (_tlHost_io_tlMasterTransmitter_bits_a_mask),
    .io_tlMasterTransmitter_bits_a_data    (_tlHost_io_tlMasterTransmitter_bits_a_data),
    .io_reqIn_ready                        (io_reqIn_ready),
    .io_rspOut_valid                       (io_rspOut_valid),
    .io_rspOut_bits_dataResponse           (io_rspOut_bits_dataResponse)
  );
  TilelinkDevice_1 tlSlave (	// TilelinkAdapter.scala:19:25
    .clock                              (clock),
    .reset                              (reset),
    .io_tlMasterReceiver_valid          (_tlHost_io_tlMasterTransmitter_valid),	// TilelinkAdapter.scala:18:24
    .io_tlMasterReceiver_bits_a_opcode  (_tlHost_io_tlMasterTransmitter_bits_a_opcode),	// TilelinkAdapter.scala:18:24
    .io_tlMasterReceiver_bits_a_address (_tlHost_io_tlMasterTransmitter_bits_a_address),	// TilelinkAdapter.scala:18:24
    .io_tlMasterReceiver_bits_a_mask    (_tlHost_io_tlMasterTransmitter_bits_a_mask),	// TilelinkAdapter.scala:18:24
    .io_tlMasterReceiver_bits_a_data    (_tlHost_io_tlMasterTransmitter_bits_a_data),	// TilelinkAdapter.scala:18:24
    .io_rspIn_valid                     (io_rspIn_valid),
    .io_rspIn_bits_dataResponse         (io_rspIn_bits_dataResponse),
    .io_tlSlaveTransmitter_valid        (_tlSlave_io_tlSlaveTransmitter_valid),
    .io_tlSlaveTransmitter_bits_d_data  (_tlSlave_io_tlSlaveTransmitter_bits_d_data),
    .io_reqOut_valid                    (io_reqOut_valid),
    .io_reqOut_bits_addrRequest         (io_reqOut_bits_addrRequest),
    .io_reqOut_bits_dataRequest         (io_reqOut_bits_dataRequest),
    .io_reqOut_bits_activeByteLane      (io_reqOut_bits_activeByteLane),
    .io_reqOut_bits_isWrite             (io_reqOut_bits_isWrite)
  );
endmodule

module BlockRamWithoutMasking(
  input         clock,
                reset,
                io_req_valid,
  input  [31:0] io_req_bits_addrRequest,
  input         io_req_bits_isWrite,
  output        io_rsp_valid,
  output [31:0] io_rsp_bits_dataResponse,
  output        io_rsp_bits_error);

  wire [31:0] _mem_ext_R0_data;	// BlockRam.scala:82:24
  reg         validReg;	// BlockRam.scala:72:25
  reg         errReg;	// BlockRam.scala:73:23
  wire [31:0] _GEN = io_req_bits_addrRequest / 32'h4;	// BlockRam.scala:79:65
  wire        _T_2 = io_req_valid & ~io_req_bits_isWrite;	// BlockRam.scala:88:{22,25}
  wire        _T_4 = io_req_valid & io_req_bits_isWrite;	// BlockRam.scala:92:29
  always @(posedge clock) begin
    if (reset) begin
      validReg <= 1'h0;	// BlockRam.scala:72:25
      errReg <= 1'h0;	// BlockRam.scala:73:23
    end
    else begin
      validReg <= _T_2 | _T_4;	// BlockRam.scala:72:25, :88:{22,47}, :91:14, :92:{29,53}
      errReg <= io_req_valid & |(io_req_bits_addrRequest[1:0]) | io_req_valid & _GEN > 32'h3FE;	// BlockRam.scala:73:23, :78:{24,63,72}, :79:{25,65,71}, :81:28
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif
    initial begin
      automatic logic [31:0] _RANDOM_0;
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        validReg = _RANDOM_0[0];	// BlockRam.scala:72:25
        errReg = _RANDOM_0[1];	// BlockRam.scala:72:25, :73:23
      `endif
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif
  `endif
  mem_combMem mem_ext (	// BlockRam.scala:82:24
    .R0_addr (_GEN[9:0]),	// BlockRam.scala:79:65, :90:41
    .R0_en   (_T_2),	// BlockRam.scala:88:22
    .R0_clk  (clock),
    .W0_addr (_GEN[9:0]),	// BlockRam.scala:79:65
    .W0_en   (~_T_2 & _T_4),	// BlockRam.scala:82:24, :88:{22,47}, :92:{29,53}
    .W0_clk  (clock),
    .W0_data (32'h0),
    .R0_data (_mem_ext_R0_data)
  );
  assign io_rsp_valid = validReg;	// BlockRam.scala:72:25
  assign io_rsp_bits_dataResponse = _T_2 ? _mem_ext_R0_data : 32'h0;	// BlockRam.scala:82:24, :88:{22,47}, :90:30, :92:53
  assign io_rsp_bits_error = errReg;	// BlockRam.scala:73:23
endmodule

module BlockRamWithMasking(
  input         clock,
                reset,
                io_req_valid,
  input  [31:0] io_req_bits_addrRequest,
                io_req_bits_dataRequest,
  input  [3:0]  io_req_bits_activeByteLane,
  input         io_req_bits_isWrite,
  output        io_rsp_valid,
  output [31:0] io_rsp_bits_dataResponse);

  wire        _GEN;	// BlockRam.scala:141:24, :143:47, :147:53
  wire [7:0]  _mem_3_ext_R0_data;	// BlockRam.scala:141:24
  wire [7:0]  _mem_2_ext_R0_data;	// BlockRam.scala:141:24
  wire [7:0]  _mem_1_ext_R0_data;	// BlockRam.scala:141:24
  wire [7:0]  _mem_0_ext_R0_data;	// BlockRam.scala:141:24
  reg         validReg;	// BlockRam.scala:136:25
  wire        _T_2 = io_req_valid & ~io_req_bits_isWrite;	// BlockRam.scala:143:{22,25}
  wire [31:0] _GEN_0 = io_req_bits_addrRequest / 32'h4;	// BlockRam.scala:145:46
  wire        _T_7 = io_req_valid & io_req_bits_isWrite;	// BlockRam.scala:147:29
  assign _GEN = ~_T_2 & _T_7;	// BlockRam.scala:141:24, :143:{22,47}, :147:{29,53}
  always @(posedge clock) begin
    if (reset)
      validReg <= 1'h0;	// BlockRam.scala:136:25
    else
      validReg <= _T_2 | _T_7;	// BlockRam.scala:136:25, :143:{22,47}, :146:14, :147:{29,53}
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif
    initial begin
      automatic logic [31:0] _RANDOM_0;
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        validReg = _RANDOM_0[0];	// BlockRam.scala:136:25
      `endif
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif
  `endif
  mem_0_combMem mem_0_ext (	// BlockRam.scala:141:24
    .R0_addr (_GEN_0[9:0]),	// BlockRam.scala:145:{22,46}
    .R0_en   (_T_2),	// BlockRam.scala:143:22
    .R0_clk  (clock),
    .W0_addr (_GEN_0[9:0]),	// BlockRam.scala:145:46
    .W0_en   (_GEN & io_req_bits_activeByteLane[0]),	// BlockRam.scala:128:52, :141:24, :143:47, :147:53
    .W0_clk  (clock),
    .W0_data (io_req_bits_dataRequest[7:0]),	// BlockRam.scala:121:38
    .R0_data (_mem_0_ext_R0_data)
  );
  mem_0_combMem mem_1_ext (	// BlockRam.scala:141:24
    .R0_addr (_GEN_0[9:0]),	// BlockRam.scala:145:{22,46}
    .R0_en   (_T_2),	// BlockRam.scala:143:22
    .R0_clk  (clock),
    .W0_addr (_GEN_0[9:0]),	// BlockRam.scala:145:46
    .W0_en   (_GEN & io_req_bits_activeByteLane[1]),	// BlockRam.scala:128:52, :141:24, :143:47, :147:53
    .W0_clk  (clock),
    .W0_data (io_req_bits_dataRequest[15:8]),	// BlockRam.scala:122:38
    .R0_data (_mem_1_ext_R0_data)
  );
  mem_0_combMem mem_2_ext (	// BlockRam.scala:141:24
    .R0_addr (_GEN_0[9:0]),	// BlockRam.scala:145:{22,46}
    .R0_en   (_T_2),	// BlockRam.scala:143:22
    .R0_clk  (clock),
    .W0_addr (_GEN_0[9:0]),	// BlockRam.scala:145:46
    .W0_en   (_GEN & io_req_bits_activeByteLane[2]),	// BlockRam.scala:128:52, :141:24, :143:47, :147:53
    .W0_clk  (clock),
    .W0_data (io_req_bits_dataRequest[23:16]),	// BlockRam.scala:123:38
    .R0_data (_mem_2_ext_R0_data)
  );
  mem_0_combMem mem_3_ext (	// BlockRam.scala:141:24
    .R0_addr (_GEN_0[9:0]),	// BlockRam.scala:145:{22,46}
    .R0_en   (_T_2),	// BlockRam.scala:143:22
    .R0_clk  (clock),
    .W0_addr (_GEN_0[9:0]),	// BlockRam.scala:145:46
    .W0_en   (_GEN & io_req_bits_activeByteLane[3]),	// BlockRam.scala:128:52, :141:24, :143:47, :147:53
    .W0_clk  (clock),
    .W0_data (io_req_bits_dataRequest[31:24]),	// BlockRam.scala:124:38
    .R0_data (_mem_3_ext_R0_data)
  );
  assign io_rsp_valid = validReg;	// BlockRam.scala:136:25
  assign io_rsp_bits_dataResponse = {io_req_bits_activeByteLane[3] & _T_2 ? _mem_3_ext_R0_data : 8'h0,
                io_req_bits_activeByteLane[2] & _T_2 ? _mem_2_ext_R0_data : 8'h0,
                io_req_bits_activeByteLane[1] & _T_2 ? _mem_1_ext_R0_data : 8'h0,
                io_req_bits_activeByteLane[0] & _T_2 ? _mem_0_ext_R0_data : 8'h0};	// BlockRam.scala:128:52, :141:24, :143:22, :147:53, :151:18, :154:18, :160:8, Cat.scala:31:58
endmodule

// external module BlackBoxIbexCore

module IbexJigsaw(
  input  clock,
         reset,
  output io_pin);

  wire        _ibex_instr_req_o;	// IbexJigsaw.scala:33:22
  wire [31:0] _ibex_instr_addr_o;	// IbexJigsaw.scala:33:22
  wire        _ibex_data_req_o;	// IbexJigsaw.scala:33:22
  wire        _ibex_data_we_o;	// IbexJigsaw.scala:33:22
  wire [3:0]  _ibex_data_be_o;	// IbexJigsaw.scala:33:22
  wire [31:0] _ibex_data_addr_o;	// IbexJigsaw.scala:33:22
  wire [31:0] _ibex_data_wdata_o;	// IbexJigsaw.scala:33:22
  wire        _ibex_alert_minor_o;	// IbexJigsaw.scala:33:22
  wire        _ibex_alert_major_o;	// IbexJigsaw.scala:33:22
  wire        _data_mem_io_rsp_valid;	// IbexJigsaw.scala:23:27
  wire [31:0] _data_mem_io_rsp_bits_dataResponse;	// IbexJigsaw.scala:23:27
  wire        _instr_mem_io_rsp_valid;	// IbexJigsaw.scala:22:27
  wire [31:0] _instr_mem_io_rsp_bits_dataResponse;	// IbexJigsaw.scala:22:27
  wire        _instr_mem_io_rsp_bits_error;	// IbexJigsaw.scala:22:27
  wire        _data_adapter_io_reqIn_ready;	// IbexJigsaw.scala:20:30
  wire        _data_adapter_io_rspOut_valid;	// IbexJigsaw.scala:20:30
  wire [31:0] _data_adapter_io_rspOut_bits_dataResponse;	// IbexJigsaw.scala:20:30
  wire        _data_adapter_io_reqOut_valid;	// IbexJigsaw.scala:20:30
  wire [31:0] _data_adapter_io_reqOut_bits_addrRequest;	// IbexJigsaw.scala:20:30
  wire [31:0] _data_adapter_io_reqOut_bits_dataRequest;	// IbexJigsaw.scala:20:30
  wire [3:0]  _data_adapter_io_reqOut_bits_activeByteLane;	// IbexJigsaw.scala:20:30
  wire        _data_adapter_io_reqOut_bits_isWrite;	// IbexJigsaw.scala:20:30
  wire        _instr_adapter_io_reqIn_ready;	// IbexJigsaw.scala:19:31
  wire        _instr_adapter_io_rspOut_valid;	// IbexJigsaw.scala:19:31
  wire [31:0] _instr_adapter_io_rspOut_bits_dataResponse;	// IbexJigsaw.scala:19:31
  wire        _instr_adapter_io_rspOut_bits_error;	// IbexJigsaw.scala:19:31
  wire        _instr_adapter_io_reqOut_valid;	// IbexJigsaw.scala:19:31
  wire [31:0] _instr_adapter_io_reqOut_bits_addrRequest;	// IbexJigsaw.scala:19:31
  wire        _instr_adapter_io_reqOut_bits_isWrite;	// IbexJigsaw.scala:19:31
  TilelinkAdapter instr_adapter (	// IbexJigsaw.scala:19:31
    .clock                       (clock),
    .reset                       (reset),
    .io_reqIn_valid              (_ibex_instr_req_o),	// IbexJigsaw.scala:33:22
    .io_reqIn_bits_addrRequest   ({2'h0, _ibex_instr_addr_o[31:2]}),	// IbexJigsaw.scala:33:22, :45:{45,68}
    .io_rspIn_valid              (_instr_mem_io_rsp_valid),	// IbexJigsaw.scala:22:27
    .io_rspIn_bits_dataResponse  (_instr_mem_io_rsp_bits_dataResponse),	// IbexJigsaw.scala:22:27
    .io_rspIn_bits_error         (_instr_mem_io_rsp_bits_error),	// IbexJigsaw.scala:22:27
    .io_reqIn_ready              (_instr_adapter_io_reqIn_ready),
    .io_rspOut_valid             (_instr_adapter_io_rspOut_valid),
    .io_rspOut_bits_dataResponse (_instr_adapter_io_rspOut_bits_dataResponse),
    .io_rspOut_bits_error        (_instr_adapter_io_rspOut_bits_error),
    .io_reqOut_valid             (_instr_adapter_io_reqOut_valid),
    .io_reqOut_bits_addrRequest  (_instr_adapter_io_reqOut_bits_addrRequest),
    .io_reqOut_bits_isWrite      (_instr_adapter_io_reqOut_bits_isWrite)
  );
  TilelinkAdapter_1 data_adapter (	// IbexJigsaw.scala:20:30
    .clock                         (clock),
    .reset                         (reset),
    .io_reqIn_valid                (_ibex_data_req_o),	// IbexJigsaw.scala:33:22
    .io_reqIn_bits_addrRequest     (_ibex_data_addr_o),	// IbexJigsaw.scala:33:22
    .io_reqIn_bits_dataRequest     (_ibex_data_wdata_o),	// IbexJigsaw.scala:33:22
    .io_reqIn_bits_activeByteLane  (_ibex_data_be_o),	// IbexJigsaw.scala:33:22
    .io_reqIn_bits_isWrite         (_ibex_data_we_o),	// IbexJigsaw.scala:33:22
    .io_rspIn_valid                (_data_mem_io_rsp_valid),	// IbexJigsaw.scala:23:27
    .io_rspIn_bits_dataResponse    (_data_mem_io_rsp_bits_dataResponse),	// IbexJigsaw.scala:23:27
    .io_reqIn_ready                (_data_adapter_io_reqIn_ready),
    .io_rspOut_valid               (_data_adapter_io_rspOut_valid),
    .io_rspOut_bits_dataResponse   (_data_adapter_io_rspOut_bits_dataResponse),
    .io_reqOut_valid               (_data_adapter_io_reqOut_valid),
    .io_reqOut_bits_addrRequest    (_data_adapter_io_reqOut_bits_addrRequest),
    .io_reqOut_bits_dataRequest    (_data_adapter_io_reqOut_bits_dataRequest),
    .io_reqOut_bits_activeByteLane (_data_adapter_io_reqOut_bits_activeByteLane),
    .io_reqOut_bits_isWrite        (_data_adapter_io_reqOut_bits_isWrite)
  );
  BlockRamWithoutMasking instr_mem (	// IbexJigsaw.scala:22:27
    .clock                    (clock),
    .reset                    (reset),
    .io_req_valid             (_instr_adapter_io_reqOut_valid),	// IbexJigsaw.scala:19:31
    .io_req_bits_addrRequest  (_instr_adapter_io_reqOut_bits_addrRequest),	// IbexJigsaw.scala:19:31
    .io_req_bits_isWrite      (_instr_adapter_io_reqOut_bits_isWrite),	// IbexJigsaw.scala:19:31
    .io_rsp_valid             (_instr_mem_io_rsp_valid),
    .io_rsp_bits_dataResponse (_instr_mem_io_rsp_bits_dataResponse),
    .io_rsp_bits_error        (_instr_mem_io_rsp_bits_error)
  );
  BlockRamWithMasking data_mem (	// IbexJigsaw.scala:23:27
    .clock                      (clock),
    .reset                      (reset),
    .io_req_valid               (_data_adapter_io_reqOut_valid),	// IbexJigsaw.scala:20:30
    .io_req_bits_addrRequest    (_data_adapter_io_reqOut_bits_addrRequest),	// IbexJigsaw.scala:20:30
    .io_req_bits_dataRequest    (_data_adapter_io_reqOut_bits_dataRequest),	// IbexJigsaw.scala:20:30
    .io_req_bits_activeByteLane (_data_adapter_io_reqOut_bits_activeByteLane),	// IbexJigsaw.scala:20:30
    .io_req_bits_isWrite        (_data_adapter_io_reqOut_bits_isWrite),	// IbexJigsaw.scala:20:30
    .io_rsp_valid               (_data_mem_io_rsp_valid),
    .io_rsp_bits_dataResponse   (_data_mem_io_rsp_bits_dataResponse)
  );
  BlackBoxIbexCore #(
    .PMP_ENABLE(0),
    .DBG_HW_BREAK_NUM(1),
    .PMP_NUM_REGIONS(4),
    .WB_STAGE(0),
    .RV32E(0),
    .MHPM_COUNTER_NUM(0),
    .RV32B("ibex_pkg::RV32BNone"),
    .REGFILE("ibex_pkg::RegFileFF"),
    .BRANCH_TARGET_ALU(0),
    .MHPM_COUNTER_WIDTH(0),
    .DM_EXCEPTION_ADDR(437323784),
    .BRANCH_PREDICTOR(0),
    .DM_HALT_ADDR(437323776),
    .PMP_GRANULARITY(0),
    .RV32M("ibex_pkg::RV32MFast")
  ) ibex (	// IbexJigsaw.scala:33:22
    .clk_i          (clock),
    .rst_ni         (~reset),	// IbexJigsaw.scala:39:23
    .test_en_i      (1'h1),	// IbexJigsaw.scala:33:22
    .hart_id_i      (32'hF14),	// IbexJigsaw.scala:41:23
    .instr_gnt_i    (_instr_adapter_io_reqIn_ready),	// IbexJigsaw.scala:19:31
    .instr_rvalid_i (_instr_adapter_io_rspOut_valid),	// IbexJigsaw.scala:19:31
    .instr_rdata_i  (_instr_adapter_io_rspOut_bits_dataResponse),	// IbexJigsaw.scala:19:31
    .instr_err_i    (_instr_adapter_io_rspOut_bits_error),	// IbexJigsaw.scala:19:31
    .data_gnt_i     (_data_adapter_io_reqIn_ready),	// IbexJigsaw.scala:20:30
    .data_rvalid_i  (_data_adapter_io_rspOut_valid),	// IbexJigsaw.scala:20:30
    .data_rdata_i   (_data_adapter_io_rspOut_bits_dataResponse),	// IbexJigsaw.scala:20:30
    .data_err_i     (1'h0),	// IbexJigsaw.scala:33:22
    .irq_software_i (1'h0),	// IbexJigsaw.scala:33:22
    .irq_timer_i    (1'h0),	// IbexJigsaw.scala:33:22
    .irq_external_i (1'h0),	// IbexJigsaw.scala:33:22
    .irq_fast_i     (15'h0),	// IbexJigsaw.scala:75:24
    .irq_nm_i       (1'h0),	// IbexJigsaw.scala:33:22
    .debug_req_i    (1'h0),	// IbexJigsaw.scala:33:22
    .fetch_enable_i (1'h1),	// IbexJigsaw.scala:33:22
    .scan_rst_ni    (1'h1),	// IbexJigsaw.scala:33:22
    .instr_req_o    (_ibex_instr_req_o),
    .instr_addr_o   (_ibex_instr_addr_o),
    .data_req_o     (_ibex_data_req_o),
    .data_we_o      (_ibex_data_we_o),
    .data_be_o      (_ibex_data_be_o),
    .data_addr_o    (_ibex_data_addr_o),
    .data_wdata_o   (_ibex_data_wdata_o),
    .alert_minor_o  (_ibex_alert_minor_o),
    .alert_major_o  (_ibex_alert_major_o),
    .core_sleep_o   (io_pin)
  );
endmodule

