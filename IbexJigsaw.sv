module TilelinkHost(
  input         clock,
  input         reset,
  output        io_tlMasterTransmitter_valid,
  output [2:0]  io_tlMasterTransmitter_bits_a_opcode,
  output [31:0] io_tlMasterTransmitter_bits_a_address,
  output [3:0]  io_tlMasterTransmitter_bits_a_mask,
  output [31:0] io_tlMasterTransmitter_bits_a_data,
  input         io_tlSlaveReceiver_valid,
  input         io_tlSlaveReceiver_bits_d_denied,
  input  [31:0] io_tlSlaveReceiver_bits_d_data,
  output        io_reqIn_ready,
  input         io_reqIn_valid,
  input  [31:0] io_reqIn_bits_addrRequest,
  input  [31:0] io_reqIn_bits_dataRequest,
  input  [3:0]  io_reqIn_bits_activeByteLane,
  input         io_reqIn_bits_isWrite,
  output        io_rspOut_valid,
  output [31:0] io_rspOut_bits_dataResponse,
  output        io_rspOut_bits_error
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[TilelinkHost.scala 19:27]
  reg [31:0] addrReg; // @[TilelinkHost.scala 20:27]
  wire  _io_tlMasterTransmitter_bits_a_opcode_T_1 = io_reqIn_bits_activeByteLane == 4'hf ? 1'h0 : 1'h1; // @[TilelinkHost.scala 62:86]
  wire [2:0] _io_tlMasterTransmitter_bits_a_opcode_T_2 = io_reqIn_bits_isWrite ? {{2'd0},
    _io_tlMasterTransmitter_bits_a_opcode_T_1} : 3'h4; // @[TilelinkHost.scala 62:59]
  wire [2:0] _GEN_0 = io_reqIn_valid ? _io_tlMasterTransmitter_bits_a_opcode_T_2 : 3'h0; // @[TilelinkHost.scala 60:29 40:45 62:53]
  wire [31:0] _GEN_1 = io_reqIn_valid ? io_reqIn_bits_dataRequest : 32'h0; // @[TilelinkHost.scala 60:29 41:45 63:53]
  wire [31:0] _GEN_2 = io_reqIn_valid ? io_reqIn_bits_addrRequest : addrReg; // @[TilelinkHost.scala 60:29 42:45 64:53]
  wire [3:0] _GEN_6 = io_reqIn_valid ? io_reqIn_bits_activeByteLane : 4'h0; // @[TilelinkHost.scala 60:29 46:45 73:53]
  wire  _GEN_8 = io_reqIn_valid | stateReg; // @[TilelinkHost.scala 60:29 77:22 19:27]
  wire [31:0] _GEN_10 = io_tlSlaveReceiver_valid ? io_tlSlaveReceiver_bits_d_data : 32'h0; // @[TilelinkHost.scala 89:39 91:41 50:45]
  wire  _GEN_11 = io_tlSlaveReceiver_valid & io_tlSlaveReceiver_bits_d_denied; // @[TilelinkHost.scala 89:39 92:34 51:45]
  wire  _GEN_15 = stateReg ? 1'h0 : 1'h1; // @[TilelinkHost.scala 33:33 84:43 87:34]
  wire [31:0] _GEN_16 = stateReg ? _GEN_10 : 32'h0; // @[TilelinkHost.scala 84:43 50:45]
  wire  _GEN_17 = stateReg & _GEN_11; // @[TilelinkHost.scala 84:43 51:45]
  wire  _GEN_18 = stateReg & io_tlSlaveReceiver_valid; // @[TilelinkHost.scala 84:43 53:45]
  assign io_tlMasterTransmitter_valid = ~stateReg & io_reqIn_valid; // @[TilelinkHost.scala 56:28 48:45]
  assign io_tlMasterTransmitter_bits_a_opcode = ~stateReg ? _GEN_0 : 3'h0; // @[TilelinkHost.scala 56:28 40:45]
  assign io_tlMasterTransmitter_bits_a_address = ~stateReg ? _GEN_2 : addrReg; // @[TilelinkHost.scala 56:28 42:45]
  assign io_tlMasterTransmitter_bits_a_mask = ~stateReg ? _GEN_6 : 4'h0; // @[TilelinkHost.scala 56:28 46:45]
  assign io_tlMasterTransmitter_bits_a_data = ~stateReg ? _GEN_1 : 32'h0; // @[TilelinkHost.scala 56:28 41:45]
  assign io_reqIn_ready = ~stateReg | _GEN_15; // @[TilelinkHost.scala 56:28 33:33]
  assign io_rspOut_valid = ~stateReg ? 1'h0 : _GEN_18; // @[TilelinkHost.scala 56:28 53:45]
  assign io_rspOut_bits_dataResponse = ~stateReg ? 32'h0 : _GEN_16; // @[TilelinkHost.scala 56:28 50:45]
  assign io_rspOut_bits_error = ~stateReg ? 1'h0 : _GEN_17; // @[TilelinkHost.scala 56:28 51:45]
  always @(posedge clock) begin
    if (reset) begin // @[TilelinkHost.scala 19:27]
      stateReg <= 1'h0; // @[TilelinkHost.scala 19:27]
    end else if (~stateReg) begin // @[TilelinkHost.scala 56:28]
      stateReg <= _GEN_8;
    end else if (stateReg) begin // @[TilelinkHost.scala 84:43]
      if (io_tlSlaveReceiver_valid) begin // @[TilelinkHost.scala 89:39]
        stateReg <= 1'h0; // @[TilelinkHost.scala 95:22]
      end
    end
    if (reset) begin // @[TilelinkHost.scala 20:27]
      addrReg <= 32'h0; // @[TilelinkHost.scala 20:27]
    end else if (~stateReg) begin // @[TilelinkHost.scala 56:28]
      if (io_reqIn_valid) begin // @[TilelinkHost.scala 60:29]
        addrReg <= io_reqIn_bits_addrRequest; // @[TilelinkHost.scala 64:53]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  addrReg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TilelinkDevice(
  input         clock,
  input         reset,
  output        io_tlSlaveTransmitter_valid,
  output        io_tlSlaveTransmitter_bits_d_denied,
  output [31:0] io_tlSlaveTransmitter_bits_d_data,
  input         io_tlMasterReceiver_valid,
  input  [2:0]  io_tlMasterReceiver_bits_a_opcode,
  input  [31:0] io_tlMasterReceiver_bits_a_address,
  input  [3:0]  io_tlMasterReceiver_bits_a_mask,
  input  [31:0] io_tlMasterReceiver_bits_a_data,
  output        io_reqOut_valid,
  output [31:0] io_reqOut_bits_addrRequest,
  output [31:0] io_reqOut_bits_dataRequest,
  output [3:0]  io_reqOut_bits_activeByteLane,
  output        io_reqOut_bits_isWrite,
  input         io_rspIn_valid,
  input  [31:0] io_rspIn_bits_dataResponse,
  input         io_rspIn_bits_error
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[TilelinkDevice.scala 17:27]
  wire [31:0] _GEN_0 = io_tlMasterReceiver_valid ? io_tlMasterReceiver_bits_a_address : 32'h0; // @[TilelinkDevice.scala 23:37 43:40 45:40]
  wire [31:0] _GEN_1 = io_tlMasterReceiver_valid ? io_tlMasterReceiver_bits_a_data : 32'h0; // @[TilelinkDevice.scala 24:37 43:40 46:40]
  wire [3:0] _GEN_2 = io_tlMasterReceiver_valid ? io_tlMasterReceiver_bits_a_mask : 4'h0; // @[TilelinkDevice.scala 25:37 43:40 47:43]
  wire  _GEN_3 = io_tlMasterReceiver_valid & (io_tlMasterReceiver_bits_a_opcode == 3'h0 |
    io_tlMasterReceiver_bits_a_opcode == 3'h1); // @[TilelinkDevice.scala 43:40 48:36 26:37]
  wire  _GEN_5 = io_tlMasterReceiver_valid | stateReg; // @[TilelinkDevice.scala 43:40 51:22 17:27]
  wire [31:0] _GEN_7 = io_rspIn_valid ? io_rspIn_bits_dataResponse : 32'h0; // @[TilelinkDevice.scala 60:29 30:45 63:47]
  wire  _GEN_11 = io_rspIn_valid & io_rspIn_bits_error; // @[TilelinkDevice.scala 60:29 35:45 68:49]
  wire  _GEN_15 = stateReg & io_rspIn_valid; // @[TilelinkDevice.scala 56:43 29:45]
  wire [31:0] _GEN_16 = stateReg ? _GEN_7 : 32'h0; // @[TilelinkDevice.scala 56:43 30:45]
  wire  _GEN_20 = stateReg & _GEN_11; // @[TilelinkDevice.scala 56:43 35:45]
  assign io_tlSlaveTransmitter_valid = ~stateReg ? 1'h0 : _GEN_15; // @[TilelinkDevice.scala 41:28 37:45]
  assign io_tlSlaveTransmitter_bits_d_denied = ~stateReg ? 1'h0 : _GEN_20; // @[TilelinkDevice.scala 41:28 35:45]
  assign io_tlSlaveTransmitter_bits_d_data = ~stateReg ? 32'h0 : _GEN_16; // @[TilelinkDevice.scala 41:28 30:45]
  assign io_reqOut_valid = ~stateReg & io_tlMasterReceiver_valid; // @[TilelinkDevice.scala 41:28 27:37]
  assign io_reqOut_bits_addrRequest = ~stateReg ? _GEN_0 : 32'h0; // @[TilelinkDevice.scala 41:28 23:37]
  assign io_reqOut_bits_dataRequest = ~stateReg ? _GEN_1 : 32'h0; // @[TilelinkDevice.scala 41:28 24:37]
  assign io_reqOut_bits_activeByteLane = ~stateReg ? _GEN_2 : 4'h0; // @[TilelinkDevice.scala 41:28 25:37]
  assign io_reqOut_bits_isWrite = ~stateReg & _GEN_3; // @[TilelinkDevice.scala 41:28 26:37]
  always @(posedge clock) begin
    if (reset) begin // @[TilelinkDevice.scala 17:27]
      stateReg <= 1'h0; // @[TilelinkDevice.scala 17:27]
    end else if (~stateReg) begin // @[TilelinkDevice.scala 41:28]
      stateReg <= _GEN_5;
    end else if (stateReg) begin // @[TilelinkDevice.scala 56:43]
      if (io_rspIn_valid) begin // @[TilelinkDevice.scala 60:29]
        stateReg <= 1'h0; // @[TilelinkDevice.scala 72:22]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TilelinkAdapter(
  input         clock,
  input         reset,
  output        io_reqIn_ready,
  input         io_reqIn_valid,
  input  [31:0] io_reqIn_bits_addrRequest,
  input  [31:0] io_reqIn_bits_dataRequest,
  input  [3:0]  io_reqIn_bits_activeByteLane,
  input         io_reqIn_bits_isWrite,
  output        io_rspOut_valid,
  output [31:0] io_rspOut_bits_dataResponse,
  output        io_rspOut_bits_error,
  output        io_reqOut_valid,
  output [31:0] io_reqOut_bits_addrRequest,
  output [31:0] io_reqOut_bits_dataRequest,
  output [3:0]  io_reqOut_bits_activeByteLane,
  output        io_reqOut_bits_isWrite,
  input         io_rspIn_valid,
  input  [31:0] io_rspIn_bits_dataResponse,
  input         io_rspIn_bits_error
);
  wire  tlHost_clock; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_reset; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_io_tlMasterTransmitter_valid; // @[TilelinkAdapter.scala 18:24]
  wire [2:0] tlHost_io_tlMasterTransmitter_bits_a_opcode; // @[TilelinkAdapter.scala 18:24]
  wire [31:0] tlHost_io_tlMasterTransmitter_bits_a_address; // @[TilelinkAdapter.scala 18:24]
  wire [3:0] tlHost_io_tlMasterTransmitter_bits_a_mask; // @[TilelinkAdapter.scala 18:24]
  wire [31:0] tlHost_io_tlMasterTransmitter_bits_a_data; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_io_tlSlaveReceiver_valid; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_io_tlSlaveReceiver_bits_d_denied; // @[TilelinkAdapter.scala 18:24]
  wire [31:0] tlHost_io_tlSlaveReceiver_bits_d_data; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_io_reqIn_ready; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_io_reqIn_valid; // @[TilelinkAdapter.scala 18:24]
  wire [31:0] tlHost_io_reqIn_bits_addrRequest; // @[TilelinkAdapter.scala 18:24]
  wire [31:0] tlHost_io_reqIn_bits_dataRequest; // @[TilelinkAdapter.scala 18:24]
  wire [3:0] tlHost_io_reqIn_bits_activeByteLane; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_io_reqIn_bits_isWrite; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_io_rspOut_valid; // @[TilelinkAdapter.scala 18:24]
  wire [31:0] tlHost_io_rspOut_bits_dataResponse; // @[TilelinkAdapter.scala 18:24]
  wire  tlHost_io_rspOut_bits_error; // @[TilelinkAdapter.scala 18:24]
  wire  tlSlave_clock; // @[TilelinkAdapter.scala 19:25]
  wire  tlSlave_reset; // @[TilelinkAdapter.scala 19:25]
  wire  tlSlave_io_tlSlaveTransmitter_valid; // @[TilelinkAdapter.scala 19:25]
  wire  tlSlave_io_tlSlaveTransmitter_bits_d_denied; // @[TilelinkAdapter.scala 19:25]
  wire [31:0] tlSlave_io_tlSlaveTransmitter_bits_d_data; // @[TilelinkAdapter.scala 19:25]
  wire  tlSlave_io_tlMasterReceiver_valid; // @[TilelinkAdapter.scala 19:25]
  wire [2:0] tlSlave_io_tlMasterReceiver_bits_a_opcode; // @[TilelinkAdapter.scala 19:25]
  wire [31:0] tlSlave_io_tlMasterReceiver_bits_a_address; // @[TilelinkAdapter.scala 19:25]
  wire [3:0] tlSlave_io_tlMasterReceiver_bits_a_mask; // @[TilelinkAdapter.scala 19:25]
  wire [31:0] tlSlave_io_tlMasterReceiver_bits_a_data; // @[TilelinkAdapter.scala 19:25]
  wire  tlSlave_io_reqOut_valid; // @[TilelinkAdapter.scala 19:25]
  wire [31:0] tlSlave_io_reqOut_bits_addrRequest; // @[TilelinkAdapter.scala 19:25]
  wire [31:0] tlSlave_io_reqOut_bits_dataRequest; // @[TilelinkAdapter.scala 19:25]
  wire [3:0] tlSlave_io_reqOut_bits_activeByteLane; // @[TilelinkAdapter.scala 19:25]
  wire  tlSlave_io_reqOut_bits_isWrite; // @[TilelinkAdapter.scala 19:25]
  wire  tlSlave_io_rspIn_valid; // @[TilelinkAdapter.scala 19:25]
  wire [31:0] tlSlave_io_rspIn_bits_dataResponse; // @[TilelinkAdapter.scala 19:25]
  wire  tlSlave_io_rspIn_bits_error; // @[TilelinkAdapter.scala 19:25]
  TilelinkHost tlHost ( // @[TilelinkAdapter.scala 18:24]
    .clock(tlHost_clock),
    .reset(tlHost_reset),
    .io_tlMasterTransmitter_valid(tlHost_io_tlMasterTransmitter_valid),
    .io_tlMasterTransmitter_bits_a_opcode(tlHost_io_tlMasterTransmitter_bits_a_opcode),
    .io_tlMasterTransmitter_bits_a_address(tlHost_io_tlMasterTransmitter_bits_a_address),
    .io_tlMasterTransmitter_bits_a_mask(tlHost_io_tlMasterTransmitter_bits_a_mask),
    .io_tlMasterTransmitter_bits_a_data(tlHost_io_tlMasterTransmitter_bits_a_data),
    .io_tlSlaveReceiver_valid(tlHost_io_tlSlaveReceiver_valid),
    .io_tlSlaveReceiver_bits_d_denied(tlHost_io_tlSlaveReceiver_bits_d_denied),
    .io_tlSlaveReceiver_bits_d_data(tlHost_io_tlSlaveReceiver_bits_d_data),
    .io_reqIn_ready(tlHost_io_reqIn_ready),
    .io_reqIn_valid(tlHost_io_reqIn_valid),
    .io_reqIn_bits_addrRequest(tlHost_io_reqIn_bits_addrRequest),
    .io_reqIn_bits_dataRequest(tlHost_io_reqIn_bits_dataRequest),
    .io_reqIn_bits_activeByteLane(tlHost_io_reqIn_bits_activeByteLane),
    .io_reqIn_bits_isWrite(tlHost_io_reqIn_bits_isWrite),
    .io_rspOut_valid(tlHost_io_rspOut_valid),
    .io_rspOut_bits_dataResponse(tlHost_io_rspOut_bits_dataResponse),
    .io_rspOut_bits_error(tlHost_io_rspOut_bits_error)
  );
  TilelinkDevice tlSlave ( // @[TilelinkAdapter.scala 19:25]
    .clock(tlSlave_clock),
    .reset(tlSlave_reset),
    .io_tlSlaveTransmitter_valid(tlSlave_io_tlSlaveTransmitter_valid),
    .io_tlSlaveTransmitter_bits_d_denied(tlSlave_io_tlSlaveTransmitter_bits_d_denied),
    .io_tlSlaveTransmitter_bits_d_data(tlSlave_io_tlSlaveTransmitter_bits_d_data),
    .io_tlMasterReceiver_valid(tlSlave_io_tlMasterReceiver_valid),
    .io_tlMasterReceiver_bits_a_opcode(tlSlave_io_tlMasterReceiver_bits_a_opcode),
    .io_tlMasterReceiver_bits_a_address(tlSlave_io_tlMasterReceiver_bits_a_address),
    .io_tlMasterReceiver_bits_a_mask(tlSlave_io_tlMasterReceiver_bits_a_mask),
    .io_tlMasterReceiver_bits_a_data(tlSlave_io_tlMasterReceiver_bits_a_data),
    .io_reqOut_valid(tlSlave_io_reqOut_valid),
    .io_reqOut_bits_addrRequest(tlSlave_io_reqOut_bits_addrRequest),
    .io_reqOut_bits_dataRequest(tlSlave_io_reqOut_bits_dataRequest),
    .io_reqOut_bits_activeByteLane(tlSlave_io_reqOut_bits_activeByteLane),
    .io_reqOut_bits_isWrite(tlSlave_io_reqOut_bits_isWrite),
    .io_rspIn_valid(tlSlave_io_rspIn_valid),
    .io_rspIn_bits_dataResponse(tlSlave_io_rspIn_bits_dataResponse),
    .io_rspIn_bits_error(tlSlave_io_rspIn_bits_error)
  );
  assign io_reqIn_ready = tlHost_io_reqIn_ready; // @[TilelinkAdapter.scala 28:21]
  assign io_rspOut_valid = tlHost_io_rspOut_valid; // @[TilelinkAdapter.scala 31:15]
  assign io_rspOut_bits_dataResponse = tlHost_io_rspOut_bits_dataResponse; // @[TilelinkAdapter.scala 31:15]
  assign io_rspOut_bits_error = tlHost_io_rspOut_bits_error; // @[TilelinkAdapter.scala 31:15]
  assign io_reqOut_valid = tlSlave_io_reqOut_valid; // @[TilelinkAdapter.scala 34:15]
  assign io_reqOut_bits_addrRequest = tlSlave_io_reqOut_bits_addrRequest; // @[TilelinkAdapter.scala 34:15]
  assign io_reqOut_bits_dataRequest = tlSlave_io_reqOut_bits_dataRequest; // @[TilelinkAdapter.scala 34:15]
  assign io_reqOut_bits_activeByteLane = tlSlave_io_reqOut_bits_activeByteLane; // @[TilelinkAdapter.scala 34:15]
  assign io_reqOut_bits_isWrite = tlSlave_io_reqOut_bits_isWrite; // @[TilelinkAdapter.scala 34:15]
  assign tlHost_clock = clock;
  assign tlHost_reset = reset;
  assign tlHost_io_tlSlaveReceiver_valid = tlSlave_io_tlSlaveTransmitter_valid; // @[TilelinkAdapter.scala 25:35]
  assign tlHost_io_tlSlaveReceiver_bits_d_denied = tlSlave_io_tlSlaveTransmitter_bits_d_denied; // @[TilelinkAdapter.scala 25:35]
  assign tlHost_io_tlSlaveReceiver_bits_d_data = tlSlave_io_tlSlaveTransmitter_bits_d_data; // @[TilelinkAdapter.scala 25:35]
  assign tlHost_io_reqIn_valid = io_reqIn_valid; // @[TilelinkAdapter.scala 28:21]
  assign tlHost_io_reqIn_bits_addrRequest = io_reqIn_bits_addrRequest; // @[TilelinkAdapter.scala 28:21]
  assign tlHost_io_reqIn_bits_dataRequest = io_reqIn_bits_dataRequest; // @[TilelinkAdapter.scala 28:21]
  assign tlHost_io_reqIn_bits_activeByteLane = io_reqIn_bits_activeByteLane; // @[TilelinkAdapter.scala 28:21]
  assign tlHost_io_reqIn_bits_isWrite = io_reqIn_bits_isWrite; // @[TilelinkAdapter.scala 28:21]
  assign tlSlave_clock = clock;
  assign tlSlave_reset = reset;
  assign tlSlave_io_tlMasterReceiver_valid = tlHost_io_tlMasterTransmitter_valid; // @[TilelinkAdapter.scala 22:35]
  assign tlSlave_io_tlMasterReceiver_bits_a_opcode = tlHost_io_tlMasterTransmitter_bits_a_opcode; // @[TilelinkAdapter.scala 22:35]
  assign tlSlave_io_tlMasterReceiver_bits_a_address = tlHost_io_tlMasterTransmitter_bits_a_address; // @[TilelinkAdapter.scala 22:35]
  assign tlSlave_io_tlMasterReceiver_bits_a_mask = tlHost_io_tlMasterTransmitter_bits_a_mask; // @[TilelinkAdapter.scala 22:35]
  assign tlSlave_io_tlMasterReceiver_bits_a_data = tlHost_io_tlMasterTransmitter_bits_a_data; // @[TilelinkAdapter.scala 22:35]
  assign tlSlave_io_rspIn_valid = io_rspIn_valid; // @[TilelinkAdapter.scala 37:22]
  assign tlSlave_io_rspIn_bits_dataResponse = io_rspIn_bits_dataResponse; // @[TilelinkAdapter.scala 37:22]
  assign tlSlave_io_rspIn_bits_error = io_rspIn_bits_error; // @[TilelinkAdapter.scala 37:22]
endmodule
module BlockRamWithoutMasking(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addrRequest,
  input  [31:0] io_req_bits_dataRequest,
  input         io_req_bits_isWrite,
  output        io_rsp_valid,
  output [31:0] io_rsp_bits_dataResponse,
  output        io_rsp_bits_error
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:1023]; // @[BlockRam.scala 82:24]
  wire  mem_io_rsp_bits_dataResponse_MPORT_en; // @[BlockRam.scala 82:24]
  wire [9:0] mem_io_rsp_bits_dataResponse_MPORT_addr; // @[BlockRam.scala 82:24]
  wire [31:0] mem_io_rsp_bits_dataResponse_MPORT_data; // @[BlockRam.scala 82:24]
  wire [31:0] mem_MPORT_data; // @[BlockRam.scala 82:24]
  wire [9:0] mem_MPORT_addr; // @[BlockRam.scala 82:24]
  wire  mem_MPORT_mask; // @[BlockRam.scala 82:24]
  wire  mem_MPORT_en; // @[BlockRam.scala 82:24]
  reg  mem_io_rsp_bits_dataResponse_MPORT_en_pipe_0;
  reg [9:0] mem_io_rsp_bits_dataResponse_MPORT_addr_pipe_0;
  reg  validReg; // @[BlockRam.scala 72:25]
  reg  errReg; // @[BlockRam.scala 73:23]
  wire  _addrMisaligned_T = io_req_ready & io_req_valid; // @[Decoupled.scala 50:35]
  wire  addrMisaligned = _addrMisaligned_T & |io_req_bits_addrRequest[1:0]; // @[BlockRam.scala 78:24]
  wire [31:0] _addrOutOfBounds_T_1 = io_req_bits_addrRequest / 3'h4; // @[BlockRam.scala 79:65]
  wire  addrOutOfBounds = _addrMisaligned_T & _addrOutOfBounds_T_1 >= 32'h3ff; // @[BlockRam.scala 79:25]
  wire  _T_1 = ~io_req_bits_isWrite; // @[BlockRam.scala 88:25]
  wire  _T_2 = _addrMisaligned_T & ~io_req_bits_isWrite; // @[BlockRam.scala 88:22]
  wire  _T_4 = _addrMisaligned_T & io_req_bits_isWrite; // @[BlockRam.scala 92:29]
  wire  _GEN_13 = _addrMisaligned_T & ~io_req_bits_isWrite | _T_4; // @[BlockRam.scala 88:47 91:14]
  assign mem_io_rsp_bits_dataResponse_MPORT_en = mem_io_rsp_bits_dataResponse_MPORT_en_pipe_0;
  assign mem_io_rsp_bits_dataResponse_MPORT_addr = mem_io_rsp_bits_dataResponse_MPORT_addr_pipe_0;
  assign mem_io_rsp_bits_dataResponse_MPORT_data = mem[mem_io_rsp_bits_dataResponse_MPORT_addr]; // @[BlockRam.scala 82:24]
  assign mem_MPORT_data = io_req_bits_dataRequest;
  assign mem_MPORT_addr = _addrOutOfBounds_T_1[9:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = _T_2 ? 1'h0 : _T_4;
  assign io_req_ready = 1'h1; // @[BlockRam.scala 76:16]
  assign io_rsp_valid = validReg; // @[BlockRam.scala 74:16]
  assign io_rsp_bits_dataResponse = mem_io_rsp_bits_dataResponse_MPORT_data; // @[BlockRam.scala 88:47 90:30]
  assign io_rsp_bits_error = errReg; // @[BlockRam.scala 75:21]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[BlockRam.scala 82:24]
    end
    mem_io_rsp_bits_dataResponse_MPORT_en_pipe_0 <= _addrMisaligned_T & _T_1;
    if (_addrMisaligned_T & _T_1) begin
      mem_io_rsp_bits_dataResponse_MPORT_addr_pipe_0 <= _addrOutOfBounds_T_1[9:0];
    end
    if (reset) begin // @[BlockRam.scala 72:25]
      validReg <= 1'h0; // @[BlockRam.scala 72:25]
    end else begin
      validReg <= _GEN_13;
    end
    if (reset) begin // @[BlockRam.scala 73:23]
      errReg <= 1'h0; // @[BlockRam.scala 73:23]
    end else begin
      errReg <= addrMisaligned | addrOutOfBounds; // @[BlockRam.scala 81:10]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rsp_bits_dataResponse_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rsp_bits_dataResponse_MPORT_addr_pipe_0 = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  validReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  errReg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BlockRamWithMasking(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addrRequest,
  input  [31:0] io_req_bits_dataRequest,
  input  [3:0]  io_req_bits_activeByteLane,
  input         io_req_bits_isWrite,
  output        io_rsp_valid,
  output [31:0] io_rsp_bits_dataResponse
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem_0 [0:1023]; // @[BlockRam.scala 141:24]
  wire  mem_0_MPORT_en; // @[BlockRam.scala 141:24]
  wire [9:0] mem_0_MPORT_addr; // @[BlockRam.scala 141:24]
  wire [7:0] mem_0_MPORT_data; // @[BlockRam.scala 141:24]
  wire [7:0] mem_0_MPORT_1_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_0_MPORT_1_addr; // @[BlockRam.scala 141:24]
  wire  mem_0_MPORT_1_mask; // @[BlockRam.scala 141:24]
  wire  mem_0_MPORT_1_en; // @[BlockRam.scala 141:24]
  reg  mem_0_MPORT_en_pipe_0;
  reg [9:0] mem_0_MPORT_addr_pipe_0;
  reg [7:0] mem_1 [0:1023]; // @[BlockRam.scala 141:24]
  wire  mem_1_MPORT_en; // @[BlockRam.scala 141:24]
  wire [9:0] mem_1_MPORT_addr; // @[BlockRam.scala 141:24]
  wire [7:0] mem_1_MPORT_data; // @[BlockRam.scala 141:24]
  wire [7:0] mem_1_MPORT_1_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_1_MPORT_1_addr; // @[BlockRam.scala 141:24]
  wire  mem_1_MPORT_1_mask; // @[BlockRam.scala 141:24]
  wire  mem_1_MPORT_1_en; // @[BlockRam.scala 141:24]
  reg  mem_1_MPORT_en_pipe_0;
  reg [9:0] mem_1_MPORT_addr_pipe_0;
  reg [7:0] mem_2 [0:1023]; // @[BlockRam.scala 141:24]
  wire  mem_2_MPORT_en; // @[BlockRam.scala 141:24]
  wire [9:0] mem_2_MPORT_addr; // @[BlockRam.scala 141:24]
  wire [7:0] mem_2_MPORT_data; // @[BlockRam.scala 141:24]
  wire [7:0] mem_2_MPORT_1_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_2_MPORT_1_addr; // @[BlockRam.scala 141:24]
  wire  mem_2_MPORT_1_mask; // @[BlockRam.scala 141:24]
  wire  mem_2_MPORT_1_en; // @[BlockRam.scala 141:24]
  reg  mem_2_MPORT_en_pipe_0;
  reg [9:0] mem_2_MPORT_addr_pipe_0;
  reg [7:0] mem_3 [0:1023]; // @[BlockRam.scala 141:24]
  wire  mem_3_MPORT_en; // @[BlockRam.scala 141:24]
  wire [9:0] mem_3_MPORT_addr; // @[BlockRam.scala 141:24]
  wire [7:0] mem_3_MPORT_data; // @[BlockRam.scala 141:24]
  wire [7:0] mem_3_MPORT_1_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_3_MPORT_1_addr; // @[BlockRam.scala 141:24]
  wire  mem_3_MPORT_1_mask; // @[BlockRam.scala 141:24]
  wire  mem_3_MPORT_1_en; // @[BlockRam.scala 141:24]
  reg  mem_3_MPORT_en_pipe_0;
  reg [9:0] mem_3_MPORT_addr_pipe_0;
  wire  byteLane_0 = io_req_bits_activeByteLane[0]; // @[BlockRam.scala 128:52]
  wire  byteLane_1 = io_req_bits_activeByteLane[1]; // @[BlockRam.scala 128:52]
  wire  byteLane_2 = io_req_bits_activeByteLane[2]; // @[BlockRam.scala 128:52]
  wire  byteLane_3 = io_req_bits_activeByteLane[3]; // @[BlockRam.scala 128:52]
  reg  validReg; // @[BlockRam.scala 136:25]
  wire  _T = io_req_ready & io_req_valid; // @[Decoupled.scala 50:35]
  wire  _T_1 = ~io_req_bits_isWrite; // @[BlockRam.scala 143:25]
  wire  _T_2 = _T & ~io_req_bits_isWrite; // @[BlockRam.scala 143:22]
  wire [31:0] _T_3 = io_req_bits_addrRequest / 3'h4; // @[BlockRam.scala 145:46]
  wire  _T_7 = _T & io_req_bits_isWrite; // @[BlockRam.scala 147:29]
  wire [7:0] rdata_0 = mem_0_MPORT_data; // @[BlockRam.scala 143:47 145:11]
  wire [7:0] rdata_1 = mem_1_MPORT_data; // @[BlockRam.scala 143:47 145:11]
  wire [7:0] rdata_2 = mem_2_MPORT_data; // @[BlockRam.scala 143:47 145:11]
  wire [7:0] rdata_3 = mem_3_MPORT_data; // @[BlockRam.scala 143:47 145:11]
  wire  _GEN_30 = _T & ~io_req_bits_isWrite | _T_7; // @[BlockRam.scala 143:47 146:14]
  wire [7:0] data_0 = byteLane_0 ? rdata_0 : 8'h0; // @[BlockRam.scala 160:8]
  wire [7:0] data_1 = byteLane_1 ? rdata_1 : 8'h0; // @[BlockRam.scala 160:8]
  wire [7:0] data_2 = byteLane_2 ? rdata_2 : 8'h0; // @[BlockRam.scala 160:8]
  wire [7:0] data_3 = byteLane_3 ? rdata_3 : 8'h0; // @[BlockRam.scala 160:8]
  wire [15:0] io_rsp_bits_dataResponse_lo = {data_1,data_0}; // @[Cat.scala 31:58]
  wire [15:0] io_rsp_bits_dataResponse_hi = {data_3,data_2}; // @[Cat.scala 31:58]
  assign mem_0_MPORT_en = mem_0_MPORT_en_pipe_0;
  assign mem_0_MPORT_addr = mem_0_MPORT_addr_pipe_0;
  assign mem_0_MPORT_data = mem_0[mem_0_MPORT_addr]; // @[BlockRam.scala 141:24]
  assign mem_0_MPORT_1_data = io_req_bits_dataRequest[7:0];
  assign mem_0_MPORT_1_addr = _T_3[9:0];
  assign mem_0_MPORT_1_mask = io_req_bits_activeByteLane[0];
  assign mem_0_MPORT_1_en = _T_2 ? 1'h0 : _T_7;
  assign mem_1_MPORT_en = mem_1_MPORT_en_pipe_0;
  assign mem_1_MPORT_addr = mem_1_MPORT_addr_pipe_0;
  assign mem_1_MPORT_data = mem_1[mem_1_MPORT_addr]; // @[BlockRam.scala 141:24]
  assign mem_1_MPORT_1_data = io_req_bits_dataRequest[15:8];
  assign mem_1_MPORT_1_addr = _T_3[9:0];
  assign mem_1_MPORT_1_mask = io_req_bits_activeByteLane[1];
  assign mem_1_MPORT_1_en = _T_2 ? 1'h0 : _T_7;
  assign mem_2_MPORT_en = mem_2_MPORT_en_pipe_0;
  assign mem_2_MPORT_addr = mem_2_MPORT_addr_pipe_0;
  assign mem_2_MPORT_data = mem_2[mem_2_MPORT_addr]; // @[BlockRam.scala 141:24]
  assign mem_2_MPORT_1_data = io_req_bits_dataRequest[23:16];
  assign mem_2_MPORT_1_addr = _T_3[9:0];
  assign mem_2_MPORT_1_mask = io_req_bits_activeByteLane[2];
  assign mem_2_MPORT_1_en = _T_2 ? 1'h0 : _T_7;
  assign mem_3_MPORT_en = mem_3_MPORT_en_pipe_0;
  assign mem_3_MPORT_addr = mem_3_MPORT_addr_pipe_0;
  assign mem_3_MPORT_data = mem_3[mem_3_MPORT_addr]; // @[BlockRam.scala 141:24]
  assign mem_3_MPORT_1_data = io_req_bits_dataRequest[31:24];
  assign mem_3_MPORT_1_addr = _T_3[9:0];
  assign mem_3_MPORT_1_mask = io_req_bits_activeByteLane[3];
  assign mem_3_MPORT_1_en = _T_2 ? 1'h0 : _T_7;
  assign io_req_ready = 1'h1; // @[BlockRam.scala 139:16]
  assign io_rsp_valid = validReg; // @[BlockRam.scala 137:16]
  assign io_rsp_bits_dataResponse = {io_rsp_bits_dataResponse_hi,io_rsp_bits_dataResponse_lo}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    if (mem_0_MPORT_1_en & mem_0_MPORT_1_mask) begin
      mem_0[mem_0_MPORT_1_addr] <= mem_0_MPORT_1_data; // @[BlockRam.scala 141:24]
    end
    mem_0_MPORT_en_pipe_0 <= _T & _T_1;
    if (_T & _T_1) begin
      mem_0_MPORT_addr_pipe_0 <= _T_3[9:0];
    end
    if (mem_1_MPORT_1_en & mem_1_MPORT_1_mask) begin
      mem_1[mem_1_MPORT_1_addr] <= mem_1_MPORT_1_data; // @[BlockRam.scala 141:24]
    end
    mem_1_MPORT_en_pipe_0 <= _T & _T_1;
    if (_T & _T_1) begin
      mem_1_MPORT_addr_pipe_0 <= _T_3[9:0];
    end
    if (mem_2_MPORT_1_en & mem_2_MPORT_1_mask) begin
      mem_2[mem_2_MPORT_1_addr] <= mem_2_MPORT_1_data; // @[BlockRam.scala 141:24]
    end
    mem_2_MPORT_en_pipe_0 <= _T & _T_1;
    if (_T & _T_1) begin
      mem_2_MPORT_addr_pipe_0 <= _T_3[9:0];
    end
    if (mem_3_MPORT_1_en & mem_3_MPORT_1_mask) begin
      mem_3[mem_3_MPORT_1_addr] <= mem_3_MPORT_1_data; // @[BlockRam.scala 141:24]
    end
    mem_3_MPORT_en_pipe_0 <= _T & _T_1;
    if (_T & _T_1) begin
      mem_3_MPORT_addr_pipe_0 <= _T_3[9:0];
    end
    if (reset) begin // @[BlockRam.scala 136:25]
      validReg <= 1'h0; // @[BlockRam.scala 136:25]
    end else begin
      validReg <= _GEN_30;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem_1[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem_2[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem_3[initvar] = _RAND_9[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_MPORT_addr_pipe_0 = _RAND_2[9:0];
  _RAND_4 = {1{`RANDOM}};
  mem_1_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mem_1_MPORT_addr_pipe_0 = _RAND_5[9:0];
  _RAND_7 = {1{`RANDOM}};
  mem_2_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mem_2_MPORT_addr_pipe_0 = _RAND_8[9:0];
  _RAND_10 = {1{`RANDOM}};
  mem_3_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_3_MPORT_addr_pipe_0 = _RAND_11[9:0];
  _RAND_12 = {1{`RANDOM}};
  validReg = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IbexJigsaw(
  input   clock,
  input   reset,
  output  io_pin
);
  wire  instr_adapter_clock; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_reset; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_reqIn_ready; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_reqIn_valid; // @[IbexJigsaw.scala 19:31]
  wire [31:0] instr_adapter_io_reqIn_bits_addrRequest; // @[IbexJigsaw.scala 19:31]
  wire [31:0] instr_adapter_io_reqIn_bits_dataRequest; // @[IbexJigsaw.scala 19:31]
  wire [3:0] instr_adapter_io_reqIn_bits_activeByteLane; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_reqIn_bits_isWrite; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_rspOut_valid; // @[IbexJigsaw.scala 19:31]
  wire [31:0] instr_adapter_io_rspOut_bits_dataResponse; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_rspOut_bits_error; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_reqOut_valid; // @[IbexJigsaw.scala 19:31]
  wire [31:0] instr_adapter_io_reqOut_bits_addrRequest; // @[IbexJigsaw.scala 19:31]
  wire [31:0] instr_adapter_io_reqOut_bits_dataRequest; // @[IbexJigsaw.scala 19:31]
  wire [3:0] instr_adapter_io_reqOut_bits_activeByteLane; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_reqOut_bits_isWrite; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_rspIn_valid; // @[IbexJigsaw.scala 19:31]
  wire [31:0] instr_adapter_io_rspIn_bits_dataResponse; // @[IbexJigsaw.scala 19:31]
  wire  instr_adapter_io_rspIn_bits_error; // @[IbexJigsaw.scala 19:31]
  wire  data_adapter_clock; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_reset; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_reqIn_ready; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_reqIn_valid; // @[IbexJigsaw.scala 20:30]
  wire [31:0] data_adapter_io_reqIn_bits_addrRequest; // @[IbexJigsaw.scala 20:30]
  wire [31:0] data_adapter_io_reqIn_bits_dataRequest; // @[IbexJigsaw.scala 20:30]
  wire [3:0] data_adapter_io_reqIn_bits_activeByteLane; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_reqIn_bits_isWrite; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_rspOut_valid; // @[IbexJigsaw.scala 20:30]
  wire [31:0] data_adapter_io_rspOut_bits_dataResponse; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_rspOut_bits_error; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_reqOut_valid; // @[IbexJigsaw.scala 20:30]
  wire [31:0] data_adapter_io_reqOut_bits_addrRequest; // @[IbexJigsaw.scala 20:30]
  wire [31:0] data_adapter_io_reqOut_bits_dataRequest; // @[IbexJigsaw.scala 20:30]
  wire [3:0] data_adapter_io_reqOut_bits_activeByteLane; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_reqOut_bits_isWrite; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_rspIn_valid; // @[IbexJigsaw.scala 20:30]
  wire [31:0] data_adapter_io_rspIn_bits_dataResponse; // @[IbexJigsaw.scala 20:30]
  wire  data_adapter_io_rspIn_bits_error; // @[IbexJigsaw.scala 20:30]
  wire  instr_mem_clock; // @[IbexJigsaw.scala 22:27]
  wire  instr_mem_reset; // @[IbexJigsaw.scala 22:27]
  wire  instr_mem_io_req_ready; // @[IbexJigsaw.scala 22:27]
  wire  instr_mem_io_req_valid; // @[IbexJigsaw.scala 22:27]
  wire [31:0] instr_mem_io_req_bits_addrRequest; // @[IbexJigsaw.scala 22:27]
  wire [31:0] instr_mem_io_req_bits_dataRequest; // @[IbexJigsaw.scala 22:27]
  wire  instr_mem_io_req_bits_isWrite; // @[IbexJigsaw.scala 22:27]
  wire  instr_mem_io_rsp_valid; // @[IbexJigsaw.scala 22:27]
  wire [31:0] instr_mem_io_rsp_bits_dataResponse; // @[IbexJigsaw.scala 22:27]
  wire  instr_mem_io_rsp_bits_error; // @[IbexJigsaw.scala 22:27]
  wire  data_mem_clock; // @[IbexJigsaw.scala 23:27]
  wire  data_mem_reset; // @[IbexJigsaw.scala 23:27]
  wire  data_mem_io_req_ready; // @[IbexJigsaw.scala 23:27]
  wire  data_mem_io_req_valid; // @[IbexJigsaw.scala 23:27]
  wire [31:0] data_mem_io_req_bits_addrRequest; // @[IbexJigsaw.scala 23:27]
  wire [31:0] data_mem_io_req_bits_dataRequest; // @[IbexJigsaw.scala 23:27]
  wire [3:0] data_mem_io_req_bits_activeByteLane; // @[IbexJigsaw.scala 23:27]
  wire  data_mem_io_req_bits_isWrite; // @[IbexJigsaw.scala 23:27]
  wire  data_mem_io_rsp_valid; // @[IbexJigsaw.scala 23:27]
  wire [31:0] data_mem_io_rsp_bits_dataResponse; // @[IbexJigsaw.scala 23:27]
  wire  ibex_clk_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_rst_ni; // @[IbexJigsaw.scala 33:22]
  wire  ibex_test_en_i; // @[IbexJigsaw.scala 33:22]
  wire [31:0] ibex_hart_id_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_instr_req_o; // @[IbexJigsaw.scala 33:22]
  wire  ibex_instr_gnt_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_instr_rvalid_i; // @[IbexJigsaw.scala 33:22]
  wire [31:0] ibex_instr_addr_o; // @[IbexJigsaw.scala 33:22]
  wire [31:0] ibex_instr_rdata_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_instr_err_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_data_req_o; // @[IbexJigsaw.scala 33:22]
  wire  ibex_data_gnt_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_data_rvalid_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_data_we_o; // @[IbexJigsaw.scala 33:22]
  wire [3:0] ibex_data_be_o; // @[IbexJigsaw.scala 33:22]
  wire [31:0] ibex_data_addr_o; // @[IbexJigsaw.scala 33:22]
  wire [31:0] ibex_data_wdata_o; // @[IbexJigsaw.scala 33:22]
  wire [31:0] ibex_data_rdata_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_data_err_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_irq_software_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_irq_timer_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_irq_external_i; // @[IbexJigsaw.scala 33:22]
  wire [14:0] ibex_irq_fast_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_irq_nm_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_debug_req_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_fetch_enable_i; // @[IbexJigsaw.scala 33:22]
  wire  ibex_alert_minor_o; // @[IbexJigsaw.scala 33:22]
  wire  ibex_alert_major_o; // @[IbexJigsaw.scala 33:22]
  wire  ibex_core_sleep_o; // @[IbexJigsaw.scala 33:22]
  wire  ibex_scan_rst_ni; // @[IbexJigsaw.scala 33:22]
  TilelinkAdapter instr_adapter ( // @[IbexJigsaw.scala 19:31]
    .clock(instr_adapter_clock),
    .reset(instr_adapter_reset),
    .io_reqIn_ready(instr_adapter_io_reqIn_ready),
    .io_reqIn_valid(instr_adapter_io_reqIn_valid),
    .io_reqIn_bits_addrRequest(instr_adapter_io_reqIn_bits_addrRequest),
    .io_reqIn_bits_dataRequest(instr_adapter_io_reqIn_bits_dataRequest),
    .io_reqIn_bits_activeByteLane(instr_adapter_io_reqIn_bits_activeByteLane),
    .io_reqIn_bits_isWrite(instr_adapter_io_reqIn_bits_isWrite),
    .io_rspOut_valid(instr_adapter_io_rspOut_valid),
    .io_rspOut_bits_dataResponse(instr_adapter_io_rspOut_bits_dataResponse),
    .io_rspOut_bits_error(instr_adapter_io_rspOut_bits_error),
    .io_reqOut_valid(instr_adapter_io_reqOut_valid),
    .io_reqOut_bits_addrRequest(instr_adapter_io_reqOut_bits_addrRequest),
    .io_reqOut_bits_dataRequest(instr_adapter_io_reqOut_bits_dataRequest),
    .io_reqOut_bits_activeByteLane(instr_adapter_io_reqOut_bits_activeByteLane),
    .io_reqOut_bits_isWrite(instr_adapter_io_reqOut_bits_isWrite),
    .io_rspIn_valid(instr_adapter_io_rspIn_valid),
    .io_rspIn_bits_dataResponse(instr_adapter_io_rspIn_bits_dataResponse),
    .io_rspIn_bits_error(instr_adapter_io_rspIn_bits_error)
  );
  TilelinkAdapter data_adapter ( // @[IbexJigsaw.scala 20:30]
    .clock(data_adapter_clock),
    .reset(data_adapter_reset),
    .io_reqIn_ready(data_adapter_io_reqIn_ready),
    .io_reqIn_valid(data_adapter_io_reqIn_valid),
    .io_reqIn_bits_addrRequest(data_adapter_io_reqIn_bits_addrRequest),
    .io_reqIn_bits_dataRequest(data_adapter_io_reqIn_bits_dataRequest),
    .io_reqIn_bits_activeByteLane(data_adapter_io_reqIn_bits_activeByteLane),
    .io_reqIn_bits_isWrite(data_adapter_io_reqIn_bits_isWrite),
    .io_rspOut_valid(data_adapter_io_rspOut_valid),
    .io_rspOut_bits_dataResponse(data_adapter_io_rspOut_bits_dataResponse),
    .io_rspOut_bits_error(data_adapter_io_rspOut_bits_error),
    .io_reqOut_valid(data_adapter_io_reqOut_valid),
    .io_reqOut_bits_addrRequest(data_adapter_io_reqOut_bits_addrRequest),
    .io_reqOut_bits_dataRequest(data_adapter_io_reqOut_bits_dataRequest),
    .io_reqOut_bits_activeByteLane(data_adapter_io_reqOut_bits_activeByteLane),
    .io_reqOut_bits_isWrite(data_adapter_io_reqOut_bits_isWrite),
    .io_rspIn_valid(data_adapter_io_rspIn_valid),
    .io_rspIn_bits_dataResponse(data_adapter_io_rspIn_bits_dataResponse),
    .io_rspIn_bits_error(data_adapter_io_rspIn_bits_error)
  );
  BlockRamWithoutMasking instr_mem ( // @[IbexJigsaw.scala 22:27]
    .clock(instr_mem_clock),
    .reset(instr_mem_reset),
    .io_req_ready(instr_mem_io_req_ready),
    .io_req_valid(instr_mem_io_req_valid),
    .io_req_bits_addrRequest(instr_mem_io_req_bits_addrRequest),
    .io_req_bits_dataRequest(instr_mem_io_req_bits_dataRequest),
    .io_req_bits_isWrite(instr_mem_io_req_bits_isWrite),
    .io_rsp_valid(instr_mem_io_rsp_valid),
    .io_rsp_bits_dataResponse(instr_mem_io_rsp_bits_dataResponse),
    .io_rsp_bits_error(instr_mem_io_rsp_bits_error)
  );
  BlockRamWithMasking data_mem ( // @[IbexJigsaw.scala 23:27]
    .clock(data_mem_clock),
    .reset(data_mem_reset),
    .io_req_ready(data_mem_io_req_ready),
    .io_req_valid(data_mem_io_req_valid),
    .io_req_bits_addrRequest(data_mem_io_req_bits_addrRequest),
    .io_req_bits_dataRequest(data_mem_io_req_bits_dataRequest),
    .io_req_bits_activeByteLane(data_mem_io_req_bits_activeByteLane),
    .io_req_bits_isWrite(data_mem_io_req_bits_isWrite),
    .io_rsp_valid(data_mem_io_rsp_valid),
    .io_rsp_bits_dataResponse(data_mem_io_rsp_bits_dataResponse)
  );
  BlackBoxIbexCore
    #(.PMP_ENABLE(0), .DBG_HW_BREAK_NUM(1), .PMP_NUM_REGIONS(4), .WB_STAGE(0), .RV32E(0), .MHPM_COUNTER_NUM(0), .RV32B(ibex_pkg::RV32BNone), .REGFILE(ibex_pkg::RegFileFF), .BRANCH_TARGET_ALU(0), .MHPM_COUNTER_WIDTH(0), .DM_EXCEPTION_ADDR(437323784), .BRANCH_PREDICTOR(0), .DM_HALT_ADDR(437323776), .PMP_GRANULARITY(0), .RV32M(ibex_pkg::RV32MFast))
    ibex ( // @[IbexJigsaw.scala 33:22]
    .clk_i(ibex_clk_i),
    .rst_ni(ibex_rst_ni),
    .test_en_i(ibex_test_en_i),
    .hart_id_i(ibex_hart_id_i),
    .instr_req_o(ibex_instr_req_o),
    .instr_gnt_i(ibex_instr_gnt_i),
    .instr_rvalid_i(ibex_instr_rvalid_i),
    .instr_addr_o(ibex_instr_addr_o),
    .instr_rdata_i(ibex_instr_rdata_i),
    .instr_err_i(ibex_instr_err_i),
    .data_req_o(ibex_data_req_o),
    .data_gnt_i(ibex_data_gnt_i),
    .data_rvalid_i(ibex_data_rvalid_i),
    .data_we_o(ibex_data_we_o),
    .data_be_o(ibex_data_be_o),
    .data_addr_o(ibex_data_addr_o),
    .data_wdata_o(ibex_data_wdata_o),
    .data_rdata_i(ibex_data_rdata_i),
    .data_err_i(ibex_data_err_i),
    .irq_software_i(ibex_irq_software_i),
    .irq_timer_i(ibex_irq_timer_i),
    .irq_external_i(ibex_irq_external_i),
    .irq_fast_i(ibex_irq_fast_i),
    .irq_nm_i(ibex_irq_nm_i),
    .debug_req_i(ibex_debug_req_i),
    .fetch_enable_i(ibex_fetch_enable_i),
    .alert_minor_o(ibex_alert_minor_o),
    .alert_major_o(ibex_alert_major_o),
    .core_sleep_o(ibex_core_sleep_o),
    .scan_rst_ni(ibex_scan_rst_ni)
  );
  assign io_pin = ibex_core_sleep_o; // @[IbexJigsaw.scala 80:12]
  assign instr_adapter_clock = clock;
  assign instr_adapter_reset = reset;
  assign instr_adapter_io_reqIn_valid = ibex_instr_req_o; // @[IbexJigsaw.scala 44:34]
  assign instr_adapter_io_reqIn_bits_addrRequest = {{2'd0}, ibex_instr_addr_o[31:2]}; // @[IbexJigsaw.scala 45:45]
  assign instr_adapter_io_reqIn_bits_dataRequest = 32'h0; // @[IbexJigsaw.scala 48:45]
  assign instr_adapter_io_reqIn_bits_activeByteLane = 4'h0; // @[IbexJigsaw.scala 47:48]
  assign instr_adapter_io_reqIn_bits_isWrite = 1'h0; // @[IbexJigsaw.scala 46:41]
  assign instr_adapter_io_rspIn_valid = instr_mem_io_rsp_valid; // @[IbexJigsaw.scala 26:22]
  assign instr_adapter_io_rspIn_bits_dataResponse = instr_mem_io_rsp_bits_dataResponse; // @[IbexJigsaw.scala 26:22]
  assign instr_adapter_io_rspIn_bits_error = instr_mem_io_rsp_bits_error; // @[IbexJigsaw.scala 26:22]
  assign data_adapter_clock = clock;
  assign data_adapter_reset = reset;
  assign data_adapter_io_reqIn_valid = ibex_data_req_o; // @[IbexJigsaw.scala 58:33]
  assign data_adapter_io_reqIn_bits_addrRequest = ibex_data_addr_o; // @[IbexJigsaw.scala 59:44]
  assign data_adapter_io_reqIn_bits_dataRequest = ibex_data_wdata_o; // @[IbexJigsaw.scala 60:44]
  assign data_adapter_io_reqIn_bits_activeByteLane = ibex_data_be_o; // @[IbexJigsaw.scala 62:47]
  assign data_adapter_io_reqIn_bits_isWrite = ibex_data_we_o; // @[IbexJigsaw.scala 61:40]
  assign data_adapter_io_rspIn_valid = data_mem_io_rsp_valid; // @[IbexJigsaw.scala 29:21]
  assign data_adapter_io_rspIn_bits_dataResponse = data_mem_io_rsp_bits_dataResponse; // @[IbexJigsaw.scala 29:21]
  assign data_adapter_io_rspIn_bits_error = 1'h0; // @[IbexJigsaw.scala 29:21]
  assign instr_mem_clock = clock;
  assign instr_mem_reset = reset;
  assign instr_mem_io_req_valid = instr_adapter_io_reqOut_valid; // @[IbexJigsaw.scala 25:29]
  assign instr_mem_io_req_bits_addrRequest = instr_adapter_io_reqOut_bits_addrRequest; // @[IbexJigsaw.scala 25:29]
  assign instr_mem_io_req_bits_dataRequest = instr_adapter_io_reqOut_bits_dataRequest; // @[IbexJigsaw.scala 25:29]
  assign instr_mem_io_req_bits_isWrite = instr_adapter_io_reqOut_bits_isWrite; // @[IbexJigsaw.scala 25:29]
  assign data_mem_clock = clock;
  assign data_mem_reset = reset;
  assign data_mem_io_req_valid = data_adapter_io_reqOut_valid; // @[IbexJigsaw.scala 28:28]
  assign data_mem_io_req_bits_addrRequest = data_adapter_io_reqOut_bits_addrRequest; // @[IbexJigsaw.scala 28:28]
  assign data_mem_io_req_bits_dataRequest = data_adapter_io_reqOut_bits_dataRequest; // @[IbexJigsaw.scala 28:28]
  assign data_mem_io_req_bits_activeByteLane = data_adapter_io_reqOut_bits_activeByteLane; // @[IbexJigsaw.scala 28:28]
  assign data_mem_io_req_bits_isWrite = data_adapter_io_reqOut_bits_isWrite; // @[IbexJigsaw.scala 28:28]
  assign ibex_clk_i = clock; // @[IbexJigsaw.scala 38:19]
  assign ibex_rst_ni = ~reset; // @[IbexJigsaw.scala 39:23]
  assign ibex_test_en_i = 1'h1; // @[IbexJigsaw.scala 40:23]
  assign ibex_hart_id_i = 32'hf14; // @[IbexJigsaw.scala 41:23]
  assign ibex_instr_gnt_i = instr_adapter_io_reqIn_ready; // @[IbexJigsaw.scala 49:25]
  assign ibex_instr_rvalid_i = instr_adapter_io_rspOut_valid; // @[IbexJigsaw.scala 50:28]
  assign ibex_instr_rdata_i = instr_adapter_io_rspOut_bits_dataResponse; // @[IbexJigsaw.scala 51:27]
  assign ibex_instr_err_i = instr_adapter_io_rspOut_bits_error; // @[IbexJigsaw.scala 53:25]
  assign ibex_data_gnt_i = data_adapter_io_reqIn_ready; // @[IbexJigsaw.scala 63:24]
  assign ibex_data_rvalid_i = data_adapter_io_rspOut_valid; // @[IbexJigsaw.scala 64:27]
  assign ibex_data_rdata_i = data_adapter_io_rspOut_bits_dataResponse; // @[IbexJigsaw.scala 65:26]
  assign ibex_data_err_i = data_adapter_io_rspOut_bits_error; // @[IbexJigsaw.scala 67:24]
  assign ibex_irq_software_i = 1'h0; // @[IbexJigsaw.scala 72:28]
  assign ibex_irq_timer_i = 1'h0; // @[IbexJigsaw.scala 73:25]
  assign ibex_irq_external_i = 1'h0; // @[IbexJigsaw.scala 74:28]
  assign ibex_irq_fast_i = 15'h0; // @[IbexJigsaw.scala 75:24]
  assign ibex_irq_nm_i = 1'h0; // @[IbexJigsaw.scala 76:22]
  assign ibex_debug_req_i = 1'h0; // @[IbexJigsaw.scala 71:25]
  assign ibex_fetch_enable_i = 1'h1; // @[IbexJigsaw.scala 77:28]
  assign ibex_scan_rst_ni = 1'h1; // @[IbexJigsaw.scala 78:25]
endmodule
