module WishboneHost(
  input         clock,
  input         reset,
  input         io_wbMasterTransmitter_ready,
  output        io_wbMasterTransmitter_valid,
  output        io_wbMasterTransmitter_bits_cyc,
  output        io_wbMasterTransmitter_bits_stb,
  output        io_wbMasterTransmitter_bits_we,
  output [31:0] io_wbMasterTransmitter_bits_adr,
  output [31:0] io_wbMasterTransmitter_bits_dat,
  output [3:0]  io_wbMasterTransmitter_bits_sel,
  output        io_wbSlaveReceiver_ready,
  input         io_wbSlaveReceiver_bits_ack,
  input  [31:0] io_wbSlaveReceiver_bits_dat,
  input         io_wbSlaveReceiver_bits_err,
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
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg  startWBTransaction; // @[WishboneHost.scala 39:35]
  reg [31:0] dataReg; // @[WishboneHost.scala 41:24]
  reg  respReg; // @[WishboneHost.scala 42:24]
  reg  errReg; // @[WishboneHost.scala 43:23]
  reg  stbReg; // @[WishboneHost.scala 46:23]
  reg  cycReg; // @[WishboneHost.scala 47:23]
  reg  weReg; // @[WishboneHost.scala 48:22]
  reg [31:0] datReg; // @[WishboneHost.scala 49:23]
  reg [31:0] adrReg; // @[WishboneHost.scala 50:23]
  reg [3:0] selReg; // @[WishboneHost.scala 51:23]
  reg  stateReg; // @[WishboneHost.scala 56:25]
  reg  readyReg; // @[WishboneHost.scala 62:25]
  wire  _T_2 = io_reqIn_valid & io_wbMasterTransmitter_ready; // @[WishboneHost.scala 18:37]
  wire  _GEN_0 = _T_2 ? 1'h0 : readyReg; // @[WishboneHost.scala 63:14 WishboneHost.scala 64:14 WishboneHost.scala 62:25]
  wire  _GEN_1 = stateReg | _GEN_0; // @[WishboneHost.scala 66:33 WishboneHost.scala 67:14]
  wire  _GEN_2 = io_reqIn_bits_isWrite & readyReg & io_reqIn_valid | startWBTransaction; // @[WishboneHost.scala 85:92 WishboneHost.scala 86:26 WishboneHost.scala 39:35]
  wire  _GEN_3 = io_reqIn_bits_isWrite & readyReg & io_reqIn_valid | stbReg; // @[WishboneHost.scala 85:92 WishboneHost.scala 87:14 WishboneHost.scala 46:23]
  wire  _GEN_4 = io_reqIn_bits_isWrite & readyReg & io_reqIn_valid | cycReg; // @[WishboneHost.scala 85:92 WishboneHost.scala 88:14 WishboneHost.scala 47:23]
  wire  _GEN_9 = ~io_reqIn_bits_isWrite & readyReg & io_reqIn_valid | _GEN_2; // @[WishboneHost.scala 77:86 WishboneHost.scala 78:26]
  wire  _GEN_10 = ~io_reqIn_bits_isWrite & readyReg & io_reqIn_valid | _GEN_3; // @[WishboneHost.scala 77:86 WishboneHost.scala 79:14]
  wire  _GEN_11 = ~io_reqIn_bits_isWrite & readyReg & io_reqIn_valid | _GEN_4; // @[WishboneHost.scala 77:86 WishboneHost.scala 80:14]
  wire  _GEN_23 = io_wbSlaveReceiver_bits_err & ~io_wbSlaveReceiver_bits_ack | respReg; // @[WishboneHost.scala 112:78 WishboneHost.scala 114:15 WishboneHost.scala 42:24]
  wire  _GEN_24 = io_wbSlaveReceiver_bits_err & ~io_wbSlaveReceiver_bits_ack | errReg; // @[WishboneHost.scala 112:78 WishboneHost.scala 115:14 WishboneHost.scala 43:23]
  wire  _GEN_27 = io_wbSlaveReceiver_bits_ack & ~io_wbSlaveReceiver_bits_err | _GEN_23; // @[WishboneHost.scala 106:71 WishboneHost.scala 108:15]
  assign io_wbMasterTransmitter_valid = io_wbMasterTransmitter_bits_stb; // @[WishboneHost.scala 23:32]
  assign io_wbMasterTransmitter_bits_cyc = ~startWBTransaction ? 1'h0 : cycReg; // @[WishboneHost.scala 102:31 WishboneHost.scala 103:118 WishboneHost.scala 96:37]
  assign io_wbMasterTransmitter_bits_stb = ~startWBTransaction ? 1'h0 : stbReg; // @[WishboneHost.scala 102:31 WishboneHost.scala 103:118 WishboneHost.scala 95:37]
  assign io_wbMasterTransmitter_bits_we = ~startWBTransaction ? 1'h0 : weReg; // @[WishboneHost.scala 102:31 WishboneHost.scala 103:118 WishboneHost.scala 97:36]
  assign io_wbMasterTransmitter_bits_adr = ~startWBTransaction ? 32'h0 : adrReg; // @[WishboneHost.scala 102:31 WishboneHost.scala 103:118 WishboneHost.scala 98:37]
  assign io_wbMasterTransmitter_bits_dat = ~startWBTransaction ? 32'h0 : datReg; // @[WishboneHost.scala 102:31 WishboneHost.scala 103:118 WishboneHost.scala 99:37]
  assign io_wbMasterTransmitter_bits_sel = ~startWBTransaction ? 4'h0 : selReg; // @[WishboneHost.scala 102:31 WishboneHost.scala 103:118 WishboneHost.scala 100:37]
  assign io_wbSlaveReceiver_ready = 1'h1; // @[WishboneHost.scala 26:28]
  assign io_reqIn_ready = readyReg; // @[WishboneHost.scala 76:20]
  assign io_rspOut_valid = respReg; // @[WishboneHost.scala 128:21]
  assign io_rspOut_bits_dataResponse = dataReg; // @[WishboneHost.scala 129:33]
  assign io_rspOut_bits_error = errReg; // @[WishboneHost.scala 130:26]
  always @(posedge clock) begin
    if (reset) begin // @[WishboneHost.scala 39:35]
      startWBTransaction <= 1'h0; // @[WishboneHost.scala 39:35]
    end else if (io_wbSlaveReceiver_bits_ack & ~io_wbSlaveReceiver_bits_err) begin // @[WishboneHost.scala 106:71]
      startWBTransaction <= 1'h0; // @[WishboneHost.scala 111:26]
    end else if (io_wbSlaveReceiver_bits_err & ~io_wbSlaveReceiver_bits_ack) begin // @[WishboneHost.scala 112:78]
      startWBTransaction <= 1'h0; // @[WishboneHost.scala 116:26]
    end else begin
      startWBTransaction <= _GEN_9;
    end
    if (reset) begin // @[WishboneHost.scala 41:24]
      dataReg <= 32'h0; // @[WishboneHost.scala 41:24]
    end else if (io_wbSlaveReceiver_bits_ack & ~io_wbSlaveReceiver_bits_err) begin // @[WishboneHost.scala 106:71]
      dataReg <= io_wbSlaveReceiver_bits_dat; // @[WishboneHost.scala 107:15]
    end else if (io_wbSlaveReceiver_bits_err & ~io_wbSlaveReceiver_bits_ack) begin // @[WishboneHost.scala 112:78]
      dataReg <= io_wbSlaveReceiver_bits_dat; // @[WishboneHost.scala 113:15]
    end
    if (reset) begin // @[WishboneHost.scala 42:24]
      respReg <= 1'h0; // @[WishboneHost.scala 42:24]
    end else if (~stateReg) begin // @[WishboneHost.scala 119:29]
      respReg <= _GEN_27;
    end else if (stateReg) begin // @[WishboneHost.scala 121:42]
      respReg <= 1'h0; // @[WishboneHost.scala 122:15]
    end else begin
      respReg <= _GEN_27;
    end
    if (reset) begin // @[WishboneHost.scala 43:23]
      errReg <= 1'h0; // @[WishboneHost.scala 43:23]
    end else if (io_wbSlaveReceiver_bits_ack & ~io_wbSlaveReceiver_bits_err) begin // @[WishboneHost.scala 106:71]
      errReg <= 1'h0; // @[WishboneHost.scala 109:14]
    end else begin
      errReg <= _GEN_24;
    end
    if (reset) begin // @[WishboneHost.scala 46:23]
      stbReg <= 1'h0; // @[WishboneHost.scala 46:23]
    end else begin
      stbReg <= _GEN_10;
    end
    if (reset) begin // @[WishboneHost.scala 47:23]
      cycReg <= 1'h0; // @[WishboneHost.scala 47:23]
    end else begin
      cycReg <= _GEN_11;
    end
    if (reset) begin // @[WishboneHost.scala 48:22]
      weReg <= 1'h0; // @[WishboneHost.scala 48:22]
    end else if (~io_reqIn_bits_isWrite & readyReg & io_reqIn_valid) begin // @[WishboneHost.scala 77:86]
      weReg <= io_reqIn_bits_isWrite; // @[WishboneHost.scala 81:13]
    end else if (io_reqIn_bits_isWrite & readyReg & io_reqIn_valid) begin // @[WishboneHost.scala 85:92]
      weReg <= io_reqIn_bits_isWrite; // @[WishboneHost.scala 89:13]
    end
    if (reset) begin // @[WishboneHost.scala 49:23]
      datReg <= 32'h0; // @[WishboneHost.scala 49:23]
    end else if (~io_reqIn_bits_isWrite & readyReg & io_reqIn_valid) begin // @[WishboneHost.scala 77:86]
      datReg <= 32'h0; // @[WishboneHost.scala 83:14]
    end else if (io_reqIn_bits_isWrite & readyReg & io_reqIn_valid) begin // @[WishboneHost.scala 85:92]
      datReg <= io_reqIn_bits_dataRequest; // @[WishboneHost.scala 91:14]
    end
    if (reset) begin // @[WishboneHost.scala 50:23]
      adrReg <= 32'h0; // @[WishboneHost.scala 50:23]
    end else if (~io_reqIn_bits_isWrite & readyReg & io_reqIn_valid) begin // @[WishboneHost.scala 77:86]
      adrReg <= io_reqIn_bits_addrRequest; // @[WishboneHost.scala 82:14]
    end else if (io_reqIn_bits_isWrite & readyReg & io_reqIn_valid) begin // @[WishboneHost.scala 85:92]
      adrReg <= io_reqIn_bits_addrRequest; // @[WishboneHost.scala 90:14]
    end
    if (reset) begin // @[WishboneHost.scala 51:23]
      selReg <= 4'h0; // @[WishboneHost.scala 51:23]
    end else if (~io_reqIn_bits_isWrite & readyReg & io_reqIn_valid) begin // @[WishboneHost.scala 77:86]
      selReg <= io_reqIn_bits_activeByteLane; // @[WishboneHost.scala 84:14]
    end else if (io_reqIn_bits_isWrite & readyReg & io_reqIn_valid) begin // @[WishboneHost.scala 85:92]
      selReg <= io_reqIn_bits_activeByteLane; // @[WishboneHost.scala 92:14]
    end
    if (reset) begin // @[WishboneHost.scala 56:25]
      stateReg <= 1'h0; // @[WishboneHost.scala 56:25]
    end else if (~stateReg) begin // @[WishboneHost.scala 119:29]
      stateReg <= io_wbSlaveReceiver_bits_ack | io_wbSlaveReceiver_bits_err; // @[WishboneHost.scala 120:16]
    end else if (stateReg) begin // @[WishboneHost.scala 121:42]
      stateReg <= 1'h0; // @[WishboneHost.scala 123:16]
    end
    readyReg <= reset | _GEN_1; // @[WishboneHost.scala 62:25 WishboneHost.scala 62:25]
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
  startWBTransaction = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  respReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  errReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stbReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cycReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  weReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  datReg = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  adrReg = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  selReg = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  stateReg = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  readyReg = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WishboneDevice(
  input         io_wbSlaveTransmitter_ready,
  output        io_wbSlaveTransmitter_bits_ack,
  output [31:0] io_wbSlaveTransmitter_bits_dat,
  output        io_wbSlaveTransmitter_bits_err,
  output        io_wbMasterReceiver_ready,
  input         io_wbMasterReceiver_valid,
  input         io_wbMasterReceiver_bits_cyc,
  input         io_wbMasterReceiver_bits_stb,
  input         io_wbMasterReceiver_bits_we,
  input  [31:0] io_wbMasterReceiver_bits_adr,
  input  [31:0] io_wbMasterReceiver_bits_dat,
  input  [3:0]  io_wbMasterReceiver_bits_sel,
  output        io_reqOut_valid,
  output [31:0] io_reqOut_bits_addrRequest,
  output [31:0] io_reqOut_bits_dataRequest,
  output [3:0]  io_reqOut_bits_activeByteLane,
  output        io_reqOut_bits_isWrite,
  input         io_rspIn_valid,
  input  [31:0] io_rspIn_bits_dataResponse,
  input         io_rspIn_bits_error
);
  wire  _T_1 = io_wbMasterReceiver_valid & io_wbMasterReceiver_bits_cyc & io_wbMasterReceiver_bits_stb; // @[WishboneDevice.scala 16:80]
  wire  _T_4 = io_rspIn_valid & ~io_rspIn_bits_error; // @[WishboneDevice.scala 36:27]
  wire  _T_5 = io_rspIn_valid & io_rspIn_bits_error; // @[WishboneDevice.scala 42:34]
  wire  _GEN_5 = io_rspIn_valid & ~io_rspIn_bits_error ? 1'h0 : _T_5; // @[WishboneDevice.scala 36:52 WishboneDevice.scala 40:40]
  wire  _GEN_18 = ~io_wbMasterReceiver_bits_we ? _T_4 : _T_4; // @[WishboneDevice.scala 26:40]
  wire  _GEN_19 = ~io_wbMasterReceiver_bits_we ? _GEN_5 : _GEN_5; // @[WishboneDevice.scala 26:40]
  assign io_wbSlaveTransmitter_bits_ack = _T_1 & _GEN_18; // @[WishboneDevice.scala 25:16 WishboneDevice.scala 88:9]
  assign io_wbSlaveTransmitter_bits_dat = io_rspIn_bits_dataResponse; // @[WishboneDevice.scala 36:52 WishboneDevice.scala 41:40]
  assign io_wbSlaveTransmitter_bits_err = _T_1 & _GEN_19; // @[WishboneDevice.scala 25:16 WishboneDevice.scala 89:36]
  assign io_wbMasterReceiver_ready = 1'h1; // @[WishboneDevice.scala 19:29]
  assign io_reqOut_valid = io_wbMasterReceiver_valid & io_wbMasterReceiver_bits_cyc & io_wbMasterReceiver_bits_stb; // @[WishboneDevice.scala 16:80]
  assign io_reqOut_bits_addrRequest = io_wbMasterReceiver_bits_adr; // @[WishboneDevice.scala 26:40 WishboneDevice.scala 32:34 WishboneDevice.scala 56:34]
  assign io_reqOut_bits_dataRequest = io_wbMasterReceiver_bits_dat; // @[WishboneDevice.scala 26:40 WishboneDevice.scala 57:34]
  assign io_reqOut_bits_activeByteLane = io_wbMasterReceiver_bits_sel; // @[WishboneDevice.scala 26:40 WishboneDevice.scala 34:37 WishboneDevice.scala 58:37]
  assign io_reqOut_bits_isWrite = ~io_wbMasterReceiver_bits_we ? 1'h0 : io_wbMasterReceiver_bits_we; // @[WishboneDevice.scala 26:40 WishboneDevice.scala 35:30 WishboneDevice.scala 59:30]
endmodule
module WishboneAdapter(
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
  wire  wbHost_clock; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_reset; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_wbMasterTransmitter_ready; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_wbMasterTransmitter_valid; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_wbMasterTransmitter_bits_cyc; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_wbMasterTransmitter_bits_stb; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_wbMasterTransmitter_bits_we; // @[WishboneAdapter.scala 19:24]
  wire [31:0] wbHost_io_wbMasterTransmitter_bits_adr; // @[WishboneAdapter.scala 19:24]
  wire [31:0] wbHost_io_wbMasterTransmitter_bits_dat; // @[WishboneAdapter.scala 19:24]
  wire [3:0] wbHost_io_wbMasterTransmitter_bits_sel; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_wbSlaveReceiver_ready; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_wbSlaveReceiver_bits_ack; // @[WishboneAdapter.scala 19:24]
  wire [31:0] wbHost_io_wbSlaveReceiver_bits_dat; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_wbSlaveReceiver_bits_err; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_reqIn_ready; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_reqIn_valid; // @[WishboneAdapter.scala 19:24]
  wire [31:0] wbHost_io_reqIn_bits_addrRequest; // @[WishboneAdapter.scala 19:24]
  wire [31:0] wbHost_io_reqIn_bits_dataRequest; // @[WishboneAdapter.scala 19:24]
  wire [3:0] wbHost_io_reqIn_bits_activeByteLane; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_reqIn_bits_isWrite; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_rspOut_valid; // @[WishboneAdapter.scala 19:24]
  wire [31:0] wbHost_io_rspOut_bits_dataResponse; // @[WishboneAdapter.scala 19:24]
  wire  wbHost_io_rspOut_bits_error; // @[WishboneAdapter.scala 19:24]
  wire  wbSlave_io_wbSlaveTransmitter_ready; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_wbSlaveTransmitter_bits_ack; // @[WishboneAdapter.scala 20:25]
  wire [31:0] wbSlave_io_wbSlaveTransmitter_bits_dat; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_wbSlaveTransmitter_bits_err; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_wbMasterReceiver_ready; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_wbMasterReceiver_valid; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_wbMasterReceiver_bits_cyc; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_wbMasterReceiver_bits_stb; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_wbMasterReceiver_bits_we; // @[WishboneAdapter.scala 20:25]
  wire [31:0] wbSlave_io_wbMasterReceiver_bits_adr; // @[WishboneAdapter.scala 20:25]
  wire [31:0] wbSlave_io_wbMasterReceiver_bits_dat; // @[WishboneAdapter.scala 20:25]
  wire [3:0] wbSlave_io_wbMasterReceiver_bits_sel; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_reqOut_valid; // @[WishboneAdapter.scala 20:25]
  wire [31:0] wbSlave_io_reqOut_bits_addrRequest; // @[WishboneAdapter.scala 20:25]
  wire [31:0] wbSlave_io_reqOut_bits_dataRequest; // @[WishboneAdapter.scala 20:25]
  wire [3:0] wbSlave_io_reqOut_bits_activeByteLane; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_reqOut_bits_isWrite; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_rspIn_valid; // @[WishboneAdapter.scala 20:25]
  wire [31:0] wbSlave_io_rspIn_bits_dataResponse; // @[WishboneAdapter.scala 20:25]
  wire  wbSlave_io_rspIn_bits_error; // @[WishboneAdapter.scala 20:25]
  WishboneHost wbHost ( // @[WishboneAdapter.scala 19:24]
    .clock(wbHost_clock),
    .reset(wbHost_reset),
    .io_wbMasterTransmitter_ready(wbHost_io_wbMasterTransmitter_ready),
    .io_wbMasterTransmitter_valid(wbHost_io_wbMasterTransmitter_valid),
    .io_wbMasterTransmitter_bits_cyc(wbHost_io_wbMasterTransmitter_bits_cyc),
    .io_wbMasterTransmitter_bits_stb(wbHost_io_wbMasterTransmitter_bits_stb),
    .io_wbMasterTransmitter_bits_we(wbHost_io_wbMasterTransmitter_bits_we),
    .io_wbMasterTransmitter_bits_adr(wbHost_io_wbMasterTransmitter_bits_adr),
    .io_wbMasterTransmitter_bits_dat(wbHost_io_wbMasterTransmitter_bits_dat),
    .io_wbMasterTransmitter_bits_sel(wbHost_io_wbMasterTransmitter_bits_sel),
    .io_wbSlaveReceiver_ready(wbHost_io_wbSlaveReceiver_ready),
    .io_wbSlaveReceiver_bits_ack(wbHost_io_wbSlaveReceiver_bits_ack),
    .io_wbSlaveReceiver_bits_dat(wbHost_io_wbSlaveReceiver_bits_dat),
    .io_wbSlaveReceiver_bits_err(wbHost_io_wbSlaveReceiver_bits_err),
    .io_reqIn_ready(wbHost_io_reqIn_ready),
    .io_reqIn_valid(wbHost_io_reqIn_valid),
    .io_reqIn_bits_addrRequest(wbHost_io_reqIn_bits_addrRequest),
    .io_reqIn_bits_dataRequest(wbHost_io_reqIn_bits_dataRequest),
    .io_reqIn_bits_activeByteLane(wbHost_io_reqIn_bits_activeByteLane),
    .io_reqIn_bits_isWrite(wbHost_io_reqIn_bits_isWrite),
    .io_rspOut_valid(wbHost_io_rspOut_valid),
    .io_rspOut_bits_dataResponse(wbHost_io_rspOut_bits_dataResponse),
    .io_rspOut_bits_error(wbHost_io_rspOut_bits_error)
  );
  WishboneDevice wbSlave ( // @[WishboneAdapter.scala 20:25]
    .io_wbSlaveTransmitter_ready(wbSlave_io_wbSlaveTransmitter_ready),
    .io_wbSlaveTransmitter_bits_ack(wbSlave_io_wbSlaveTransmitter_bits_ack),
    .io_wbSlaveTransmitter_bits_dat(wbSlave_io_wbSlaveTransmitter_bits_dat),
    .io_wbSlaveTransmitter_bits_err(wbSlave_io_wbSlaveTransmitter_bits_err),
    .io_wbMasterReceiver_ready(wbSlave_io_wbMasterReceiver_ready),
    .io_wbMasterReceiver_valid(wbSlave_io_wbMasterReceiver_valid),
    .io_wbMasterReceiver_bits_cyc(wbSlave_io_wbMasterReceiver_bits_cyc),
    .io_wbMasterReceiver_bits_stb(wbSlave_io_wbMasterReceiver_bits_stb),
    .io_wbMasterReceiver_bits_we(wbSlave_io_wbMasterReceiver_bits_we),
    .io_wbMasterReceiver_bits_adr(wbSlave_io_wbMasterReceiver_bits_adr),
    .io_wbMasterReceiver_bits_dat(wbSlave_io_wbMasterReceiver_bits_dat),
    .io_wbMasterReceiver_bits_sel(wbSlave_io_wbMasterReceiver_bits_sel),
    .io_reqOut_valid(wbSlave_io_reqOut_valid),
    .io_reqOut_bits_addrRequest(wbSlave_io_reqOut_bits_addrRequest),
    .io_reqOut_bits_dataRequest(wbSlave_io_reqOut_bits_dataRequest),
    .io_reqOut_bits_activeByteLane(wbSlave_io_reqOut_bits_activeByteLane),
    .io_reqOut_bits_isWrite(wbSlave_io_reqOut_bits_isWrite),
    .io_rspIn_valid(wbSlave_io_rspIn_valid),
    .io_rspIn_bits_dataResponse(wbSlave_io_rspIn_bits_dataResponse),
    .io_rspIn_bits_error(wbSlave_io_rspIn_bits_error)
  );
  assign io_reqIn_ready = wbHost_io_reqIn_ready; // @[WishboneAdapter.scala 29:21]
  assign io_rspOut_valid = wbHost_io_rspOut_valid; // @[WishboneAdapter.scala 32:15]
  assign io_rspOut_bits_dataResponse = wbHost_io_rspOut_bits_dataResponse; // @[WishboneAdapter.scala 32:15]
  assign io_rspOut_bits_error = wbHost_io_rspOut_bits_error; // @[WishboneAdapter.scala 32:15]
  assign io_reqOut_valid = wbSlave_io_reqOut_valid; // @[WishboneAdapter.scala 35:15]
  assign io_reqOut_bits_addrRequest = wbSlave_io_reqOut_bits_addrRequest; // @[WishboneAdapter.scala 35:15]
  assign io_reqOut_bits_dataRequest = wbSlave_io_reqOut_bits_dataRequest; // @[WishboneAdapter.scala 35:15]
  assign io_reqOut_bits_activeByteLane = wbSlave_io_reqOut_bits_activeByteLane; // @[WishboneAdapter.scala 35:15]
  assign io_reqOut_bits_isWrite = wbSlave_io_reqOut_bits_isWrite; // @[WishboneAdapter.scala 35:15]
  assign wbHost_clock = clock;
  assign wbHost_reset = reset;
  assign wbHost_io_wbMasterTransmitter_ready = wbSlave_io_wbMasterReceiver_ready; // @[WishboneAdapter.scala 23:35]
  assign wbHost_io_wbSlaveReceiver_bits_ack = wbSlave_io_wbSlaveTransmitter_bits_ack; // @[WishboneAdapter.scala 26:35]
  assign wbHost_io_wbSlaveReceiver_bits_dat = wbSlave_io_wbSlaveTransmitter_bits_dat; // @[WishboneAdapter.scala 26:35]
  assign wbHost_io_wbSlaveReceiver_bits_err = wbSlave_io_wbSlaveTransmitter_bits_err; // @[WishboneAdapter.scala 26:35]
  assign wbHost_io_reqIn_valid = io_reqIn_valid; // @[WishboneAdapter.scala 29:21]
  assign wbHost_io_reqIn_bits_addrRequest = io_reqIn_bits_addrRequest; // @[WishboneAdapter.scala 29:21]
  assign wbHost_io_reqIn_bits_dataRequest = io_reqIn_bits_dataRequest; // @[WishboneAdapter.scala 29:21]
  assign wbHost_io_reqIn_bits_activeByteLane = io_reqIn_bits_activeByteLane; // @[WishboneAdapter.scala 29:21]
  assign wbHost_io_reqIn_bits_isWrite = io_reqIn_bits_isWrite; // @[WishboneAdapter.scala 29:21]
  assign wbSlave_io_wbSlaveTransmitter_ready = wbHost_io_wbSlaveReceiver_ready; // @[WishboneAdapter.scala 26:35]
  assign wbSlave_io_wbMasterReceiver_valid = wbHost_io_wbMasterTransmitter_valid; // @[WishboneAdapter.scala 23:35]
  assign wbSlave_io_wbMasterReceiver_bits_cyc = wbHost_io_wbMasterTransmitter_bits_cyc; // @[WishboneAdapter.scala 23:35]
  assign wbSlave_io_wbMasterReceiver_bits_stb = wbHost_io_wbMasterTransmitter_bits_stb; // @[WishboneAdapter.scala 23:35]
  assign wbSlave_io_wbMasterReceiver_bits_we = wbHost_io_wbMasterTransmitter_bits_we; // @[WishboneAdapter.scala 23:35]
  assign wbSlave_io_wbMasterReceiver_bits_adr = wbHost_io_wbMasterTransmitter_bits_adr; // @[WishboneAdapter.scala 23:35]
  assign wbSlave_io_wbMasterReceiver_bits_dat = wbHost_io_wbMasterTransmitter_bits_dat; // @[WishboneAdapter.scala 23:35]
  assign wbSlave_io_wbMasterReceiver_bits_sel = wbHost_io_wbMasterTransmitter_bits_sel; // @[WishboneAdapter.scala 23:35]
  assign wbSlave_io_rspIn_valid = io_rspIn_valid; // @[WishboneAdapter.scala 38:22]
  assign wbSlave_io_rspIn_bits_dataResponse = io_rspIn_bits_dataResponse; // @[WishboneAdapter.scala 38:22]
  assign wbSlave_io_rspIn_bits_error = io_rspIn_bits_error; // @[WishboneAdapter.scala 38:22]
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
  wire [31:0] mem_io_rsp_bits_dataResponse_MPORT_data; // @[BlockRam.scala 82:24]
  wire [9:0] mem_io_rsp_bits_dataResponse_MPORT_addr; // @[BlockRam.scala 82:24]
  wire [31:0] mem_MPORT_data; // @[BlockRam.scala 82:24]
  wire [9:0] mem_MPORT_addr; // @[BlockRam.scala 82:24]
  wire  mem_MPORT_mask; // @[BlockRam.scala 82:24]
  wire  mem_MPORT_en; // @[BlockRam.scala 82:24]
  reg  mem_io_rsp_bits_dataResponse_MPORT_en_pipe_0;
  reg [9:0] mem_io_rsp_bits_dataResponse_MPORT_addr_pipe_0;
  reg  validReg; // @[BlockRam.scala 72:25]
  reg  errReg; // @[BlockRam.scala 73:23]
  wire  _addrMisaligned_T = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  wire  addrMisaligned = _addrMisaligned_T & |io_req_bits_addrRequest[1:0]; // @[BlockRam.scala 78:24]
  wire [31:0] _addrOutOfBounds_T_1 = io_req_bits_addrRequest / 3'h4; // @[BlockRam.scala 79:65]
  wire  addrOutOfBounds = _addrMisaligned_T & _addrOutOfBounds_T_1 >= 32'h3ff; // @[BlockRam.scala 79:25]
  wire  _T_1 = ~io_req_bits_isWrite; // @[BlockRam.scala 88:25]
  wire  _T_2 = _addrMisaligned_T & ~io_req_bits_isWrite; // @[BlockRam.scala 88:22]
  wire  _T_4 = _addrMisaligned_T & io_req_bits_isWrite; // @[BlockRam.scala 92:29]
  wire  _GEN_9 = _addrMisaligned_T & ~io_req_bits_isWrite | _T_4; // @[BlockRam.scala 88:47 BlockRam.scala 91:14]
  assign mem_io_rsp_bits_dataResponse_MPORT_addr = mem_io_rsp_bits_dataResponse_MPORT_addr_pipe_0;
  assign mem_io_rsp_bits_dataResponse_MPORT_data = mem[mem_io_rsp_bits_dataResponse_MPORT_addr]; // @[BlockRam.scala 82:24]
  assign mem_MPORT_data = io_req_bits_dataRequest;
  assign mem_MPORT_addr = _addrOutOfBounds_T_1[9:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = _T_2 ? 1'h0 : _T_4;
  assign io_req_ready = 1'h1; // @[BlockRam.scala 76:16]
  assign io_rsp_valid = validReg; // @[BlockRam.scala 74:16]
  assign io_rsp_bits_dataResponse = mem_io_rsp_bits_dataResponse_MPORT_data; // @[BlockRam.scala 88:47 BlockRam.scala 90:30]
  assign io_rsp_bits_error = errReg; // @[BlockRam.scala 75:21]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[BlockRam.scala 82:24]
    end
    mem_io_rsp_bits_dataResponse_MPORT_en_pipe_0 <= _addrMisaligned_T & _T_1;
    if (_addrMisaligned_T & _T_1) begin
      mem_io_rsp_bits_dataResponse_MPORT_addr_pipe_0 <= _addrOutOfBounds_T_1[9:0];
    end
    if (reset) begin // @[BlockRam.scala 72:25]
      validReg <= 1'h0; // @[BlockRam.scala 72:25]
    end else begin
      validReg <= _GEN_9;
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
  wire [7:0] mem_0_MPORT_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_0_MPORT_addr; // @[BlockRam.scala 141:24]
  wire [7:0] mem_0_MPORT_1_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_0_MPORT_1_addr; // @[BlockRam.scala 141:24]
  wire  mem_0_MPORT_1_mask; // @[BlockRam.scala 141:24]
  wire  mem_0_MPORT_1_en; // @[BlockRam.scala 141:24]
  reg  mem_0_MPORT_en_pipe_0;
  reg [9:0] mem_0_MPORT_addr_pipe_0;
  reg [7:0] mem_1 [0:1023]; // @[BlockRam.scala 141:24]
  wire [7:0] mem_1_MPORT_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_1_MPORT_addr; // @[BlockRam.scala 141:24]
  wire [7:0] mem_1_MPORT_1_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_1_MPORT_1_addr; // @[BlockRam.scala 141:24]
  wire  mem_1_MPORT_1_mask; // @[BlockRam.scala 141:24]
  wire  mem_1_MPORT_1_en; // @[BlockRam.scala 141:24]
  reg  mem_1_MPORT_en_pipe_0;
  reg [9:0] mem_1_MPORT_addr_pipe_0;
  reg [7:0] mem_2 [0:1023]; // @[BlockRam.scala 141:24]
  wire [7:0] mem_2_MPORT_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_2_MPORT_addr; // @[BlockRam.scala 141:24]
  wire [7:0] mem_2_MPORT_1_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_2_MPORT_1_addr; // @[BlockRam.scala 141:24]
  wire  mem_2_MPORT_1_mask; // @[BlockRam.scala 141:24]
  wire  mem_2_MPORT_1_en; // @[BlockRam.scala 141:24]
  reg  mem_2_MPORT_en_pipe_0;
  reg [9:0] mem_2_MPORT_addr_pipe_0;
  reg [7:0] mem_3 [0:1023]; // @[BlockRam.scala 141:24]
  wire [7:0] mem_3_MPORT_data; // @[BlockRam.scala 141:24]
  wire [9:0] mem_3_MPORT_addr; // @[BlockRam.scala 141:24]
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
  wire  _T = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  wire  _T_1 = ~io_req_bits_isWrite; // @[BlockRam.scala 143:25]
  wire  _T_2 = _T & ~io_req_bits_isWrite; // @[BlockRam.scala 143:22]
  wire [31:0] _T_3 = io_req_bits_addrRequest / 3'h4; // @[BlockRam.scala 145:46]
  wire  _T_6 = _T & io_req_bits_isWrite; // @[BlockRam.scala 147:29]
  wire [7:0] rdata_0 = mem_0_MPORT_data; // @[BlockRam.scala 143:47 BlockRam.scala 145:11]
  wire [7:0] rdata_1 = mem_1_MPORT_data; // @[BlockRam.scala 143:47 BlockRam.scala 145:11]
  wire [7:0] rdata_2 = mem_2_MPORT_data; // @[BlockRam.scala 143:47 BlockRam.scala 145:11]
  wire [7:0] rdata_3 = mem_3_MPORT_data; // @[BlockRam.scala 143:47 BlockRam.scala 145:11]
  wire  _GEN_26 = _T & ~io_req_bits_isWrite | _T_6; // @[BlockRam.scala 143:47 BlockRam.scala 146:14]
  wire [7:0] data_0 = byteLane_0 ? rdata_0 : 8'h0; // @[BlockRam.scala 160:8]
  wire [7:0] data_1 = byteLane_1 ? rdata_1 : 8'h0; // @[BlockRam.scala 160:8]
  wire [7:0] data_2 = byteLane_2 ? rdata_2 : 8'h0; // @[BlockRam.scala 160:8]
  wire [7:0] data_3 = byteLane_3 ? rdata_3 : 8'h0; // @[BlockRam.scala 160:8]
  wire [15:0] io_rsp_bits_dataResponse_lo = {data_1,data_0}; // @[Cat.scala 30:58]
  wire [15:0] io_rsp_bits_dataResponse_hi = {data_3,data_2}; // @[Cat.scala 30:58]
  assign mem_0_MPORT_addr = mem_0_MPORT_addr_pipe_0;
  assign mem_0_MPORT_data = mem_0[mem_0_MPORT_addr]; // @[BlockRam.scala 141:24]
  assign mem_0_MPORT_1_data = io_req_bits_dataRequest[7:0];
  assign mem_0_MPORT_1_addr = _T_3[9:0];
  assign mem_0_MPORT_1_mask = io_req_bits_activeByteLane[0];
  assign mem_0_MPORT_1_en = _T_2 ? 1'h0 : _T_6;
  assign mem_1_MPORT_addr = mem_1_MPORT_addr_pipe_0;
  assign mem_1_MPORT_data = mem_1[mem_1_MPORT_addr]; // @[BlockRam.scala 141:24]
  assign mem_1_MPORT_1_data = io_req_bits_dataRequest[15:8];
  assign mem_1_MPORT_1_addr = _T_3[9:0];
  assign mem_1_MPORT_1_mask = io_req_bits_activeByteLane[1];
  assign mem_1_MPORT_1_en = _T_2 ? 1'h0 : _T_6;
  assign mem_2_MPORT_addr = mem_2_MPORT_addr_pipe_0;
  assign mem_2_MPORT_data = mem_2[mem_2_MPORT_addr]; // @[BlockRam.scala 141:24]
  assign mem_2_MPORT_1_data = io_req_bits_dataRequest[23:16];
  assign mem_2_MPORT_1_addr = _T_3[9:0];
  assign mem_2_MPORT_1_mask = io_req_bits_activeByteLane[2];
  assign mem_2_MPORT_1_en = _T_2 ? 1'h0 : _T_6;
  assign mem_3_MPORT_addr = mem_3_MPORT_addr_pipe_0;
  assign mem_3_MPORT_data = mem_3[mem_3_MPORT_addr]; // @[BlockRam.scala 141:24]
  assign mem_3_MPORT_1_data = io_req_bits_dataRequest[31:24];
  assign mem_3_MPORT_1_addr = _T_3[9:0];
  assign mem_3_MPORT_1_mask = io_req_bits_activeByteLane[3];
  assign mem_3_MPORT_1_en = _T_2 ? 1'h0 : _T_6;
  assign io_req_ready = 1'h1; // @[BlockRam.scala 139:16]
  assign io_rsp_valid = validReg; // @[BlockRam.scala 137:16]
  assign io_rsp_bits_dataResponse = {io_rsp_bits_dataResponse_hi,io_rsp_bits_dataResponse_lo}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if(mem_0_MPORT_1_en & mem_0_MPORT_1_mask) begin
      mem_0[mem_0_MPORT_1_addr] <= mem_0_MPORT_1_data; // @[BlockRam.scala 141:24]
    end
    mem_0_MPORT_en_pipe_0 <= _T & _T_1;
    if (_T & _T_1) begin
      mem_0_MPORT_addr_pipe_0 <= _T_3[9:0];
    end
    if(mem_1_MPORT_1_en & mem_1_MPORT_1_mask) begin
      mem_1[mem_1_MPORT_1_addr] <= mem_1_MPORT_1_data; // @[BlockRam.scala 141:24]
    end
    mem_1_MPORT_en_pipe_0 <= _T & _T_1;
    if (_T & _T_1) begin
      mem_1_MPORT_addr_pipe_0 <= _T_3[9:0];
    end
    if(mem_2_MPORT_1_en & mem_2_MPORT_1_mask) begin
      mem_2[mem_2_MPORT_1_addr] <= mem_2_MPORT_1_data; // @[BlockRam.scala 141:24]
    end
    mem_2_MPORT_en_pipe_0 <= _T & _T_1;
    if (_T & _T_1) begin
      mem_2_MPORT_addr_pipe_0 <= _T_3[9:0];
    end
    if(mem_3_MPORT_1_en & mem_3_MPORT_1_mask) begin
      mem_3[mem_3_MPORT_1_addr] <= mem_3_MPORT_1_data; // @[BlockRam.scala 141:24]
    end
    mem_3_MPORT_en_pipe_0 <= _T & _T_1;
    if (_T & _T_1) begin
      mem_3_MPORT_addr_pipe_0 <= _T_3[9:0];
    end
    if (reset) begin // @[BlockRam.scala 136:25]
      validReg <= 1'h0; // @[BlockRam.scala 136:25]
    end else begin
      validReg <= _GEN_26;
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
  wire  instr_adapter_clock; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_reset; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_reqIn_ready; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_reqIn_valid; // @[IbexJigsaw.scala 18:31]
  wire [31:0] instr_adapter_io_reqIn_bits_addrRequest; // @[IbexJigsaw.scala 18:31]
  wire [31:0] instr_adapter_io_reqIn_bits_dataRequest; // @[IbexJigsaw.scala 18:31]
  wire [3:0] instr_adapter_io_reqIn_bits_activeByteLane; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_reqIn_bits_isWrite; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_rspOut_valid; // @[IbexJigsaw.scala 18:31]
  wire [31:0] instr_adapter_io_rspOut_bits_dataResponse; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_rspOut_bits_error; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_reqOut_valid; // @[IbexJigsaw.scala 18:31]
  wire [31:0] instr_adapter_io_reqOut_bits_addrRequest; // @[IbexJigsaw.scala 18:31]
  wire [31:0] instr_adapter_io_reqOut_bits_dataRequest; // @[IbexJigsaw.scala 18:31]
  wire [3:0] instr_adapter_io_reqOut_bits_activeByteLane; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_reqOut_bits_isWrite; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_rspIn_valid; // @[IbexJigsaw.scala 18:31]
  wire [31:0] instr_adapter_io_rspIn_bits_dataResponse; // @[IbexJigsaw.scala 18:31]
  wire  instr_adapter_io_rspIn_bits_error; // @[IbexJigsaw.scala 18:31]
  wire  data_adapter_clock; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_reset; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_reqIn_ready; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_reqIn_valid; // @[IbexJigsaw.scala 19:30]
  wire [31:0] data_adapter_io_reqIn_bits_addrRequest; // @[IbexJigsaw.scala 19:30]
  wire [31:0] data_adapter_io_reqIn_bits_dataRequest; // @[IbexJigsaw.scala 19:30]
  wire [3:0] data_adapter_io_reqIn_bits_activeByteLane; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_reqIn_bits_isWrite; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_rspOut_valid; // @[IbexJigsaw.scala 19:30]
  wire [31:0] data_adapter_io_rspOut_bits_dataResponse; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_rspOut_bits_error; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_reqOut_valid; // @[IbexJigsaw.scala 19:30]
  wire [31:0] data_adapter_io_reqOut_bits_addrRequest; // @[IbexJigsaw.scala 19:30]
  wire [31:0] data_adapter_io_reqOut_bits_dataRequest; // @[IbexJigsaw.scala 19:30]
  wire [3:0] data_adapter_io_reqOut_bits_activeByteLane; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_reqOut_bits_isWrite; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_rspIn_valid; // @[IbexJigsaw.scala 19:30]
  wire [31:0] data_adapter_io_rspIn_bits_dataResponse; // @[IbexJigsaw.scala 19:30]
  wire  data_adapter_io_rspIn_bits_error; // @[IbexJigsaw.scala 19:30]
  wire  instr_mem_clock; // @[IbexJigsaw.scala 21:27]
  wire  instr_mem_reset; // @[IbexJigsaw.scala 21:27]
  wire  instr_mem_io_req_ready; // @[IbexJigsaw.scala 21:27]
  wire  instr_mem_io_req_valid; // @[IbexJigsaw.scala 21:27]
  wire [31:0] instr_mem_io_req_bits_addrRequest; // @[IbexJigsaw.scala 21:27]
  wire [31:0] instr_mem_io_req_bits_dataRequest; // @[IbexJigsaw.scala 21:27]
  wire  instr_mem_io_req_bits_isWrite; // @[IbexJigsaw.scala 21:27]
  wire  instr_mem_io_rsp_valid; // @[IbexJigsaw.scala 21:27]
  wire [31:0] instr_mem_io_rsp_bits_dataResponse; // @[IbexJigsaw.scala 21:27]
  wire  instr_mem_io_rsp_bits_error; // @[IbexJigsaw.scala 21:27]
  wire  data_mem_clock; // @[IbexJigsaw.scala 22:27]
  wire  data_mem_reset; // @[IbexJigsaw.scala 22:27]
  wire  data_mem_io_req_ready; // @[IbexJigsaw.scala 22:27]
  wire  data_mem_io_req_valid; // @[IbexJigsaw.scala 22:27]
  wire [31:0] data_mem_io_req_bits_addrRequest; // @[IbexJigsaw.scala 22:27]
  wire [31:0] data_mem_io_req_bits_dataRequest; // @[IbexJigsaw.scala 22:27]
  wire [3:0] data_mem_io_req_bits_activeByteLane; // @[IbexJigsaw.scala 22:27]
  wire  data_mem_io_req_bits_isWrite; // @[IbexJigsaw.scala 22:27]
  wire  data_mem_io_rsp_valid; // @[IbexJigsaw.scala 22:27]
  wire [31:0] data_mem_io_rsp_bits_dataResponse; // @[IbexJigsaw.scala 22:27]
  wire  ibex_clk_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_rst_ni; // @[IbexJigsaw.scala 32:22]
  wire  ibex_test_en_i; // @[IbexJigsaw.scala 32:22]
  wire [31:0] ibex_hart_id_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_instr_req_o; // @[IbexJigsaw.scala 32:22]
  wire  ibex_instr_gnt_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_instr_rvalid_i; // @[IbexJigsaw.scala 32:22]
  wire [31:0] ibex_instr_addr_o; // @[IbexJigsaw.scala 32:22]
  wire [31:0] ibex_instr_rdata_i; // @[IbexJigsaw.scala 32:22]
  wire [6:0] ibex_instr_rdata_intg_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_instr_err_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_data_req_o; // @[IbexJigsaw.scala 32:22]
  wire  ibex_data_gnt_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_data_rvalid_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_data_we_o; // @[IbexJigsaw.scala 32:22]
  wire [3:0] ibex_data_be_o; // @[IbexJigsaw.scala 32:22]
  wire [31:0] ibex_data_addr_o; // @[IbexJigsaw.scala 32:22]
  wire [31:0] ibex_data_wdata_o; // @[IbexJigsaw.scala 32:22]
  wire [6:0] ibex_data_wdata_intg_o; // @[IbexJigsaw.scala 32:22]
  wire [31:0] ibex_data_rdata_i; // @[IbexJigsaw.scala 32:22]
  wire [6:0] ibex_data_rdata_intg_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_data_err_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_irq_software_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_irq_timer_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_irq_external_i; // @[IbexJigsaw.scala 32:22]
  wire [14:0] ibex_irq_fast_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_irq_nm_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_debug_req_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_crash_dump_o; // @[IbexJigsaw.scala 32:22]
  wire  ibex_fetch_enable_i; // @[IbexJigsaw.scala 32:22]
  wire  ibex_alert_minor_o; // @[IbexJigsaw.scala 32:22]
  wire  ibex_alert_major_o; // @[IbexJigsaw.scala 32:22]
  wire  ibex_core_sleep_o; // @[IbexJigsaw.scala 32:22]
  wire  ibex_scan_rst_ni; // @[IbexJigsaw.scala 32:22]
  WishboneAdapter instr_adapter ( // @[IbexJigsaw.scala 18:31]
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
  WishboneAdapter data_adapter ( // @[IbexJigsaw.scala 19:30]
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
  BlockRamWithoutMasking instr_mem ( // @[IbexJigsaw.scala 21:27]
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
  BlockRamWithMasking data_mem ( // @[IbexJigsaw.scala 22:27]
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
    ibex ( // @[IbexJigsaw.scala 32:22]
    .clk_i(ibex_clk_i),
    .rst_ni(ibex_rst_ni),
    .test_en_i(ibex_test_en_i),
    .hart_id_i(ibex_hart_id_i),
    .instr_req_o(ibex_instr_req_o),
    .instr_gnt_i(ibex_instr_gnt_i),
    .instr_rvalid_i(ibex_instr_rvalid_i),
    .instr_addr_o(ibex_instr_addr_o),
    .instr_rdata_i(ibex_instr_rdata_i),
    .instr_rdata_intg_i(ibex_instr_rdata_intg_i),
    .instr_err_i(ibex_instr_err_i),
    .data_req_o(ibex_data_req_o),
    .data_gnt_i(ibex_data_gnt_i),
    .data_rvalid_i(ibex_data_rvalid_i),
    .data_we_o(ibex_data_we_o),
    .data_be_o(ibex_data_be_o),
    .data_addr_o(ibex_data_addr_o),
    .data_wdata_o(ibex_data_wdata_o),
    .data_wdata_intg_o(ibex_data_wdata_intg_o),
    .data_rdata_i(ibex_data_rdata_i),
    .data_rdata_intg_i(ibex_data_rdata_intg_i),
    .data_err_i(ibex_data_err_i),
    .irq_software_i(ibex_irq_software_i),
    .irq_timer_i(ibex_irq_timer_i),
    .irq_external_i(ibex_irq_external_i),
    .irq_fast_i(ibex_irq_fast_i),
    .irq_nm_i(ibex_irq_nm_i),
    .debug_req_i(ibex_debug_req_i),
    .crash_dump_o(ibex_crash_dump_o),
    .fetch_enable_i(ibex_fetch_enable_i),
    .alert_minor_o(ibex_alert_minor_o),
    .alert_major_o(ibex_alert_major_o),
    .core_sleep_o(ibex_core_sleep_o),
    .scan_rst_ni(ibex_scan_rst_ni)
  );
  assign io_pin = ibex_core_sleep_o; // @[IbexJigsaw.scala 75:12]
  assign instr_adapter_clock = clock;
  assign instr_adapter_reset = reset;
  assign instr_adapter_io_reqIn_valid = ibex_instr_req_o; // @[IbexJigsaw.scala 39:34]
  assign instr_adapter_io_reqIn_bits_addrRequest = ibex_instr_addr_o; // @[IbexJigsaw.scala 40:45]
  assign instr_adapter_io_reqIn_bits_dataRequest = 32'h0; // @[IbexJigsaw.scala 43:45]
  assign instr_adapter_io_reqIn_bits_activeByteLane = 4'h0; // @[IbexJigsaw.scala 42:48]
  assign instr_adapter_io_reqIn_bits_isWrite = 1'h0; // @[IbexJigsaw.scala 41:41]
  assign instr_adapter_io_rspIn_valid = instr_mem_io_rsp_valid; // @[IbexJigsaw.scala 25:22]
  assign instr_adapter_io_rspIn_bits_dataResponse = instr_mem_io_rsp_bits_dataResponse; // @[IbexJigsaw.scala 25:22]
  assign instr_adapter_io_rspIn_bits_error = instr_mem_io_rsp_bits_error; // @[IbexJigsaw.scala 25:22]
  assign data_adapter_clock = clock;
  assign data_adapter_reset = reset;
  assign data_adapter_io_reqIn_valid = ibex_data_req_o; // @[IbexJigsaw.scala 53:33]
  assign data_adapter_io_reqIn_bits_addrRequest = ibex_data_addr_o; // @[IbexJigsaw.scala 54:44]
  assign data_adapter_io_reqIn_bits_dataRequest = ibex_data_wdata_o; // @[IbexJigsaw.scala 55:44]
  assign data_adapter_io_reqIn_bits_activeByteLane = ibex_data_be_o; // @[IbexJigsaw.scala 57:47]
  assign data_adapter_io_reqIn_bits_isWrite = ibex_data_we_o; // @[IbexJigsaw.scala 56:40]
  assign data_adapter_io_rspIn_valid = data_mem_io_rsp_valid; // @[IbexJigsaw.scala 28:21]
  assign data_adapter_io_rspIn_bits_dataResponse = data_mem_io_rsp_bits_dataResponse; // @[IbexJigsaw.scala 28:21]
  assign data_adapter_io_rspIn_bits_error = 1'h0; // @[IbexJigsaw.scala 28:21]
  assign instr_mem_clock = clock;
  assign instr_mem_reset = reset;
  assign instr_mem_io_req_valid = instr_adapter_io_reqOut_valid; // @[IbexJigsaw.scala 24:29]
  assign instr_mem_io_req_bits_addrRequest = instr_adapter_io_reqOut_bits_addrRequest; // @[IbexJigsaw.scala 24:29]
  assign instr_mem_io_req_bits_dataRequest = instr_adapter_io_reqOut_bits_dataRequest; // @[IbexJigsaw.scala 24:29]
  assign instr_mem_io_req_bits_isWrite = instr_adapter_io_reqOut_bits_isWrite; // @[IbexJigsaw.scala 24:29]
  assign data_mem_clock = clock;
  assign data_mem_reset = reset;
  assign data_mem_io_req_valid = data_adapter_io_reqOut_valid; // @[IbexJigsaw.scala 27:28]
  assign data_mem_io_req_bits_addrRequest = data_adapter_io_reqOut_bits_addrRequest; // @[IbexJigsaw.scala 27:28]
  assign data_mem_io_req_bits_dataRequest = data_adapter_io_reqOut_bits_dataRequest; // @[IbexJigsaw.scala 27:28]
  assign data_mem_io_req_bits_activeByteLane = data_adapter_io_reqOut_bits_activeByteLane; // @[IbexJigsaw.scala 27:28]
  assign data_mem_io_req_bits_isWrite = data_adapter_io_reqOut_bits_isWrite; // @[IbexJigsaw.scala 27:28]
  assign ibex_clk_i = clock; // @[IbexJigsaw.scala 33:19]
  assign ibex_rst_ni = reset; // @[IbexJigsaw.scala 34:20]
  assign ibex_test_en_i = 1'h0; // @[IbexJigsaw.scala 35:23]
  assign ibex_hart_id_i = 32'h0; // @[IbexJigsaw.scala 36:23]
  assign ibex_instr_gnt_i = instr_adapter_io_reqIn_ready; // @[IbexJigsaw.scala 44:25]
  assign ibex_instr_rvalid_i = instr_adapter_io_rspOut_valid; // @[IbexJigsaw.scala 45:28]
  assign ibex_instr_rdata_i = instr_adapter_io_rspOut_bits_dataResponse; // @[IbexJigsaw.scala 46:27]
  assign ibex_instr_rdata_intg_i = 7'h0; // @[IbexJigsaw.scala 47:32]
  assign ibex_instr_err_i = instr_adapter_io_rspOut_bits_error; // @[IbexJigsaw.scala 48:25]
  assign ibex_data_gnt_i = data_adapter_io_reqIn_ready; // @[IbexJigsaw.scala 58:24]
  assign ibex_data_rvalid_i = data_adapter_io_rspOut_valid; // @[IbexJigsaw.scala 59:27]
  assign ibex_data_rdata_i = data_adapter_io_rspOut_bits_dataResponse; // @[IbexJigsaw.scala 60:26]
  assign ibex_data_rdata_intg_i = 7'h0; // @[IbexJigsaw.scala 61:31]
  assign ibex_data_err_i = data_adapter_io_rspOut_bits_error; // @[IbexJigsaw.scala 62:24]
  assign ibex_irq_software_i = 1'h0; // @[IbexJigsaw.scala 67:28]
  assign ibex_irq_timer_i = 1'h0; // @[IbexJigsaw.scala 68:25]
  assign ibex_irq_external_i = 1'h0; // @[IbexJigsaw.scala 69:28]
  assign ibex_irq_fast_i = 15'h0; // @[IbexJigsaw.scala 70:24]
  assign ibex_irq_nm_i = 1'h0; // @[IbexJigsaw.scala 71:22]
  assign ibex_debug_req_i = 1'h0; // @[IbexJigsaw.scala 66:25]
  assign ibex_fetch_enable_i = 1'h1; // @[IbexJigsaw.scala 72:28]
  assign ibex_scan_rst_ni = 1'h1; // @[IbexJigsaw.scala 73:25]
endmodule
