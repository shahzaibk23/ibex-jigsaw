;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit IbexJigsaw : 
  module WishboneHost : 
    input clock : Clock
    input reset : Reset
    output io : {wbMasterTransmitter : {flip ready : UInt<1>, valid : UInt<1>, bits : {cyc : UInt<1>, stb : UInt<1>, we : UInt<1>, adr : UInt<32>, dat : UInt<32>, sel : UInt<4>}}, flip wbSlaveReceiver : {flip ready : UInt<1>, valid : UInt<1>, bits : {ack : UInt<1>, dat : UInt<32>, err : UInt<1>}}, flip reqIn : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rspOut : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}}
    
    io.wbMasterTransmitter.valid <= io.wbMasterTransmitter.bits.stb @[WishboneHost.scala 23:32]
    io.wbSlaveReceiver.ready <= UInt<1>("h01") @[WishboneHost.scala 26:28]
    node _T = asUInt(reset) @[WishboneHost.scala 30:20]
    node _T_1 = eq(_T, UInt<1>("h01")) @[WishboneHost.scala 30:23]
    when _T_1 : @[WishboneHost.scala 30:35]
      io.wbMasterTransmitter.bits.sel <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.dat <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.adr <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.we <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.stb <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.cyc <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      skip @[WishboneHost.scala 30:35]
    reg startWBTransaction : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 39:35]
    reg dataReg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[WishboneHost.scala 41:24]
    reg respReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 42:24]
    reg errReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 43:23]
    reg ackReg : UInt<1>, clock with : (reset => (reset, io.wbSlaveReceiver.bits.ack)) @[WishboneHost.scala 44:23]
    reg stbReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 46:23]
    reg cycReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 47:23]
    reg weReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 48:22]
    reg datReg : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 49:23]
    reg adrReg : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 50:23]
    reg selReg : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 51:23]
    reg stateReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 56:25]
    reg readyReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[WishboneHost.scala 62:25]
    node _T_2 = and(io.reqIn.valid, io.wbMasterTransmitter.ready) @[WishboneHost.scala 18:37]
    when _T_2 : @[WishboneHost.scala 63:14]
      readyReg <= UInt<1>("h00") @[WishboneHost.scala 64:14]
      skip @[WishboneHost.scala 63:14]
    node _T_3 = eq(stateReg, UInt<1>("h01")) @[WishboneHost.scala 66:17]
    when _T_3 : @[WishboneHost.scala 66:33]
      readyReg <= UInt<1>("h01") @[WishboneHost.scala 67:14]
      skip @[WishboneHost.scala 66:33]
    io.reqIn.ready <= readyReg @[WishboneHost.scala 76:20]
    node _T_4 = eq(io.reqIn.bits.isWrite, UInt<1>("h00")) @[WishboneHost.scala 77:32]
    node _T_5 = eq(readyReg, UInt<1>("h01")) @[WishboneHost.scala 77:56]
    node _T_6 = and(_T_4, _T_5) @[WishboneHost.scala 77:44]
    node _T_7 = and(_T_6, io.reqIn.valid) @[WishboneHost.scala 77:67]
    when _T_7 : @[WishboneHost.scala 77:86]
      startWBTransaction <= UInt<1>("h01") @[WishboneHost.scala 78:26]
      stbReg <= UInt<1>("h01") @[WishboneHost.scala 79:14]
      cycReg <= UInt<1>("h01") @[WishboneHost.scala 80:14]
      weReg <= io.reqIn.bits.isWrite @[WishboneHost.scala 81:13]
      adrReg <= io.reqIn.bits.addrRequest @[WishboneHost.scala 82:14]
      datReg <= UInt<1>("h00") @[WishboneHost.scala 83:14]
      selReg <= io.reqIn.bits.activeByteLane @[WishboneHost.scala 84:14]
      skip @[WishboneHost.scala 77:86]
    else : @[WishboneHost.scala 85:92]
      node _T_8 = eq(io.reqIn.bits.isWrite, UInt<1>("h01")) @[WishboneHost.scala 85:39]
      node _T_9 = eq(readyReg, UInt<1>("h01")) @[WishboneHost.scala 85:62]
      node _T_10 = and(_T_8, _T_9) @[WishboneHost.scala 85:50]
      node _T_11 = and(_T_10, io.reqIn.valid) @[WishboneHost.scala 85:73]
      when _T_11 : @[WishboneHost.scala 85:92]
        startWBTransaction <= UInt<1>("h01") @[WishboneHost.scala 86:26]
        stbReg <= UInt<1>("h01") @[WishboneHost.scala 87:14]
        cycReg <= UInt<1>("h01") @[WishboneHost.scala 88:14]
        weReg <= io.reqIn.bits.isWrite @[WishboneHost.scala 89:13]
        adrReg <= io.reqIn.bits.addrRequest @[WishboneHost.scala 90:14]
        datReg <= io.reqIn.bits.dataRequest @[WishboneHost.scala 91:14]
        selReg <= io.reqIn.bits.activeByteLane @[WishboneHost.scala 92:14]
        skip @[WishboneHost.scala 85:92]
    io.wbMasterTransmitter.bits.stb <= stbReg @[WishboneHost.scala 95:37]
    io.wbMasterTransmitter.bits.cyc <= cycReg @[WishboneHost.scala 96:37]
    io.wbMasterTransmitter.bits.we <= weReg @[WishboneHost.scala 97:36]
    io.wbMasterTransmitter.bits.adr <= adrReg @[WishboneHost.scala 98:37]
    io.wbMasterTransmitter.bits.dat <= datReg @[WishboneHost.scala 99:37]
    io.wbMasterTransmitter.bits.sel <= selReg @[WishboneHost.scala 100:37]
    node _T_12 = eq(startWBTransaction, UInt<1>("h00")) @[WishboneHost.scala 102:10]
    when _T_12 : @[WishboneHost.scala 102:31]
      io.wbMasterTransmitter.bits.sel <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.dat <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.adr <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.we <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.stb <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.cyc <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      skip @[WishboneHost.scala 102:31]
    node _T_13 = eq(io.wbSlaveReceiver.bits.err, UInt<1>("h00")) @[WishboneHost.scala 106:41]
    node _T_14 = and(io.wbSlaveReceiver.bits.ack, _T_13) @[WishboneHost.scala 106:38]
    when _T_14 : @[WishboneHost.scala 106:71]
      dataReg <= io.wbSlaveReceiver.bits.dat @[WishboneHost.scala 107:15]
      respReg <= UInt<1>("h01") @[WishboneHost.scala 108:15]
      errReg <= UInt<1>("h00") @[WishboneHost.scala 109:14]
      startWBTransaction <= UInt<1>("h00") @[WishboneHost.scala 111:26]
      skip @[WishboneHost.scala 106:71]
    else : @[WishboneHost.scala 112:78]
      node _T_15 = eq(io.wbSlaveReceiver.bits.ack, UInt<1>("h00")) @[WishboneHost.scala 112:48]
      node _T_16 = and(io.wbSlaveReceiver.bits.err, _T_15) @[WishboneHost.scala 112:45]
      when _T_16 : @[WishboneHost.scala 112:78]
        dataReg <= io.wbSlaveReceiver.bits.dat @[WishboneHost.scala 113:15]
        respReg <= UInt<1>("h01") @[WishboneHost.scala 114:15]
        errReg <= UInt<1>("h01") @[WishboneHost.scala 115:14]
        startWBTransaction <= UInt<1>("h00") @[WishboneHost.scala 116:26]
        skip @[WishboneHost.scala 112:78]
    node _T_17 = eq(stateReg, UInt<1>("h00")) @[WishboneHost.scala 119:19]
    when _T_17 : @[WishboneHost.scala 119:29]
      node _stateReg_T = or(io.wbSlaveReceiver.bits.ack, io.wbSlaveReceiver.bits.err) @[WishboneHost.scala 120:51]
      node _stateReg_T_1 = mux(_stateReg_T, UInt<1>("h01"), UInt<1>("h00")) @[WishboneHost.scala 120:22]
      stateReg <= _stateReg_T_1 @[WishboneHost.scala 120:16]
      skip @[WishboneHost.scala 119:29]
    else : @[WishboneHost.scala 121:42]
      node _T_18 = eq(stateReg, UInt<1>("h01")) @[WishboneHost.scala 121:26]
      when _T_18 : @[WishboneHost.scala 121:42]
        respReg <= UInt<1>("h00") @[WishboneHost.scala 122:15]
        stateReg <= UInt<1>("h00") @[WishboneHost.scala 123:16]
        skip @[WishboneHost.scala 121:42]
    io.rspOut.valid <= respReg @[WishboneHost.scala 128:21]
    io.rspOut.bits.dataResponse <= dataReg @[WishboneHost.scala 129:33]
    io.rspOut.bits.error <= errReg @[WishboneHost.scala 130:26]
    
  module WishboneDevice : 
    input clock : Clock
    input reset : Reset
    output io : {wbSlaveTransmitter : {flip ready : UInt<1>, valid : UInt<1>, bits : {ack : UInt<1>, dat : UInt<32>, err : UInt<1>}}, flip wbMasterReceiver : {flip ready : UInt<1>, valid : UInt<1>, bits : {cyc : UInt<1>, stb : UInt<1>, we : UInt<1>, adr : UInt<32>, dat : UInt<32>, sel : UInt<4>}}, reqOut : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, flip rspIn : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}}
    
    wire ack : UInt<1>
    ack <= UInt<1>("h00")
    io.wbMasterReceiver.ready <= UInt<1>("h01") @[WishboneDevice.scala 19:29]
    io.rspIn.ready <= UInt<1>("h01") @[WishboneDevice.scala 23:18]
    node _T = and(io.wbMasterReceiver.valid, io.wbMasterReceiver.bits.cyc) @[WishboneDevice.scala 16:48]
    node _T_1 = and(_T, io.wbMasterReceiver.bits.stb) @[WishboneDevice.scala 16:80]
    when _T_1 : @[WishboneDevice.scala 25:16]
      node _T_2 = eq(io.wbMasterReceiver.bits.we, UInt<1>("h00")) @[WishboneDevice.scala 26:10]
      when _T_2 : @[WishboneDevice.scala 26:40]
        io.reqOut.valid <= UInt<1>("h01") @[WishboneDevice.scala 31:23]
        io.reqOut.bits.addrRequest <= io.wbMasterReceiver.bits.adr @[WishboneDevice.scala 32:34]
        io.reqOut.bits.dataRequest is invalid @[WishboneDevice.scala 33:34]
        io.reqOut.bits.activeByteLane <= io.wbMasterReceiver.bits.sel @[WishboneDevice.scala 34:37]
        io.reqOut.bits.isWrite <= UInt<1>("h00") @[WishboneDevice.scala 35:30]
        node _T_3 = eq(io.rspIn.bits.error, UInt<1>("h00")) @[WishboneDevice.scala 36:30]
        node _T_4 = and(io.rspIn.valid, _T_3) @[WishboneDevice.scala 36:27]
        when _T_4 : @[WishboneDevice.scala 36:52]
          io.wbSlaveTransmitter.valid <= UInt<1>("h01") @[WishboneDevice.scala 38:37]
          ack <= UInt<1>("h01") @[WishboneDevice.scala 39:13]
          io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 40:40]
          io.wbSlaveTransmitter.bits.dat <= io.rspIn.bits.dataResponse @[WishboneDevice.scala 41:40]
          skip @[WishboneDevice.scala 36:52]
        else : @[WishboneDevice.scala 42:58]
          node _T_5 = and(io.rspIn.valid, io.rspIn.bits.error) @[WishboneDevice.scala 42:34]
          when _T_5 : @[WishboneDevice.scala 42:58]
            io.wbSlaveTransmitter.valid <= UInt<1>("h01") @[WishboneDevice.scala 43:37]
            ack <= UInt<1>("h00") @[WishboneDevice.scala 44:13]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h01") @[WishboneDevice.scala 45:40]
            io.wbSlaveTransmitter.bits.dat <= io.rspIn.bits.dataResponse @[WishboneDevice.scala 46:40]
            skip @[WishboneDevice.scala 42:58]
          else : @[WishboneDevice.scala 47:20]
            io.wbSlaveTransmitter.valid <= UInt<1>("h00") @[WishboneDevice.scala 48:37]
            ack <= UInt<1>("h00") @[WishboneDevice.scala 49:13]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 50:40]
            io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 51:40]
            skip @[WishboneDevice.scala 47:20]
        skip @[WishboneDevice.scala 26:40]
      else : @[WishboneDevice.scala 53:18]
        io.reqOut.valid <= UInt<1>("h01") @[WishboneDevice.scala 55:23]
        io.reqOut.bits.addrRequest <= io.wbMasterReceiver.bits.adr @[WishboneDevice.scala 56:34]
        io.reqOut.bits.dataRequest <= io.wbMasterReceiver.bits.dat @[WishboneDevice.scala 57:34]
        io.reqOut.bits.activeByteLane <= io.wbMasterReceiver.bits.sel @[WishboneDevice.scala 58:37]
        io.reqOut.bits.isWrite <= io.wbMasterReceiver.bits.we @[WishboneDevice.scala 59:30]
        node _T_6 = eq(io.rspIn.bits.error, UInt<1>("h00")) @[WishboneDevice.scala 60:30]
        node _T_7 = and(io.rspIn.valid, _T_6) @[WishboneDevice.scala 60:27]
        when _T_7 : @[WishboneDevice.scala 60:52]
          io.wbSlaveTransmitter.valid <= UInt<1>("h01") @[WishboneDevice.scala 61:37]
          ack <= UInt<1>("h01") @[WishboneDevice.scala 62:13]
          io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 63:40]
          io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 64:40]
          skip @[WishboneDevice.scala 60:52]
        else : @[WishboneDevice.scala 65:58]
          node _T_8 = and(io.rspIn.valid, io.rspIn.bits.error) @[WishboneDevice.scala 65:34]
          when _T_8 : @[WishboneDevice.scala 65:58]
            io.wbSlaveTransmitter.valid <= UInt<1>("h01") @[WishboneDevice.scala 66:37]
            ack <= UInt<1>("h00") @[WishboneDevice.scala 67:13]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h01") @[WishboneDevice.scala 68:40]
            io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 69:40]
            skip @[WishboneDevice.scala 65:58]
          else : @[WishboneDevice.scala 70:20]
            io.wbSlaveTransmitter.valid <= UInt<1>("h00") @[WishboneDevice.scala 71:37]
            ack <= UInt<1>("h00") @[WishboneDevice.scala 72:13]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 73:40]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 74:40]
            io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 75:40]
            skip @[WishboneDevice.scala 70:20]
        skip @[WishboneDevice.scala 53:18]
      skip @[WishboneDevice.scala 25:16]
    else : @[WishboneDevice.scala 79:16]
      io.reqOut.valid <= UInt<1>("h00") @[WishboneDevice.scala 81:21]
      io.reqOut.bits.addrRequest is invalid @[WishboneDevice.scala 82:32]
      io.reqOut.bits.dataRequest is invalid @[WishboneDevice.scala 83:32]
      io.reqOut.bits.activeByteLane is invalid @[WishboneDevice.scala 84:35]
      io.reqOut.bits.isWrite is invalid @[WishboneDevice.scala 85:28]
      io.wbSlaveTransmitter.valid <= UInt<1>("h00") @[WishboneDevice.scala 87:33]
      ack <= UInt<1>("h00") @[WishboneDevice.scala 88:9]
      io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 89:36]
      io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 90:36]
      skip @[WishboneDevice.scala 79:16]
    io.wbSlaveTransmitter.bits.ack <= ack @[WishboneDevice.scala 93:34]
    
  module WishboneAdapter : 
    input clock : Clock
    input reset : Reset
    output io : {flip reqIn : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rspOut : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}, reqOut : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, flip rspIn : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}}
    
    inst wbHost of WishboneHost @[WishboneAdapter.scala 19:24]
    wbHost.clock <= clock
    wbHost.reset <= reset
    inst wbSlave of WishboneDevice @[WishboneAdapter.scala 20:25]
    wbSlave.clock <= clock
    wbSlave.reset <= reset
    wbSlave.io.wbMasterReceiver.bits.sel <= wbHost.io.wbMasterTransmitter.bits.sel @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.dat <= wbHost.io.wbMasterTransmitter.bits.dat @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.adr <= wbHost.io.wbMasterTransmitter.bits.adr @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.we <= wbHost.io.wbMasterTransmitter.bits.we @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.stb <= wbHost.io.wbMasterTransmitter.bits.stb @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.cyc <= wbHost.io.wbMasterTransmitter.bits.cyc @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.valid <= wbHost.io.wbMasterTransmitter.valid @[WishboneAdapter.scala 23:35]
    wbHost.io.wbMasterTransmitter.ready <= wbSlave.io.wbMasterReceiver.ready @[WishboneAdapter.scala 23:35]
    wbHost.io.wbSlaveReceiver.bits.err <= wbSlave.io.wbSlaveTransmitter.bits.err @[WishboneAdapter.scala 26:35]
    wbHost.io.wbSlaveReceiver.bits.dat <= wbSlave.io.wbSlaveTransmitter.bits.dat @[WishboneAdapter.scala 26:35]
    wbHost.io.wbSlaveReceiver.bits.ack <= wbSlave.io.wbSlaveTransmitter.bits.ack @[WishboneAdapter.scala 26:35]
    wbHost.io.wbSlaveReceiver.valid <= wbSlave.io.wbSlaveTransmitter.valid @[WishboneAdapter.scala 26:35]
    wbSlave.io.wbSlaveTransmitter.ready <= wbHost.io.wbSlaveReceiver.ready @[WishboneAdapter.scala 26:35]
    wbHost.io.reqIn.bits.isWrite <= io.reqIn.bits.isWrite @[WishboneAdapter.scala 29:21]
    wbHost.io.reqIn.bits.activeByteLane <= io.reqIn.bits.activeByteLane @[WishboneAdapter.scala 29:21]
    wbHost.io.reqIn.bits.dataRequest <= io.reqIn.bits.dataRequest @[WishboneAdapter.scala 29:21]
    wbHost.io.reqIn.bits.addrRequest <= io.reqIn.bits.addrRequest @[WishboneAdapter.scala 29:21]
    wbHost.io.reqIn.valid <= io.reqIn.valid @[WishboneAdapter.scala 29:21]
    io.reqIn.ready <= wbHost.io.reqIn.ready @[WishboneAdapter.scala 29:21]
    io.rspOut.bits.error <= wbHost.io.rspOut.bits.error @[WishboneAdapter.scala 32:15]
    io.rspOut.bits.dataResponse <= wbHost.io.rspOut.bits.dataResponse @[WishboneAdapter.scala 32:15]
    io.rspOut.valid <= wbHost.io.rspOut.valid @[WishboneAdapter.scala 32:15]
    wbHost.io.rspOut.ready <= io.rspOut.ready @[WishboneAdapter.scala 32:15]
    io.reqOut.bits.isWrite <= wbSlave.io.reqOut.bits.isWrite @[WishboneAdapter.scala 35:15]
    io.reqOut.bits.activeByteLane <= wbSlave.io.reqOut.bits.activeByteLane @[WishboneAdapter.scala 35:15]
    io.reqOut.bits.dataRequest <= wbSlave.io.reqOut.bits.dataRequest @[WishboneAdapter.scala 35:15]
    io.reqOut.bits.addrRequest <= wbSlave.io.reqOut.bits.addrRequest @[WishboneAdapter.scala 35:15]
    io.reqOut.valid <= wbSlave.io.reqOut.valid @[WishboneAdapter.scala 35:15]
    wbSlave.io.reqOut.ready <= io.reqOut.ready @[WishboneAdapter.scala 35:15]
    wbSlave.io.rspIn.bits.error <= io.rspIn.bits.error @[WishboneAdapter.scala 38:22]
    wbSlave.io.rspIn.bits.dataResponse <= io.rspIn.bits.dataResponse @[WishboneAdapter.scala 38:22]
    wbSlave.io.rspIn.valid <= io.rspIn.valid @[WishboneAdapter.scala 38:22]
    io.rspIn.ready <= wbSlave.io.rspIn.ready @[WishboneAdapter.scala 38:22]
    
  module WishboneHost_1 : 
    input clock : Clock
    input reset : Reset
    output io : {wbMasterTransmitter : {flip ready : UInt<1>, valid : UInt<1>, bits : {cyc : UInt<1>, stb : UInt<1>, we : UInt<1>, adr : UInt<32>, dat : UInt<32>, sel : UInt<4>}}, flip wbSlaveReceiver : {flip ready : UInt<1>, valid : UInt<1>, bits : {ack : UInt<1>, dat : UInt<32>, err : UInt<1>}}, flip reqIn : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rspOut : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}}
    
    io.wbMasterTransmitter.valid <= io.wbMasterTransmitter.bits.stb @[WishboneHost.scala 23:32]
    io.wbSlaveReceiver.ready <= UInt<1>("h01") @[WishboneHost.scala 26:28]
    node _T = asUInt(reset) @[WishboneHost.scala 30:20]
    node _T_1 = eq(_T, UInt<1>("h01")) @[WishboneHost.scala 30:23]
    when _T_1 : @[WishboneHost.scala 30:35]
      io.wbMasterTransmitter.bits.sel <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.dat <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.adr <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.we <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.stb <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      io.wbMasterTransmitter.bits.cyc <= UInt<1>("h00") @[WishboneHost.scala 37:116]
      skip @[WishboneHost.scala 30:35]
    reg startWBTransaction : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 39:35]
    reg dataReg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[WishboneHost.scala 41:24]
    reg respReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 42:24]
    reg errReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 43:23]
    reg ackReg : UInt<1>, clock with : (reset => (reset, io.wbSlaveReceiver.bits.ack)) @[WishboneHost.scala 44:23]
    reg stbReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 46:23]
    reg cycReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 47:23]
    reg weReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 48:22]
    reg datReg : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 49:23]
    reg adrReg : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 50:23]
    reg selReg : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 51:23]
    reg stateReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[WishboneHost.scala 56:25]
    reg readyReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[WishboneHost.scala 62:25]
    node _T_2 = and(io.reqIn.valid, io.wbMasterTransmitter.ready) @[WishboneHost.scala 18:37]
    when _T_2 : @[WishboneHost.scala 63:14]
      readyReg <= UInt<1>("h00") @[WishboneHost.scala 64:14]
      skip @[WishboneHost.scala 63:14]
    node _T_3 = eq(stateReg, UInt<1>("h01")) @[WishboneHost.scala 66:17]
    when _T_3 : @[WishboneHost.scala 66:33]
      readyReg <= UInt<1>("h01") @[WishboneHost.scala 67:14]
      skip @[WishboneHost.scala 66:33]
    io.reqIn.ready <= readyReg @[WishboneHost.scala 76:20]
    node _T_4 = eq(io.reqIn.bits.isWrite, UInt<1>("h00")) @[WishboneHost.scala 77:32]
    node _T_5 = eq(readyReg, UInt<1>("h01")) @[WishboneHost.scala 77:56]
    node _T_6 = and(_T_4, _T_5) @[WishboneHost.scala 77:44]
    node _T_7 = and(_T_6, io.reqIn.valid) @[WishboneHost.scala 77:67]
    when _T_7 : @[WishboneHost.scala 77:86]
      startWBTransaction <= UInt<1>("h01") @[WishboneHost.scala 78:26]
      stbReg <= UInt<1>("h01") @[WishboneHost.scala 79:14]
      cycReg <= UInt<1>("h01") @[WishboneHost.scala 80:14]
      weReg <= io.reqIn.bits.isWrite @[WishboneHost.scala 81:13]
      adrReg <= io.reqIn.bits.addrRequest @[WishboneHost.scala 82:14]
      datReg <= UInt<1>("h00") @[WishboneHost.scala 83:14]
      selReg <= io.reqIn.bits.activeByteLane @[WishboneHost.scala 84:14]
      skip @[WishboneHost.scala 77:86]
    else : @[WishboneHost.scala 85:92]
      node _T_8 = eq(io.reqIn.bits.isWrite, UInt<1>("h01")) @[WishboneHost.scala 85:39]
      node _T_9 = eq(readyReg, UInt<1>("h01")) @[WishboneHost.scala 85:62]
      node _T_10 = and(_T_8, _T_9) @[WishboneHost.scala 85:50]
      node _T_11 = and(_T_10, io.reqIn.valid) @[WishboneHost.scala 85:73]
      when _T_11 : @[WishboneHost.scala 85:92]
        startWBTransaction <= UInt<1>("h01") @[WishboneHost.scala 86:26]
        stbReg <= UInt<1>("h01") @[WishboneHost.scala 87:14]
        cycReg <= UInt<1>("h01") @[WishboneHost.scala 88:14]
        weReg <= io.reqIn.bits.isWrite @[WishboneHost.scala 89:13]
        adrReg <= io.reqIn.bits.addrRequest @[WishboneHost.scala 90:14]
        datReg <= io.reqIn.bits.dataRequest @[WishboneHost.scala 91:14]
        selReg <= io.reqIn.bits.activeByteLane @[WishboneHost.scala 92:14]
        skip @[WishboneHost.scala 85:92]
    io.wbMasterTransmitter.bits.stb <= stbReg @[WishboneHost.scala 95:37]
    io.wbMasterTransmitter.bits.cyc <= cycReg @[WishboneHost.scala 96:37]
    io.wbMasterTransmitter.bits.we <= weReg @[WishboneHost.scala 97:36]
    io.wbMasterTransmitter.bits.adr <= adrReg @[WishboneHost.scala 98:37]
    io.wbMasterTransmitter.bits.dat <= datReg @[WishboneHost.scala 99:37]
    io.wbMasterTransmitter.bits.sel <= selReg @[WishboneHost.scala 100:37]
    node _T_12 = eq(startWBTransaction, UInt<1>("h00")) @[WishboneHost.scala 102:10]
    when _T_12 : @[WishboneHost.scala 102:31]
      io.wbMasterTransmitter.bits.sel <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.dat <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.adr <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.we <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.stb <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      io.wbMasterTransmitter.bits.cyc <= UInt<1>("h00") @[WishboneHost.scala 103:118]
      skip @[WishboneHost.scala 102:31]
    node _T_13 = eq(io.wbSlaveReceiver.bits.err, UInt<1>("h00")) @[WishboneHost.scala 106:41]
    node _T_14 = and(io.wbSlaveReceiver.bits.ack, _T_13) @[WishboneHost.scala 106:38]
    when _T_14 : @[WishboneHost.scala 106:71]
      dataReg <= io.wbSlaveReceiver.bits.dat @[WishboneHost.scala 107:15]
      respReg <= UInt<1>("h01") @[WishboneHost.scala 108:15]
      errReg <= UInt<1>("h00") @[WishboneHost.scala 109:14]
      startWBTransaction <= UInt<1>("h00") @[WishboneHost.scala 111:26]
      skip @[WishboneHost.scala 106:71]
    else : @[WishboneHost.scala 112:78]
      node _T_15 = eq(io.wbSlaveReceiver.bits.ack, UInt<1>("h00")) @[WishboneHost.scala 112:48]
      node _T_16 = and(io.wbSlaveReceiver.bits.err, _T_15) @[WishboneHost.scala 112:45]
      when _T_16 : @[WishboneHost.scala 112:78]
        dataReg <= io.wbSlaveReceiver.bits.dat @[WishboneHost.scala 113:15]
        respReg <= UInt<1>("h01") @[WishboneHost.scala 114:15]
        errReg <= UInt<1>("h01") @[WishboneHost.scala 115:14]
        startWBTransaction <= UInt<1>("h00") @[WishboneHost.scala 116:26]
        skip @[WishboneHost.scala 112:78]
    node _T_17 = eq(stateReg, UInt<1>("h00")) @[WishboneHost.scala 119:19]
    when _T_17 : @[WishboneHost.scala 119:29]
      node _stateReg_T = or(io.wbSlaveReceiver.bits.ack, io.wbSlaveReceiver.bits.err) @[WishboneHost.scala 120:51]
      node _stateReg_T_1 = mux(_stateReg_T, UInt<1>("h01"), UInt<1>("h00")) @[WishboneHost.scala 120:22]
      stateReg <= _stateReg_T_1 @[WishboneHost.scala 120:16]
      skip @[WishboneHost.scala 119:29]
    else : @[WishboneHost.scala 121:42]
      node _T_18 = eq(stateReg, UInt<1>("h01")) @[WishboneHost.scala 121:26]
      when _T_18 : @[WishboneHost.scala 121:42]
        respReg <= UInt<1>("h00") @[WishboneHost.scala 122:15]
        stateReg <= UInt<1>("h00") @[WishboneHost.scala 123:16]
        skip @[WishboneHost.scala 121:42]
    io.rspOut.valid <= respReg @[WishboneHost.scala 128:21]
    io.rspOut.bits.dataResponse <= dataReg @[WishboneHost.scala 129:33]
    io.rspOut.bits.error <= errReg @[WishboneHost.scala 130:26]
    
  module WishboneDevice_1 : 
    input clock : Clock
    input reset : Reset
    output io : {wbSlaveTransmitter : {flip ready : UInt<1>, valid : UInt<1>, bits : {ack : UInt<1>, dat : UInt<32>, err : UInt<1>}}, flip wbMasterReceiver : {flip ready : UInt<1>, valid : UInt<1>, bits : {cyc : UInt<1>, stb : UInt<1>, we : UInt<1>, adr : UInt<32>, dat : UInt<32>, sel : UInt<4>}}, reqOut : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, flip rspIn : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}}
    
    wire ack : UInt<1>
    ack <= UInt<1>("h00")
    io.wbMasterReceiver.ready <= UInt<1>("h01") @[WishboneDevice.scala 19:29]
    io.rspIn.ready <= UInt<1>("h01") @[WishboneDevice.scala 23:18]
    node _T = and(io.wbMasterReceiver.valid, io.wbMasterReceiver.bits.cyc) @[WishboneDevice.scala 16:48]
    node _T_1 = and(_T, io.wbMasterReceiver.bits.stb) @[WishboneDevice.scala 16:80]
    when _T_1 : @[WishboneDevice.scala 25:16]
      node _T_2 = eq(io.wbMasterReceiver.bits.we, UInt<1>("h00")) @[WishboneDevice.scala 26:10]
      when _T_2 : @[WishboneDevice.scala 26:40]
        io.reqOut.valid <= UInt<1>("h01") @[WishboneDevice.scala 31:23]
        io.reqOut.bits.addrRequest <= io.wbMasterReceiver.bits.adr @[WishboneDevice.scala 32:34]
        io.reqOut.bits.dataRequest is invalid @[WishboneDevice.scala 33:34]
        io.reqOut.bits.activeByteLane <= io.wbMasterReceiver.bits.sel @[WishboneDevice.scala 34:37]
        io.reqOut.bits.isWrite <= UInt<1>("h00") @[WishboneDevice.scala 35:30]
        node _T_3 = eq(io.rspIn.bits.error, UInt<1>("h00")) @[WishboneDevice.scala 36:30]
        node _T_4 = and(io.rspIn.valid, _T_3) @[WishboneDevice.scala 36:27]
        when _T_4 : @[WishboneDevice.scala 36:52]
          io.wbSlaveTransmitter.valid <= UInt<1>("h01") @[WishboneDevice.scala 38:37]
          ack <= UInt<1>("h01") @[WishboneDevice.scala 39:13]
          io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 40:40]
          io.wbSlaveTransmitter.bits.dat <= io.rspIn.bits.dataResponse @[WishboneDevice.scala 41:40]
          skip @[WishboneDevice.scala 36:52]
        else : @[WishboneDevice.scala 42:58]
          node _T_5 = and(io.rspIn.valid, io.rspIn.bits.error) @[WishboneDevice.scala 42:34]
          when _T_5 : @[WishboneDevice.scala 42:58]
            io.wbSlaveTransmitter.valid <= UInt<1>("h01") @[WishboneDevice.scala 43:37]
            ack <= UInt<1>("h00") @[WishboneDevice.scala 44:13]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h01") @[WishboneDevice.scala 45:40]
            io.wbSlaveTransmitter.bits.dat <= io.rspIn.bits.dataResponse @[WishboneDevice.scala 46:40]
            skip @[WishboneDevice.scala 42:58]
          else : @[WishboneDevice.scala 47:20]
            io.wbSlaveTransmitter.valid <= UInt<1>("h00") @[WishboneDevice.scala 48:37]
            ack <= UInt<1>("h00") @[WishboneDevice.scala 49:13]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 50:40]
            io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 51:40]
            skip @[WishboneDevice.scala 47:20]
        skip @[WishboneDevice.scala 26:40]
      else : @[WishboneDevice.scala 53:18]
        io.reqOut.valid <= UInt<1>("h01") @[WishboneDevice.scala 55:23]
        io.reqOut.bits.addrRequest <= io.wbMasterReceiver.bits.adr @[WishboneDevice.scala 56:34]
        io.reqOut.bits.dataRequest <= io.wbMasterReceiver.bits.dat @[WishboneDevice.scala 57:34]
        io.reqOut.bits.activeByteLane <= io.wbMasterReceiver.bits.sel @[WishboneDevice.scala 58:37]
        io.reqOut.bits.isWrite <= io.wbMasterReceiver.bits.we @[WishboneDevice.scala 59:30]
        node _T_6 = eq(io.rspIn.bits.error, UInt<1>("h00")) @[WishboneDevice.scala 60:30]
        node _T_7 = and(io.rspIn.valid, _T_6) @[WishboneDevice.scala 60:27]
        when _T_7 : @[WishboneDevice.scala 60:52]
          io.wbSlaveTransmitter.valid <= UInt<1>("h01") @[WishboneDevice.scala 61:37]
          ack <= UInt<1>("h01") @[WishboneDevice.scala 62:13]
          io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 63:40]
          io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 64:40]
          skip @[WishboneDevice.scala 60:52]
        else : @[WishboneDevice.scala 65:58]
          node _T_8 = and(io.rspIn.valid, io.rspIn.bits.error) @[WishboneDevice.scala 65:34]
          when _T_8 : @[WishboneDevice.scala 65:58]
            io.wbSlaveTransmitter.valid <= UInt<1>("h01") @[WishboneDevice.scala 66:37]
            ack <= UInt<1>("h00") @[WishboneDevice.scala 67:13]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h01") @[WishboneDevice.scala 68:40]
            io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 69:40]
            skip @[WishboneDevice.scala 65:58]
          else : @[WishboneDevice.scala 70:20]
            io.wbSlaveTransmitter.valid <= UInt<1>("h00") @[WishboneDevice.scala 71:37]
            ack <= UInt<1>("h00") @[WishboneDevice.scala 72:13]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 73:40]
            io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 74:40]
            io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 75:40]
            skip @[WishboneDevice.scala 70:20]
        skip @[WishboneDevice.scala 53:18]
      skip @[WishboneDevice.scala 25:16]
    else : @[WishboneDevice.scala 79:16]
      io.reqOut.valid <= UInt<1>("h00") @[WishboneDevice.scala 81:21]
      io.reqOut.bits.addrRequest is invalid @[WishboneDevice.scala 82:32]
      io.reqOut.bits.dataRequest is invalid @[WishboneDevice.scala 83:32]
      io.reqOut.bits.activeByteLane is invalid @[WishboneDevice.scala 84:35]
      io.reqOut.bits.isWrite is invalid @[WishboneDevice.scala 85:28]
      io.wbSlaveTransmitter.valid <= UInt<1>("h00") @[WishboneDevice.scala 87:33]
      ack <= UInt<1>("h00") @[WishboneDevice.scala 88:9]
      io.wbSlaveTransmitter.bits.err <= UInt<1>("h00") @[WishboneDevice.scala 89:36]
      io.wbSlaveTransmitter.bits.dat is invalid @[WishboneDevice.scala 90:36]
      skip @[WishboneDevice.scala 79:16]
    io.wbSlaveTransmitter.bits.ack <= ack @[WishboneDevice.scala 93:34]
    
  module WishboneAdapter_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip reqIn : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rspOut : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}, reqOut : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, flip rspIn : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}}
    
    inst wbHost of WishboneHost_1 @[WishboneAdapter.scala 19:24]
    wbHost.clock <= clock
    wbHost.reset <= reset
    inst wbSlave of WishboneDevice_1 @[WishboneAdapter.scala 20:25]
    wbSlave.clock <= clock
    wbSlave.reset <= reset
    wbSlave.io.wbMasterReceiver.bits.sel <= wbHost.io.wbMasterTransmitter.bits.sel @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.dat <= wbHost.io.wbMasterTransmitter.bits.dat @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.adr <= wbHost.io.wbMasterTransmitter.bits.adr @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.we <= wbHost.io.wbMasterTransmitter.bits.we @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.stb <= wbHost.io.wbMasterTransmitter.bits.stb @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.bits.cyc <= wbHost.io.wbMasterTransmitter.bits.cyc @[WishboneAdapter.scala 23:35]
    wbSlave.io.wbMasterReceiver.valid <= wbHost.io.wbMasterTransmitter.valid @[WishboneAdapter.scala 23:35]
    wbHost.io.wbMasterTransmitter.ready <= wbSlave.io.wbMasterReceiver.ready @[WishboneAdapter.scala 23:35]
    wbHost.io.wbSlaveReceiver.bits.err <= wbSlave.io.wbSlaveTransmitter.bits.err @[WishboneAdapter.scala 26:35]
    wbHost.io.wbSlaveReceiver.bits.dat <= wbSlave.io.wbSlaveTransmitter.bits.dat @[WishboneAdapter.scala 26:35]
    wbHost.io.wbSlaveReceiver.bits.ack <= wbSlave.io.wbSlaveTransmitter.bits.ack @[WishboneAdapter.scala 26:35]
    wbHost.io.wbSlaveReceiver.valid <= wbSlave.io.wbSlaveTransmitter.valid @[WishboneAdapter.scala 26:35]
    wbSlave.io.wbSlaveTransmitter.ready <= wbHost.io.wbSlaveReceiver.ready @[WishboneAdapter.scala 26:35]
    wbHost.io.reqIn.bits.isWrite <= io.reqIn.bits.isWrite @[WishboneAdapter.scala 29:21]
    wbHost.io.reqIn.bits.activeByteLane <= io.reqIn.bits.activeByteLane @[WishboneAdapter.scala 29:21]
    wbHost.io.reqIn.bits.dataRequest <= io.reqIn.bits.dataRequest @[WishboneAdapter.scala 29:21]
    wbHost.io.reqIn.bits.addrRequest <= io.reqIn.bits.addrRequest @[WishboneAdapter.scala 29:21]
    wbHost.io.reqIn.valid <= io.reqIn.valid @[WishboneAdapter.scala 29:21]
    io.reqIn.ready <= wbHost.io.reqIn.ready @[WishboneAdapter.scala 29:21]
    io.rspOut.bits.error <= wbHost.io.rspOut.bits.error @[WishboneAdapter.scala 32:15]
    io.rspOut.bits.dataResponse <= wbHost.io.rspOut.bits.dataResponse @[WishboneAdapter.scala 32:15]
    io.rspOut.valid <= wbHost.io.rspOut.valid @[WishboneAdapter.scala 32:15]
    wbHost.io.rspOut.ready <= io.rspOut.ready @[WishboneAdapter.scala 32:15]
    io.reqOut.bits.isWrite <= wbSlave.io.reqOut.bits.isWrite @[WishboneAdapter.scala 35:15]
    io.reqOut.bits.activeByteLane <= wbSlave.io.reqOut.bits.activeByteLane @[WishboneAdapter.scala 35:15]
    io.reqOut.bits.dataRequest <= wbSlave.io.reqOut.bits.dataRequest @[WishboneAdapter.scala 35:15]
    io.reqOut.bits.addrRequest <= wbSlave.io.reqOut.bits.addrRequest @[WishboneAdapter.scala 35:15]
    io.reqOut.valid <= wbSlave.io.reqOut.valid @[WishboneAdapter.scala 35:15]
    wbSlave.io.reqOut.ready <= io.reqOut.ready @[WishboneAdapter.scala 35:15]
    wbSlave.io.rspIn.bits.error <= io.rspIn.bits.error @[WishboneAdapter.scala 38:22]
    wbSlave.io.rspIn.bits.dataResponse <= io.rspIn.bits.dataResponse @[WishboneAdapter.scala 38:22]
    wbSlave.io.rspIn.valid <= io.rspIn.valid @[WishboneAdapter.scala 38:22]
    io.rspIn.ready <= wbSlave.io.rspIn.ready @[WishboneAdapter.scala 38:22]
    
  module BlockRamWithoutMasking : 
    input clock : Clock
    input reset : Reset
    output io : {flip req : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rsp : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}}
    
    wire addrMisaligned : UInt<1> @[BlockRam.scala 67:28]
    wire addrOutOfBounds : UInt<1> @[BlockRam.scala 68:29]
    reg validReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[BlockRam.scala 72:25]
    reg errReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[BlockRam.scala 73:23]
    io.rsp.valid <= validReg @[BlockRam.scala 74:16]
    io.rsp.bits.error <= errReg @[BlockRam.scala 75:21]
    io.req.ready <= UInt<1>("h01") @[BlockRam.scala 76:16]
    node _addrMisaligned_T = and(io.req.ready, io.req.valid) @[Decoupled.scala 40:37]
    node _addrMisaligned_T_1 = bits(io.req.bits.addrRequest, 1, 0) @[BlockRam.scala 78:63]
    node _addrMisaligned_T_2 = orr(_addrMisaligned_T_1) @[BlockRam.scala 78:72]
    node _addrMisaligned_T_3 = mux(_addrMisaligned_T, _addrMisaligned_T_2, UInt<1>("h00")) @[BlockRam.scala 78:24]
    addrMisaligned <= _addrMisaligned_T_3 @[BlockRam.scala 78:18]
    node _addrOutOfBounds_T = and(io.req.ready, io.req.valid) @[Decoupled.scala 40:37]
    node _addrOutOfBounds_T_1 = div(io.req.bits.addrRequest, UInt<3>("h04")) @[BlockRam.scala 79:65]
    node _addrOutOfBounds_T_2 = geq(_addrOutOfBounds_T_1, UInt<10>("h03ff")) @[BlockRam.scala 79:71]
    node _addrOutOfBounds_T_3 = mux(_addrOutOfBounds_T, _addrOutOfBounds_T_2, UInt<1>("h00")) @[BlockRam.scala 79:25]
    addrOutOfBounds <= _addrOutOfBounds_T_3 @[BlockRam.scala 79:19]
    node _errReg_T = or(addrMisaligned, addrOutOfBounds) @[BlockRam.scala 81:28]
    errReg <= _errReg_T @[BlockRam.scala 81:10]
    smem mem : UInt<32>[1024], undefined @[BlockRam.scala 82:24]
    node _T = and(io.req.ready, io.req.valid) @[Decoupled.scala 40:37]
    node _T_1 = eq(io.req.bits.isWrite, UInt<1>("h00")) @[BlockRam.scala 88:25]
    node _T_2 = and(_T, _T_1) @[BlockRam.scala 88:22]
    when _T_2 : @[BlockRam.scala 88:47]
      node _io_rsp_bits_dataResponse_T = div(io.req.bits.addrRequest, UInt<3>("h04")) @[BlockRam.scala 90:65]
      node _io_rsp_bits_dataResponse_T_1 = bits(_io_rsp_bits_dataResponse_T, 9, 0) @[BlockRam.scala 90:41]
      read mport io_rsp_bits_dataResponse_MPORT = mem[_io_rsp_bits_dataResponse_T_1], clock @[BlockRam.scala 90:41]
      io.rsp.bits.dataResponse <= io_rsp_bits_dataResponse_MPORT @[BlockRam.scala 90:30]
      validReg <= UInt<1>("h01") @[BlockRam.scala 91:14]
      skip @[BlockRam.scala 88:47]
    else : @[BlockRam.scala 92:53]
      node _T_3 = and(io.req.ready, io.req.valid) @[Decoupled.scala 40:37]
      node _T_4 = and(_T_3, io.req.bits.isWrite) @[BlockRam.scala 92:29]
      when _T_4 : @[BlockRam.scala 92:53]
        node _T_5 = div(io.req.bits.addrRequest, UInt<3>("h04")) @[BlockRam.scala 94:38]
        node _T_6 = bits(_T_5, 9, 0)
        write mport MPORT = mem[_T_6], clock
        MPORT <= io.req.bits.dataRequest
        validReg <= UInt<1>("h01") @[BlockRam.scala 95:14]
        io.rsp.bits.dataResponse is invalid @[BlockRam.scala 96:30]
        skip @[BlockRam.scala 92:53]
      else : @[BlockRam.scala 97:16]
        validReg <= UInt<1>("h00") @[BlockRam.scala 98:14]
        io.rsp.bits.dataResponse is invalid @[BlockRam.scala 99:30]
        skip @[BlockRam.scala 97:16]
    
  module BlockRamWithMasking : 
    input clock : Clock
    input reset : Reset
    output io : {flip req : {flip ready : UInt<1>, valid : UInt<1>, bits : {addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rsp : {flip ready : UInt<1>, valid : UInt<1>, bits : {dataResponse : UInt<32>, error : UInt<1>}}}
    
    wire wdata : UInt<8>[4] @[BlockRam.scala 113:19]
    wire rdata : UInt<8>[4] @[BlockRam.scala 115:19]
    wire mask : UInt<1>[4] @[BlockRam.scala 117:18]
    wire data : UInt<8>[4] @[BlockRam.scala 119:18]
    node _wdata_0_T = bits(io.req.bits.dataRequest, 7, 0) @[BlockRam.scala 121:38]
    wdata[0] <= _wdata_0_T @[BlockRam.scala 121:12]
    node _wdata_1_T = bits(io.req.bits.dataRequest, 15, 8) @[BlockRam.scala 122:38]
    wdata[1] <= _wdata_1_T @[BlockRam.scala 122:12]
    node _wdata_2_T = bits(io.req.bits.dataRequest, 23, 16) @[BlockRam.scala 123:38]
    wdata[2] <= _wdata_2_T @[BlockRam.scala 123:12]
    node _wdata_3_T = bits(io.req.bits.dataRequest, 31, 24) @[BlockRam.scala 124:38]
    wdata[3] <= _wdata_3_T @[BlockRam.scala 124:12]
    node byteLane_0 = bits(io.req.bits.activeByteLane, 0, 0) @[BlockRam.scala 128:52]
    node byteLane_1 = bits(io.req.bits.activeByteLane, 1, 1) @[BlockRam.scala 128:52]
    node byteLane_2 = bits(io.req.bits.activeByteLane, 2, 2) @[BlockRam.scala 128:52]
    node byteLane_3 = bits(io.req.bits.activeByteLane, 3, 3) @[BlockRam.scala 128:52]
    mask[0] <= byteLane_0 @[BlockRam.scala 130:7]
    mask[1] <= byteLane_1 @[BlockRam.scala 130:7]
    mask[2] <= byteLane_2 @[BlockRam.scala 130:7]
    mask[3] <= byteLane_3 @[BlockRam.scala 130:7]
    reg validReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[BlockRam.scala 136:25]
    io.rsp.valid <= validReg @[BlockRam.scala 137:16]
    io.rsp.bits.error <= UInt<1>("h00") @[BlockRam.scala 138:21]
    io.req.ready <= UInt<1>("h01") @[BlockRam.scala 139:16]
    smem mem : UInt<8>[4][1024], undefined @[BlockRam.scala 141:24]
    node _T = and(io.req.ready, io.req.valid) @[Decoupled.scala 40:37]
    node _T_1 = eq(io.req.bits.isWrite, UInt<1>("h00")) @[BlockRam.scala 143:25]
    node _T_2 = and(_T, _T_1) @[BlockRam.scala 143:22]
    when _T_2 : @[BlockRam.scala 143:47]
      node _T_3 = div(io.req.bits.addrRequest, UInt<3>("h04")) @[BlockRam.scala 145:46]
      node _T_4 = bits(_T_3, 9, 0) @[BlockRam.scala 145:22]
      read mport MPORT = mem[_T_4], clock @[BlockRam.scala 145:22]
      rdata[0] <= MPORT[0] @[BlockRam.scala 145:11]
      rdata[1] <= MPORT[1] @[BlockRam.scala 145:11]
      rdata[2] <= MPORT[2] @[BlockRam.scala 145:11]
      rdata[3] <= MPORT[3] @[BlockRam.scala 145:11]
      validReg <= UInt<1>("h01") @[BlockRam.scala 146:14]
      skip @[BlockRam.scala 143:47]
    else : @[BlockRam.scala 147:53]
      node _T_5 = and(io.req.ready, io.req.valid) @[Decoupled.scala 40:37]
      node _T_6 = and(_T_5, io.req.bits.isWrite) @[BlockRam.scala 147:29]
      when _T_6 : @[BlockRam.scala 147:53]
        node _T_7 = div(io.req.bits.addrRequest, UInt<3>("h04")) @[BlockRam.scala 149:38]
        node _T_8 = bits(_T_7, 9, 0)
        write mport MPORT_1 = mem[_T_8], clock
        when mask[0] :
          MPORT_1[0] <= wdata[0]
          skip
        when mask[1] :
          MPORT_1[1] <= wdata[1]
          skip
        when mask[2] :
          MPORT_1[2] <= wdata[2]
          skip
        when mask[3] :
          MPORT_1[3] <= wdata[3]
          skip
        validReg <= UInt<1>("h01") @[BlockRam.scala 150:14]
        rdata[0] is invalid @[BlockRam.scala 151:18]
        rdata[1] is invalid @[BlockRam.scala 151:18]
        rdata[2] is invalid @[BlockRam.scala 151:18]
        rdata[3] is invalid @[BlockRam.scala 151:18]
        skip @[BlockRam.scala 147:53]
      else : @[BlockRam.scala 152:16]
        validReg <= UInt<1>("h00") @[BlockRam.scala 153:14]
        rdata[0] is invalid @[BlockRam.scala 154:18]
        rdata[1] is invalid @[BlockRam.scala 154:18]
        rdata[2] is invalid @[BlockRam.scala 154:18]
        rdata[3] is invalid @[BlockRam.scala 154:18]
        skip @[BlockRam.scala 152:16]
    node _T_9 = eq(mask[0], UInt<1>("h01")) @[BlockRam.scala 160:11]
    node _T_10 = mux(_T_9, rdata[0], UInt<1>("h00")) @[BlockRam.scala 160:8]
    node _T_11 = eq(mask[1], UInt<1>("h01")) @[BlockRam.scala 160:11]
    node _T_12 = mux(_T_11, rdata[1], UInt<1>("h00")) @[BlockRam.scala 160:8]
    node _T_13 = eq(mask[2], UInt<1>("h01")) @[BlockRam.scala 160:11]
    node _T_14 = mux(_T_13, rdata[2], UInt<1>("h00")) @[BlockRam.scala 160:8]
    node _T_15 = eq(mask[3], UInt<1>("h01")) @[BlockRam.scala 160:11]
    node _T_16 = mux(_T_15, rdata[3], UInt<1>("h00")) @[BlockRam.scala 160:8]
    data[0] <= _T_10 @[BlockRam.scala 159:8]
    data[1] <= _T_12 @[BlockRam.scala 159:8]
    data[2] <= _T_14 @[BlockRam.scala 159:8]
    data[3] <= _T_16 @[BlockRam.scala 159:8]
    node io_rsp_bits_dataResponse_lo = cat(data[1], data[0]) @[Cat.scala 30:58]
    node io_rsp_bits_dataResponse_hi = cat(data[3], data[2]) @[Cat.scala 30:58]
    node _io_rsp_bits_dataResponse_T = cat(io_rsp_bits_dataResponse_hi, io_rsp_bits_dataResponse_lo) @[Cat.scala 30:58]
    io.rsp.bits.dataResponse <= _io_rsp_bits_dataResponse_T @[BlockRam.scala 163:28]
    
  extmodule BlackBoxIbexCore : 
    input clk_i : Clock
    input rst_ni : UInt<1>
    input test_en_i : UInt<1>
    input hart_id_i : UInt<32>
    output instr_req_o : UInt<1>
    input instr_gnt_i : UInt<1>
    input instr_rvalid_i : UInt<1>
    output instr_addr_o : UInt<32>
    input instr_rdata_i : UInt<32>
    input instr_rdata_intg_i : UInt<7>
    input instr_err_i : UInt<1>
    output data_req_o : UInt<1>
    input data_gnt_i : UInt<1>
    input data_rvalid_i : UInt<1>
    output data_we_o : UInt<1>
    output data_be_o : UInt<4>
    output data_addr_o : UInt<32>
    output data_wdata_o : UInt<32>
    output data_wdata_intg_o : UInt<7>
    input data_rdata_i : UInt<32>
    input data_rdata_intg_i : UInt<7>
    input data_err_i : UInt<1>
    input irq_software_i : UInt<1>
    input irq_timer_i : UInt<1>
    input irq_external_i : UInt<1>
    input irq_fast_i : UInt<15>
    input irq_nm_i : UInt<1>
    input debug_req_i : UInt<1>
    output crash_dump_o : UInt<1>
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
    parameter DM_EXCEPTION_ADDR = 437323784
    parameter BRANCH_PREDICTOR = 0
    parameter DM_HALT_ADDR = 437323776
    parameter PMP_GRANULARITY = 0
    parameter RV32M = 'ibex_pkg::RV32MFast'
    
  module IbexJigsaw : 
    input clock : Clock
    input reset : UInt<1>
    output io : {pin : UInt<1>}
    
    inst instr_adapter of WishboneAdapter @[IbexJigsaw.scala 18:31]
    instr_adapter.clock <= clock
    instr_adapter.reset <= reset
    inst data_adapter of WishboneAdapter_1 @[IbexJigsaw.scala 19:30]
    data_adapter.clock <= clock
    data_adapter.reset <= reset
    inst instr_mem of BlockRamWithoutMasking @[IbexJigsaw.scala 21:27]
    instr_mem.clock <= clock
    instr_mem.reset <= reset
    inst data_mem of BlockRamWithMasking @[IbexJigsaw.scala 22:27]
    data_mem.clock <= clock
    data_mem.reset <= reset
    instr_mem.io.req.bits.isWrite <= instr_adapter.io.reqOut.bits.isWrite @[IbexJigsaw.scala 24:29]
    instr_mem.io.req.bits.activeByteLane <= instr_adapter.io.reqOut.bits.activeByteLane @[IbexJigsaw.scala 24:29]
    instr_mem.io.req.bits.dataRequest <= instr_adapter.io.reqOut.bits.dataRequest @[IbexJigsaw.scala 24:29]
    instr_mem.io.req.bits.addrRequest <= instr_adapter.io.reqOut.bits.addrRequest @[IbexJigsaw.scala 24:29]
    instr_mem.io.req.valid <= instr_adapter.io.reqOut.valid @[IbexJigsaw.scala 24:29]
    instr_adapter.io.reqOut.ready <= instr_mem.io.req.ready @[IbexJigsaw.scala 24:29]
    instr_adapter.io.rspIn.bits.error <= instr_mem.io.rsp.bits.error @[IbexJigsaw.scala 25:22]
    instr_adapter.io.rspIn.bits.dataResponse <= instr_mem.io.rsp.bits.dataResponse @[IbexJigsaw.scala 25:22]
    instr_adapter.io.rspIn.valid <= instr_mem.io.rsp.valid @[IbexJigsaw.scala 25:22]
    instr_mem.io.rsp.ready <= instr_adapter.io.rspIn.ready @[IbexJigsaw.scala 25:22]
    data_mem.io.req.bits.isWrite <= data_adapter.io.reqOut.bits.isWrite @[IbexJigsaw.scala 27:28]
    data_mem.io.req.bits.activeByteLane <= data_adapter.io.reqOut.bits.activeByteLane @[IbexJigsaw.scala 27:28]
    data_mem.io.req.bits.dataRequest <= data_adapter.io.reqOut.bits.dataRequest @[IbexJigsaw.scala 27:28]
    data_mem.io.req.bits.addrRequest <= data_adapter.io.reqOut.bits.addrRequest @[IbexJigsaw.scala 27:28]
    data_mem.io.req.valid <= data_adapter.io.reqOut.valid @[IbexJigsaw.scala 27:28]
    data_adapter.io.reqOut.ready <= data_mem.io.req.ready @[IbexJigsaw.scala 27:28]
    data_adapter.io.rspIn.bits.error <= data_mem.io.rsp.bits.error @[IbexJigsaw.scala 28:21]
    data_adapter.io.rspIn.bits.dataResponse <= data_mem.io.rsp.bits.dataResponse @[IbexJigsaw.scala 28:21]
    data_adapter.io.rspIn.valid <= data_mem.io.rsp.valid @[IbexJigsaw.scala 28:21]
    data_mem.io.rsp.ready <= data_adapter.io.rspIn.ready @[IbexJigsaw.scala 28:21]
    inst ibex of BlackBoxIbexCore @[IbexJigsaw.scala 32:22]
    ibex.scan_rst_ni is invalid
    ibex.core_sleep_o is invalid
    ibex.alert_major_o is invalid
    ibex.alert_minor_o is invalid
    ibex.fetch_enable_i is invalid
    ibex.crash_dump_o is invalid
    ibex.debug_req_i is invalid
    ibex.irq_nm_i is invalid
    ibex.irq_fast_i is invalid
    ibex.irq_external_i is invalid
    ibex.irq_timer_i is invalid
    ibex.irq_software_i is invalid
    ibex.data_err_i is invalid
    ibex.data_rdata_intg_i is invalid
    ibex.data_rdata_i is invalid
    ibex.data_wdata_intg_o is invalid
    ibex.data_wdata_o is invalid
    ibex.data_addr_o is invalid
    ibex.data_be_o is invalid
    ibex.data_we_o is invalid
    ibex.data_rvalid_i is invalid
    ibex.data_gnt_i is invalid
    ibex.data_req_o is invalid
    ibex.instr_err_i is invalid
    ibex.instr_rdata_intg_i is invalid
    ibex.instr_rdata_i is invalid
    ibex.instr_addr_o is invalid
    ibex.instr_rvalid_i is invalid
    ibex.instr_gnt_i is invalid
    ibex.instr_req_o is invalid
    ibex.hart_id_i is invalid
    ibex.test_en_i is invalid
    ibex.rst_ni is invalid
    ibex.clk_i is invalid
    ibex.clk_i <= clock @[IbexJigsaw.scala 33:19]
    ibex.rst_ni <= reset @[IbexJigsaw.scala 34:20]
    ibex.test_en_i <= UInt<1>("h00") @[IbexJigsaw.scala 35:23]
    ibex.hart_id_i <= UInt<1>("h00") @[IbexJigsaw.scala 36:23]
    instr_adapter.io.reqIn.valid <= ibex.instr_req_o @[IbexJigsaw.scala 39:34]
    instr_adapter.io.reqIn.bits.addrRequest <= ibex.instr_addr_o @[IbexJigsaw.scala 40:45]
    instr_adapter.io.reqIn.bits.isWrite <= UInt<1>("h00") @[IbexJigsaw.scala 41:41]
    instr_adapter.io.reqIn.bits.activeByteLane <= UInt<1>("h00") @[IbexJigsaw.scala 42:48]
    instr_adapter.io.reqIn.bits.dataRequest <= UInt<1>("h00") @[IbexJigsaw.scala 43:45]
    ibex.instr_gnt_i <= instr_adapter.io.reqIn.ready @[IbexJigsaw.scala 44:25]
    ibex.instr_rvalid_i <= instr_adapter.io.rspOut.valid @[IbexJigsaw.scala 45:28]
    ibex.instr_rdata_i <= instr_adapter.io.rspOut.bits.dataResponse @[IbexJigsaw.scala 46:27]
    ibex.instr_rdata_intg_i <= UInt<1>("h00") @[IbexJigsaw.scala 47:32]
    ibex.instr_err_i <= instr_adapter.io.rspOut.bits.error @[IbexJigsaw.scala 48:25]
    instr_adapter.io.rspOut.ready <= UInt<1>("h01") @[IbexJigsaw.scala 49:35]
    data_adapter.io.reqIn.valid <= ibex.data_req_o @[IbexJigsaw.scala 53:33]
    data_adapter.io.reqIn.bits.addrRequest <= ibex.data_addr_o @[IbexJigsaw.scala 54:44]
    data_adapter.io.reqIn.bits.dataRequest <= ibex.data_wdata_o @[IbexJigsaw.scala 55:44]
    data_adapter.io.reqIn.bits.isWrite <= ibex.data_we_o @[IbexJigsaw.scala 56:40]
    data_adapter.io.reqIn.bits.activeByteLane <= ibex.data_be_o @[IbexJigsaw.scala 57:47]
    ibex.data_gnt_i <= data_adapter.io.reqIn.ready @[IbexJigsaw.scala 58:24]
    ibex.data_rvalid_i <= data_adapter.io.rspOut.valid @[IbexJigsaw.scala 59:27]
    ibex.data_rdata_i <= data_adapter.io.rspOut.bits.dataResponse @[IbexJigsaw.scala 60:26]
    ibex.data_rdata_intg_i <= UInt<1>("h00") @[IbexJigsaw.scala 61:31]
    ibex.data_err_i <= data_adapter.io.rspOut.bits.error @[IbexJigsaw.scala 62:24]
    data_adapter.io.rspOut.ready <= UInt<1>("h01") @[IbexJigsaw.scala 63:34]
    ibex.debug_req_i <= UInt<1>("h00") @[IbexJigsaw.scala 66:25]
    ibex.irq_software_i <= UInt<1>("h00") @[IbexJigsaw.scala 67:28]
    ibex.irq_timer_i <= UInt<1>("h00") @[IbexJigsaw.scala 68:25]
    ibex.irq_external_i <= UInt<1>("h00") @[IbexJigsaw.scala 69:28]
    ibex.irq_fast_i <= UInt<1>("h00") @[IbexJigsaw.scala 70:24]
    ibex.irq_nm_i <= UInt<1>("h00") @[IbexJigsaw.scala 71:22]
    ibex.fetch_enable_i <= UInt<1>("h01") @[IbexJigsaw.scala 72:28]
    ibex.scan_rst_ni <= UInt<1>("h01") @[IbexJigsaw.scala 73:25]
    io.pin <= ibex.core_sleep_o @[IbexJigsaw.scala 75:12]
    
