circuit IbexJigsaw :
  module TilelinkHost :
    input clock : Clock
    input reset : Reset
    output io : { tlMasterTransmitter : { flip ready : UInt<1>, valid : UInt<1>, bits : { a_opcode : UInt<3>, a_param : UInt<3>, a_size : UInt<2>, a_source : UInt<8>, a_address : UInt<32>, a_mask : UInt<4>, a_corrupt : UInt<1>, a_data : UInt<32>}}, flip tlSlaveReceiver : { flip ready : UInt<1>, valid : UInt<1>, bits : { d_opcode : UInt<3>, d_param : UInt<2>, d_size : UInt<2>, d_source : UInt<8>, d_sink : UInt<1>, d_denied : UInt<1>, d_corrupt : UInt<1>, d_data : UInt<32>}}, flip reqIn : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rspOut : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}}

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[TilelinkHost.scala 19:27]
    reg addrReg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[TilelinkHost.scala 20:27]
    io.tlSlaveReceiver.ready <= UInt<1>("h0") @[TilelinkHost.scala 32:33]
    io.reqIn.ready <= UInt<1>("h1") @[TilelinkHost.scala 33:33]
    io.tlMasterTransmitter.bits.a_opcode <= UInt<1>("h0") @[TilelinkHost.scala 40:45]
    io.tlMasterTransmitter.bits.a_data <= UInt<1>("h0") @[TilelinkHost.scala 41:45]
    io.tlMasterTransmitter.bits.a_address <= addrReg @[TilelinkHost.scala 42:45]
    io.tlMasterTransmitter.bits.a_param <= UInt<1>("h0") @[TilelinkHost.scala 43:45]
    io.tlMasterTransmitter.bits.a_source <= UInt<1>("h0") @[TilelinkHost.scala 44:45]
    io.tlMasterTransmitter.bits.a_size <= UInt<1>("h0") @[TilelinkHost.scala 45:45]
    io.tlMasterTransmitter.bits.a_mask <= UInt<1>("h0") @[TilelinkHost.scala 46:45]
    io.tlMasterTransmitter.bits.a_corrupt <= UInt<1>("h0") @[TilelinkHost.scala 47:45]
    io.tlMasterTransmitter.valid <= UInt<1>("h0") @[TilelinkHost.scala 48:45]
    io.rspOut.bits.dataResponse <= UInt<1>("h0") @[TilelinkHost.scala 50:45]
    io.rspOut.bits.error <= UInt<1>("h0") @[TilelinkHost.scala 51:45]
    io.rspOut.valid <= UInt<1>("h0") @[TilelinkHost.scala 53:45]
    node _T = eq(stateReg, UInt<1>("h0")) @[TilelinkHost.scala 56:19]
    when _T : @[TilelinkHost.scala 56:28]
      when io.reqIn.valid : @[TilelinkHost.scala 60:29]
        node _io_tlMasterTransmitter_bits_a_opcode_T = eq(io.reqIn.bits.activeByteLane, UInt<4>("hf")) @[TilelinkHost.scala 62:116]
        node _io_tlMasterTransmitter_bits_a_opcode_T_1 = mux(_io_tlMasterTransmitter_bits_a_opcode_T, UInt<1>("h0"), UInt<1>("h1")) @[TilelinkHost.scala 62:86]
        node _io_tlMasterTransmitter_bits_a_opcode_T_2 = mux(io.reqIn.bits.isWrite, _io_tlMasterTransmitter_bits_a_opcode_T_1, UInt<3>("h4")) @[TilelinkHost.scala 62:59]
        io.tlMasterTransmitter.bits.a_opcode <= _io_tlMasterTransmitter_bits_a_opcode_T_2 @[TilelinkHost.scala 62:53]
        io.tlMasterTransmitter.bits.a_data <= io.reqIn.bits.dataRequest @[TilelinkHost.scala 63:53]
        io.tlMasterTransmitter.bits.a_address <= io.reqIn.bits.addrRequest @[TilelinkHost.scala 64:53]
        io.tlMasterTransmitter.bits.a_param <= UInt<1>("h0") @[TilelinkHost.scala 65:53]
        io.tlMasterTransmitter.bits.a_source <= UInt<2>("h2") @[TilelinkHost.scala 66:53]
        node _io_tlMasterTransmitter_bits_a_size_T = eq(UInt<1>("h1"), UInt<3>("h4")) @[Mux.scala 81:61]
        node _io_tlMasterTransmitter_bits_a_size_T_1 = mux(_io_tlMasterTransmitter_bits_a_size_T, UInt<1>("h0"), UInt<2>("h2")) @[Mux.scala 81:58]
        node _io_tlMasterTransmitter_bits_a_size_T_2 = eq(UInt<2>("h2"), UInt<3>("h4")) @[Mux.scala 81:61]
        node _io_tlMasterTransmitter_bits_a_size_T_3 = mux(_io_tlMasterTransmitter_bits_a_size_T_2, UInt<1>("h1"), _io_tlMasterTransmitter_bits_a_size_T_1) @[Mux.scala 81:58]
        node _io_tlMasterTransmitter_bits_a_size_T_4 = eq(UInt<3>("h4"), UInt<3>("h4")) @[Mux.scala 81:61]
        node _io_tlMasterTransmitter_bits_a_size_T_5 = mux(_io_tlMasterTransmitter_bits_a_size_T_4, UInt<2>("h2"), _io_tlMasterTransmitter_bits_a_size_T_3) @[Mux.scala 81:58]
        node _io_tlMasterTransmitter_bits_a_size_T_6 = eq(UInt<4>("h8"), UInt<3>("h4")) @[Mux.scala 81:61]
        node _io_tlMasterTransmitter_bits_a_size_T_7 = mux(_io_tlMasterTransmitter_bits_a_size_T_6, UInt<2>("h3"), _io_tlMasterTransmitter_bits_a_size_T_5) @[Mux.scala 81:58]
        io.tlMasterTransmitter.bits.a_size <= _io_tlMasterTransmitter_bits_a_size_T_7 @[TilelinkHost.scala 67:53]
        io.tlMasterTransmitter.bits.a_mask <= io.reqIn.bits.activeByteLane @[TilelinkHost.scala 73:53]
        io.tlMasterTransmitter.bits.a_corrupt <= UInt<1>("h0") @[TilelinkHost.scala 74:53]
        io.tlMasterTransmitter.valid <= io.reqIn.valid @[TilelinkHost.scala 75:53]
        stateReg <= UInt<1>("h1") @[TilelinkHost.scala 77:22]
        io.tlSlaveReceiver.ready <= UInt<1>("h1") @[TilelinkHost.scala 78:38]
        addrReg <= io.reqIn.bits.addrRequest @[TilelinkHost.scala 79:21]
    else :
      node _T_1 = eq(stateReg, UInt<1>("h1")) @[TilelinkHost.scala 84:25]
      when _T_1 : @[TilelinkHost.scala 84:43]
        io.tlSlaveReceiver.ready <= UInt<1>("h1") @[TilelinkHost.scala 86:34]
        io.reqIn.ready <= UInt<1>("h0") @[TilelinkHost.scala 87:34]
        when io.tlSlaveReceiver.valid : @[TilelinkHost.scala 89:39]
          io.rspOut.bits.dataResponse <= io.tlSlaveReceiver.bits.d_data @[TilelinkHost.scala 91:41]
          io.rspOut.bits.error <= io.tlSlaveReceiver.bits.d_denied @[TilelinkHost.scala 92:34]
          io.rspOut.valid <= io.tlSlaveReceiver.valid @[TilelinkHost.scala 94:29]
          stateReg <= UInt<1>("h0") @[TilelinkHost.scala 95:22]

  module TilelinkDevice :
    input clock : Clock
    input reset : Reset
    output io : { tlSlaveTransmitter : { flip ready : UInt<1>, valid : UInt<1>, bits : { d_opcode : UInt<3>, d_param : UInt<2>, d_size : UInt<2>, d_source : UInt<8>, d_sink : UInt<1>, d_denied : UInt<1>, d_corrupt : UInt<1>, d_data : UInt<32>}}, flip tlMasterReceiver : { flip ready : UInt<1>, valid : UInt<1>, bits : { a_opcode : UInt<3>, a_param : UInt<3>, a_size : UInt<2>, a_source : UInt<8>, a_address : UInt<32>, a_mask : UInt<4>, a_corrupt : UInt<1>, a_data : UInt<32>}}, reqOut : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, flip rspIn : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}}

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[TilelinkDevice.scala 17:27]
    io.tlMasterReceiver.ready <= UInt<1>("h1") @[TilelinkDevice.scala 19:31]
    io.rspIn.ready <= UInt<1>("h0") @[TilelinkDevice.scala 20:20]
    io.reqOut.bits.addrRequest <= UInt<1>("h0") @[TilelinkDevice.scala 23:37]
    io.reqOut.bits.dataRequest <= UInt<1>("h0") @[TilelinkDevice.scala 24:37]
    io.reqOut.bits.activeByteLane <= UInt<1>("h0") @[TilelinkDevice.scala 25:37]
    io.reqOut.bits.isWrite <= UInt<1>("h0") @[TilelinkDevice.scala 26:37]
    io.reqOut.valid <= UInt<1>("h0") @[TilelinkDevice.scala 27:37]
    io.tlSlaveTransmitter.bits.d_opcode <= UInt<1>("h0") @[TilelinkDevice.scala 29:45]
    io.tlSlaveTransmitter.bits.d_data <= UInt<1>("h0") @[TilelinkDevice.scala 30:45]
    io.tlSlaveTransmitter.bits.d_param <= UInt<1>("h0") @[TilelinkDevice.scala 31:45]
    io.tlSlaveTransmitter.bits.d_size <= UInt<1>("h0") @[TilelinkDevice.scala 32:45]
    io.tlSlaveTransmitter.bits.d_source <= UInt<1>("h0") @[TilelinkDevice.scala 33:45]
    io.tlSlaveTransmitter.bits.d_sink <= UInt<1>("h0") @[TilelinkDevice.scala 34:45]
    io.tlSlaveTransmitter.bits.d_denied <= UInt<1>("h0") @[TilelinkDevice.scala 35:45]
    io.tlSlaveTransmitter.bits.d_corrupt <= UInt<1>("h0") @[TilelinkDevice.scala 36:45]
    io.tlSlaveTransmitter.valid <= UInt<1>("h0") @[TilelinkDevice.scala 37:45]
    node _T = eq(stateReg, UInt<1>("h0")) @[TilelinkDevice.scala 41:19]
    when _T : @[TilelinkDevice.scala 41:28]
      when io.tlMasterReceiver.valid : @[TilelinkDevice.scala 43:40]
        io.reqOut.bits.addrRequest <= io.tlMasterReceiver.bits.a_address @[TilelinkDevice.scala 45:40]
        io.reqOut.bits.dataRequest <= io.tlMasterReceiver.bits.a_data @[TilelinkDevice.scala 46:40]
        io.reqOut.bits.activeByteLane <= io.tlMasterReceiver.bits.a_mask @[TilelinkDevice.scala 47:43]
        node _io_reqOut_bits_isWrite_T = eq(io.tlMasterReceiver.bits.a_opcode, UInt<1>("h0")) @[TilelinkDevice.scala 48:73]
        node _io_reqOut_bits_isWrite_T_1 = eq(io.tlMasterReceiver.bits.a_opcode, UInt<1>("h1")) @[TilelinkDevice.scala 48:128]
        node _io_reqOut_bits_isWrite_T_2 = or(_io_reqOut_bits_isWrite_T, _io_reqOut_bits_isWrite_T_1) @[TilelinkDevice.scala 48:91]
        io.reqOut.bits.isWrite <= _io_reqOut_bits_isWrite_T_2 @[TilelinkDevice.scala 48:36]
        io.reqOut.valid <= UInt<1>("h1") @[TilelinkDevice.scala 49:29]
        stateReg <= UInt<1>("h1") @[TilelinkDevice.scala 51:22]
        io.rspIn.ready <= UInt<1>("h1") @[TilelinkDevice.scala 52:28]
    else :
      node _T_1 = eq(stateReg, UInt<1>("h1")) @[TilelinkDevice.scala 56:25]
      when _T_1 : @[TilelinkDevice.scala 56:43]
        io.rspIn.ready <= UInt<1>("h1") @[TilelinkDevice.scala 58:24]
        when io.rspIn.valid : @[TilelinkDevice.scala 60:29]
          io.tlSlaveTransmitter.bits.d_opcode <= UInt<1>("h1") @[TilelinkDevice.scala 62:49]
          io.tlSlaveTransmitter.bits.d_data <= io.rspIn.bits.dataResponse @[TilelinkDevice.scala 63:47]
          io.tlSlaveTransmitter.bits.d_param <= UInt<1>("h0") @[TilelinkDevice.scala 64:48]
          io.tlSlaveTransmitter.bits.d_size <= io.tlMasterReceiver.bits.a_size @[TilelinkDevice.scala 65:47]
          io.tlSlaveTransmitter.bits.d_source <= io.tlMasterReceiver.bits.a_source @[TilelinkDevice.scala 66:49]
          io.tlSlaveTransmitter.bits.d_sink <= UInt<1>("h0") @[TilelinkDevice.scala 67:47]
          io.tlSlaveTransmitter.bits.d_denied <= io.rspIn.bits.error @[TilelinkDevice.scala 68:49]
          io.tlSlaveTransmitter.bits.d_corrupt <= UInt<1>("h0") @[TilelinkDevice.scala 69:50]
          io.tlSlaveTransmitter.valid <= io.rspIn.valid @[TilelinkDevice.scala 70:41]
          stateReg <= UInt<1>("h0") @[TilelinkDevice.scala 72:22]

  module TilelinkAdapter :
    input clock : Clock
    input reset : Reset
    output io : { flip reqIn : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rspOut : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}, reqOut : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, flip rspIn : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}}

    inst tlHost of TilelinkHost @[TilelinkAdapter.scala 18:24]
    tlHost.clock <= clock
    tlHost.reset <= reset
    inst tlSlave of TilelinkDevice @[TilelinkAdapter.scala 19:25]
    tlSlave.clock <= clock
    tlSlave.reset <= reset
    tlSlave.io.tlMasterReceiver <= tlHost.io.tlMasterTransmitter @[TilelinkAdapter.scala 22:35]
    tlHost.io.tlSlaveReceiver <= tlSlave.io.tlSlaveTransmitter @[TilelinkAdapter.scala 25:35]
    tlHost.io.reqIn <= io.reqIn @[TilelinkAdapter.scala 28:21]
    io.rspOut.bits <= tlHost.io.rspOut.bits @[TilelinkAdapter.scala 31:15]
    io.rspOut.valid <= tlHost.io.rspOut.valid @[TilelinkAdapter.scala 31:15]
    tlHost.io.rspOut.ready <= io.rspOut.ready @[TilelinkAdapter.scala 31:15]
    io.reqOut.bits <= tlSlave.io.reqOut.bits @[TilelinkAdapter.scala 34:15]
    io.reqOut.valid <= tlSlave.io.reqOut.valid @[TilelinkAdapter.scala 34:15]
    tlSlave.io.reqOut.ready <= io.reqOut.ready @[TilelinkAdapter.scala 34:15]
    tlSlave.io.rspIn <= io.rspIn @[TilelinkAdapter.scala 37:22]

  module TilelinkHost_1 :
    input clock : Clock
    input reset : Reset
    output io : { tlMasterTransmitter : { flip ready : UInt<1>, valid : UInt<1>, bits : { a_opcode : UInt<3>, a_param : UInt<3>, a_size : UInt<2>, a_source : UInt<8>, a_address : UInt<32>, a_mask : UInt<4>, a_corrupt : UInt<1>, a_data : UInt<32>}}, flip tlSlaveReceiver : { flip ready : UInt<1>, valid : UInt<1>, bits : { d_opcode : UInt<3>, d_param : UInt<2>, d_size : UInt<2>, d_source : UInt<8>, d_sink : UInt<1>, d_denied : UInt<1>, d_corrupt : UInt<1>, d_data : UInt<32>}}, flip reqIn : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rspOut : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}}

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[TilelinkHost.scala 19:27]
    reg addrReg : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[TilelinkHost.scala 20:27]
    io.tlSlaveReceiver.ready <= UInt<1>("h0") @[TilelinkHost.scala 32:33]
    io.reqIn.ready <= UInt<1>("h1") @[TilelinkHost.scala 33:33]
    io.tlMasterTransmitter.bits.a_opcode <= UInt<1>("h0") @[TilelinkHost.scala 40:45]
    io.tlMasterTransmitter.bits.a_data <= UInt<1>("h0") @[TilelinkHost.scala 41:45]
    io.tlMasterTransmitter.bits.a_address <= addrReg @[TilelinkHost.scala 42:45]
    io.tlMasterTransmitter.bits.a_param <= UInt<1>("h0") @[TilelinkHost.scala 43:45]
    io.tlMasterTransmitter.bits.a_source <= UInt<1>("h0") @[TilelinkHost.scala 44:45]
    io.tlMasterTransmitter.bits.a_size <= UInt<1>("h0") @[TilelinkHost.scala 45:45]
    io.tlMasterTransmitter.bits.a_mask <= UInt<1>("h0") @[TilelinkHost.scala 46:45]
    io.tlMasterTransmitter.bits.a_corrupt <= UInt<1>("h0") @[TilelinkHost.scala 47:45]
    io.tlMasterTransmitter.valid <= UInt<1>("h0") @[TilelinkHost.scala 48:45]
    io.rspOut.bits.dataResponse <= UInt<1>("h0") @[TilelinkHost.scala 50:45]
    io.rspOut.bits.error <= UInt<1>("h0") @[TilelinkHost.scala 51:45]
    io.rspOut.valid <= UInt<1>("h0") @[TilelinkHost.scala 53:45]
    node _T = eq(stateReg, UInt<1>("h0")) @[TilelinkHost.scala 56:19]
    when _T : @[TilelinkHost.scala 56:28]
      when io.reqIn.valid : @[TilelinkHost.scala 60:29]
        node _io_tlMasterTransmitter_bits_a_opcode_T = eq(io.reqIn.bits.activeByteLane, UInt<4>("hf")) @[TilelinkHost.scala 62:116]
        node _io_tlMasterTransmitter_bits_a_opcode_T_1 = mux(_io_tlMasterTransmitter_bits_a_opcode_T, UInt<1>("h0"), UInt<1>("h1")) @[TilelinkHost.scala 62:86]
        node _io_tlMasterTransmitter_bits_a_opcode_T_2 = mux(io.reqIn.bits.isWrite, _io_tlMasterTransmitter_bits_a_opcode_T_1, UInt<3>("h4")) @[TilelinkHost.scala 62:59]
        io.tlMasterTransmitter.bits.a_opcode <= _io_tlMasterTransmitter_bits_a_opcode_T_2 @[TilelinkHost.scala 62:53]
        io.tlMasterTransmitter.bits.a_data <= io.reqIn.bits.dataRequest @[TilelinkHost.scala 63:53]
        io.tlMasterTransmitter.bits.a_address <= io.reqIn.bits.addrRequest @[TilelinkHost.scala 64:53]
        io.tlMasterTransmitter.bits.a_param <= UInt<1>("h0") @[TilelinkHost.scala 65:53]
        io.tlMasterTransmitter.bits.a_source <= UInt<2>("h2") @[TilelinkHost.scala 66:53]
        node _io_tlMasterTransmitter_bits_a_size_T = eq(UInt<1>("h1"), UInt<3>("h4")) @[Mux.scala 81:61]
        node _io_tlMasterTransmitter_bits_a_size_T_1 = mux(_io_tlMasterTransmitter_bits_a_size_T, UInt<1>("h0"), UInt<2>("h2")) @[Mux.scala 81:58]
        node _io_tlMasterTransmitter_bits_a_size_T_2 = eq(UInt<2>("h2"), UInt<3>("h4")) @[Mux.scala 81:61]
        node _io_tlMasterTransmitter_bits_a_size_T_3 = mux(_io_tlMasterTransmitter_bits_a_size_T_2, UInt<1>("h1"), _io_tlMasterTransmitter_bits_a_size_T_1) @[Mux.scala 81:58]
        node _io_tlMasterTransmitter_bits_a_size_T_4 = eq(UInt<3>("h4"), UInt<3>("h4")) @[Mux.scala 81:61]
        node _io_tlMasterTransmitter_bits_a_size_T_5 = mux(_io_tlMasterTransmitter_bits_a_size_T_4, UInt<2>("h2"), _io_tlMasterTransmitter_bits_a_size_T_3) @[Mux.scala 81:58]
        node _io_tlMasterTransmitter_bits_a_size_T_6 = eq(UInt<4>("h8"), UInt<3>("h4")) @[Mux.scala 81:61]
        node _io_tlMasterTransmitter_bits_a_size_T_7 = mux(_io_tlMasterTransmitter_bits_a_size_T_6, UInt<2>("h3"), _io_tlMasterTransmitter_bits_a_size_T_5) @[Mux.scala 81:58]
        io.tlMasterTransmitter.bits.a_size <= _io_tlMasterTransmitter_bits_a_size_T_7 @[TilelinkHost.scala 67:53]
        io.tlMasterTransmitter.bits.a_mask <= io.reqIn.bits.activeByteLane @[TilelinkHost.scala 73:53]
        io.tlMasterTransmitter.bits.a_corrupt <= UInt<1>("h0") @[TilelinkHost.scala 74:53]
        io.tlMasterTransmitter.valid <= io.reqIn.valid @[TilelinkHost.scala 75:53]
        stateReg <= UInt<1>("h1") @[TilelinkHost.scala 77:22]
        io.tlSlaveReceiver.ready <= UInt<1>("h1") @[TilelinkHost.scala 78:38]
        addrReg <= io.reqIn.bits.addrRequest @[TilelinkHost.scala 79:21]
    else :
      node _T_1 = eq(stateReg, UInt<1>("h1")) @[TilelinkHost.scala 84:25]
      when _T_1 : @[TilelinkHost.scala 84:43]
        io.tlSlaveReceiver.ready <= UInt<1>("h1") @[TilelinkHost.scala 86:34]
        io.reqIn.ready <= UInt<1>("h0") @[TilelinkHost.scala 87:34]
        when io.tlSlaveReceiver.valid : @[TilelinkHost.scala 89:39]
          io.rspOut.bits.dataResponse <= io.tlSlaveReceiver.bits.d_data @[TilelinkHost.scala 91:41]
          io.rspOut.bits.error <= io.tlSlaveReceiver.bits.d_denied @[TilelinkHost.scala 92:34]
          io.rspOut.valid <= io.tlSlaveReceiver.valid @[TilelinkHost.scala 94:29]
          stateReg <= UInt<1>("h0") @[TilelinkHost.scala 95:22]

  module TilelinkDevice_1 :
    input clock : Clock
    input reset : Reset
    output io : { tlSlaveTransmitter : { flip ready : UInt<1>, valid : UInt<1>, bits : { d_opcode : UInt<3>, d_param : UInt<2>, d_size : UInt<2>, d_source : UInt<8>, d_sink : UInt<1>, d_denied : UInt<1>, d_corrupt : UInt<1>, d_data : UInt<32>}}, flip tlMasterReceiver : { flip ready : UInt<1>, valid : UInt<1>, bits : { a_opcode : UInt<3>, a_param : UInt<3>, a_size : UInt<2>, a_source : UInt<8>, a_address : UInt<32>, a_mask : UInt<4>, a_corrupt : UInt<1>, a_data : UInt<32>}}, reqOut : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, flip rspIn : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}}

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[TilelinkDevice.scala 17:27]
    io.tlMasterReceiver.ready <= UInt<1>("h1") @[TilelinkDevice.scala 19:31]
    io.rspIn.ready <= UInt<1>("h0") @[TilelinkDevice.scala 20:20]
    io.reqOut.bits.addrRequest <= UInt<1>("h0") @[TilelinkDevice.scala 23:37]
    io.reqOut.bits.dataRequest <= UInt<1>("h0") @[TilelinkDevice.scala 24:37]
    io.reqOut.bits.activeByteLane <= UInt<1>("h0") @[TilelinkDevice.scala 25:37]
    io.reqOut.bits.isWrite <= UInt<1>("h0") @[TilelinkDevice.scala 26:37]
    io.reqOut.valid <= UInt<1>("h0") @[TilelinkDevice.scala 27:37]
    io.tlSlaveTransmitter.bits.d_opcode <= UInt<1>("h0") @[TilelinkDevice.scala 29:45]
    io.tlSlaveTransmitter.bits.d_data <= UInt<1>("h0") @[TilelinkDevice.scala 30:45]
    io.tlSlaveTransmitter.bits.d_param <= UInt<1>("h0") @[TilelinkDevice.scala 31:45]
    io.tlSlaveTransmitter.bits.d_size <= UInt<1>("h0") @[TilelinkDevice.scala 32:45]
    io.tlSlaveTransmitter.bits.d_source <= UInt<1>("h0") @[TilelinkDevice.scala 33:45]
    io.tlSlaveTransmitter.bits.d_sink <= UInt<1>("h0") @[TilelinkDevice.scala 34:45]
    io.tlSlaveTransmitter.bits.d_denied <= UInt<1>("h0") @[TilelinkDevice.scala 35:45]
    io.tlSlaveTransmitter.bits.d_corrupt <= UInt<1>("h0") @[TilelinkDevice.scala 36:45]
    io.tlSlaveTransmitter.valid <= UInt<1>("h0") @[TilelinkDevice.scala 37:45]
    node _T = eq(stateReg, UInt<1>("h0")) @[TilelinkDevice.scala 41:19]
    when _T : @[TilelinkDevice.scala 41:28]
      when io.tlMasterReceiver.valid : @[TilelinkDevice.scala 43:40]
        io.reqOut.bits.addrRequest <= io.tlMasterReceiver.bits.a_address @[TilelinkDevice.scala 45:40]
        io.reqOut.bits.dataRequest <= io.tlMasterReceiver.bits.a_data @[TilelinkDevice.scala 46:40]
        io.reqOut.bits.activeByteLane <= io.tlMasterReceiver.bits.a_mask @[TilelinkDevice.scala 47:43]
        node _io_reqOut_bits_isWrite_T = eq(io.tlMasterReceiver.bits.a_opcode, UInt<1>("h0")) @[TilelinkDevice.scala 48:73]
        node _io_reqOut_bits_isWrite_T_1 = eq(io.tlMasterReceiver.bits.a_opcode, UInt<1>("h1")) @[TilelinkDevice.scala 48:128]
        node _io_reqOut_bits_isWrite_T_2 = or(_io_reqOut_bits_isWrite_T, _io_reqOut_bits_isWrite_T_1) @[TilelinkDevice.scala 48:91]
        io.reqOut.bits.isWrite <= _io_reqOut_bits_isWrite_T_2 @[TilelinkDevice.scala 48:36]
        io.reqOut.valid <= UInt<1>("h1") @[TilelinkDevice.scala 49:29]
        stateReg <= UInt<1>("h1") @[TilelinkDevice.scala 51:22]
        io.rspIn.ready <= UInt<1>("h1") @[TilelinkDevice.scala 52:28]
    else :
      node _T_1 = eq(stateReg, UInt<1>("h1")) @[TilelinkDevice.scala 56:25]
      when _T_1 : @[TilelinkDevice.scala 56:43]
        io.rspIn.ready <= UInt<1>("h1") @[TilelinkDevice.scala 58:24]
        when io.rspIn.valid : @[TilelinkDevice.scala 60:29]
          io.tlSlaveTransmitter.bits.d_opcode <= UInt<1>("h1") @[TilelinkDevice.scala 62:49]
          io.tlSlaveTransmitter.bits.d_data <= io.rspIn.bits.dataResponse @[TilelinkDevice.scala 63:47]
          io.tlSlaveTransmitter.bits.d_param <= UInt<1>("h0") @[TilelinkDevice.scala 64:48]
          io.tlSlaveTransmitter.bits.d_size <= io.tlMasterReceiver.bits.a_size @[TilelinkDevice.scala 65:47]
          io.tlSlaveTransmitter.bits.d_source <= io.tlMasterReceiver.bits.a_source @[TilelinkDevice.scala 66:49]
          io.tlSlaveTransmitter.bits.d_sink <= UInt<1>("h0") @[TilelinkDevice.scala 67:47]
          io.tlSlaveTransmitter.bits.d_denied <= io.rspIn.bits.error @[TilelinkDevice.scala 68:49]
          io.tlSlaveTransmitter.bits.d_corrupt <= UInt<1>("h0") @[TilelinkDevice.scala 69:50]
          io.tlSlaveTransmitter.valid <= io.rspIn.valid @[TilelinkDevice.scala 70:41]
          stateReg <= UInt<1>("h0") @[TilelinkDevice.scala 72:22]

  module TilelinkAdapter_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip reqIn : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rspOut : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}, reqOut : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, flip rspIn : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}}

    inst tlHost of TilelinkHost_1 @[TilelinkAdapter.scala 18:24]
    tlHost.clock <= clock
    tlHost.reset <= reset
    inst tlSlave of TilelinkDevice_1 @[TilelinkAdapter.scala 19:25]
    tlSlave.clock <= clock
    tlSlave.reset <= reset
    tlSlave.io.tlMasterReceiver <= tlHost.io.tlMasterTransmitter @[TilelinkAdapter.scala 22:35]
    tlHost.io.tlSlaveReceiver <= tlSlave.io.tlSlaveTransmitter @[TilelinkAdapter.scala 25:35]
    tlHost.io.reqIn <= io.reqIn @[TilelinkAdapter.scala 28:21]
    io.rspOut.bits <= tlHost.io.rspOut.bits @[TilelinkAdapter.scala 31:15]
    io.rspOut.valid <= tlHost.io.rspOut.valid @[TilelinkAdapter.scala 31:15]
    tlHost.io.rspOut.ready <= io.rspOut.ready @[TilelinkAdapter.scala 31:15]
    io.reqOut.bits <= tlSlave.io.reqOut.bits @[TilelinkAdapter.scala 34:15]
    io.reqOut.valid <= tlSlave.io.reqOut.valid @[TilelinkAdapter.scala 34:15]
    tlSlave.io.reqOut.ready <= io.reqOut.ready @[TilelinkAdapter.scala 34:15]
    tlSlave.io.rspIn <= io.rspIn @[TilelinkAdapter.scala 37:22]

  module BlockRamWithoutMasking :
    input clock : Clock
    input reset : Reset
    output io : { flip req : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rsp : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}}

    wire addrMisaligned : UInt<1> @[BlockRam.scala 67:28]
    wire addrOutOfBounds : UInt<1> @[BlockRam.scala 68:29]
    reg validReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[BlockRam.scala 72:25]
    reg errReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[BlockRam.scala 73:23]
    io.rsp.valid <= validReg @[BlockRam.scala 74:16]
    io.rsp.bits.error <= errReg @[BlockRam.scala 75:21]
    io.req.ready <= UInt<1>("h1") @[BlockRam.scala 76:16]
    node _addrMisaligned_T = and(io.req.ready, io.req.valid) @[Decoupled.scala 50:35]
    node _addrMisaligned_T_1 = bits(io.req.bits.addrRequest, 1, 0) @[BlockRam.scala 78:63]
    node _addrMisaligned_T_2 = orr(_addrMisaligned_T_1) @[BlockRam.scala 78:72]
    node _addrMisaligned_T_3 = mux(_addrMisaligned_T, _addrMisaligned_T_2, UInt<1>("h0")) @[BlockRam.scala 78:24]
    addrMisaligned <= _addrMisaligned_T_3 @[BlockRam.scala 78:18]
    node _addrOutOfBounds_T = and(io.req.ready, io.req.valid) @[Decoupled.scala 50:35]
    node _addrOutOfBounds_T_1 = div(io.req.bits.addrRequest, UInt<3>("h4")) @[BlockRam.scala 79:65]
    node _addrOutOfBounds_T_2 = geq(_addrOutOfBounds_T_1, UInt<10>("h3ff")) @[BlockRam.scala 79:71]
    node _addrOutOfBounds_T_3 = mux(_addrOutOfBounds_T, _addrOutOfBounds_T_2, UInt<1>("h0")) @[BlockRam.scala 79:25]
    addrOutOfBounds <= _addrOutOfBounds_T_3 @[BlockRam.scala 79:19]
    node _errReg_T = or(addrMisaligned, addrOutOfBounds) @[BlockRam.scala 81:28]
    errReg <= _errReg_T @[BlockRam.scala 81:10]
    smem mem : UInt<32> [1024] @[BlockRam.scala 82:24]
    node _T = and(io.req.ready, io.req.valid) @[Decoupled.scala 50:35]
    node _T_1 = eq(io.req.bits.isWrite, UInt<1>("h0")) @[BlockRam.scala 88:25]
    node _T_2 = and(_T, _T_1) @[BlockRam.scala 88:22]
    when _T_2 : @[BlockRam.scala 88:47]
      node _io_rsp_bits_dataResponse_T = div(io.req.bits.addrRequest, UInt<3>("h4")) @[BlockRam.scala 90:65]
      wire _io_rsp_bits_dataResponse_WIRE : UInt @[BlockRam.scala 90:41]
      _io_rsp_bits_dataResponse_WIRE is invalid @[BlockRam.scala 90:41]
      when UInt<1>("h1") : @[BlockRam.scala 90:41]
        _io_rsp_bits_dataResponse_WIRE <= _io_rsp_bits_dataResponse_T @[BlockRam.scala 90:41]
        node _io_rsp_bits_dataResponse_T_1 = or(_io_rsp_bits_dataResponse_WIRE, UInt<10>("h0")) @[BlockRam.scala 90:41]
        node _io_rsp_bits_dataResponse_T_2 = bits(_io_rsp_bits_dataResponse_T_1, 9, 0) @[BlockRam.scala 90:41]
        read mport io_rsp_bits_dataResponse_MPORT = mem[_io_rsp_bits_dataResponse_T_2], clock @[BlockRam.scala 90:41]
      io.rsp.bits.dataResponse <= io_rsp_bits_dataResponse_MPORT @[BlockRam.scala 90:30]
      validReg <= UInt<1>("h1") @[BlockRam.scala 91:14]
    else :
      node _T_3 = and(io.req.ready, io.req.valid) @[Decoupled.scala 50:35]
      node _T_4 = and(_T_3, io.req.bits.isWrite) @[BlockRam.scala 92:29]
      when _T_4 : @[BlockRam.scala 92:53]
        node _T_5 = div(io.req.bits.addrRequest, UInt<3>("h4")) @[BlockRam.scala 94:38]
        node _T_6 = bits(_T_5, 9, 0)
        write mport MPORT = mem[_T_6], clock
        MPORT <= io.req.bits.dataRequest
        validReg <= UInt<1>("h1") @[BlockRam.scala 95:14]
        io.rsp.bits.dataResponse is invalid @[BlockRam.scala 96:30]
      else :
        validReg <= UInt<1>("h0") @[BlockRam.scala 98:14]
        io.rsp.bits.dataResponse is invalid @[BlockRam.scala 99:30]

  module BlockRamWithMasking :
    input clock : Clock
    input reset : Reset
    output io : { flip req : { flip ready : UInt<1>, valid : UInt<1>, bits : { addrRequest : UInt<32>, dataRequest : UInt<32>, activeByteLane : UInt<4>, isWrite : UInt<1>}}, rsp : { flip ready : UInt<1>, valid : UInt<1>, bits : { dataResponse : UInt<32>, error : UInt<1>}}}

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
    reg validReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[BlockRam.scala 136:25]
    io.rsp.valid <= validReg @[BlockRam.scala 137:16]
    io.rsp.bits.error <= UInt<1>("h0") @[BlockRam.scala 138:21]
    io.req.ready <= UInt<1>("h1") @[BlockRam.scala 139:16]
    smem mem : UInt<8>[4] [1024] @[BlockRam.scala 141:24]
    node _T = and(io.req.ready, io.req.valid) @[Decoupled.scala 50:35]
    node _T_1 = eq(io.req.bits.isWrite, UInt<1>("h0")) @[BlockRam.scala 143:25]
    node _T_2 = and(_T, _T_1) @[BlockRam.scala 143:22]
    when _T_2 : @[BlockRam.scala 143:47]
      node _T_3 = div(io.req.bits.addrRequest, UInt<3>("h4")) @[BlockRam.scala 145:46]
      wire _WIRE : UInt @[BlockRam.scala 145:22]
      _WIRE is invalid @[BlockRam.scala 145:22]
      when UInt<1>("h1") : @[BlockRam.scala 145:22]
        _WIRE <= _T_3 @[BlockRam.scala 145:22]
        node _T_4 = or(_WIRE, UInt<10>("h0")) @[BlockRam.scala 145:22]
        node _T_5 = bits(_T_4, 9, 0) @[BlockRam.scala 145:22]
        read mport MPORT = mem[_T_5], clock @[BlockRam.scala 145:22]
      rdata <= MPORT @[BlockRam.scala 145:11]
      validReg <= UInt<1>("h1") @[BlockRam.scala 146:14]
    else :
      node _T_6 = and(io.req.ready, io.req.valid) @[Decoupled.scala 50:35]
      node _T_7 = and(_T_6, io.req.bits.isWrite) @[BlockRam.scala 147:29]
      when _T_7 : @[BlockRam.scala 147:53]
        node _T_8 = div(io.req.bits.addrRequest, UInt<3>("h4")) @[BlockRam.scala 149:38]
        node _T_9 = bits(_T_8, 9, 0)
        write mport MPORT_1 = mem[_T_9], clock
        when mask[0] :
          MPORT_1[0] <= wdata[0]
        when mask[1] :
          MPORT_1[1] <= wdata[1]
        when mask[2] :
          MPORT_1[2] <= wdata[2]
        when mask[3] :
          MPORT_1[3] <= wdata[3]
        validReg <= UInt<1>("h1") @[BlockRam.scala 150:14]
        rdata[0] is invalid @[BlockRam.scala 151:18]
        rdata[1] is invalid @[BlockRam.scala 151:18]
        rdata[2] is invalid @[BlockRam.scala 151:18]
        rdata[3] is invalid @[BlockRam.scala 151:18]
      else :
        validReg <= UInt<1>("h0") @[BlockRam.scala 153:14]
        rdata[0] is invalid @[BlockRam.scala 154:18]
        rdata[1] is invalid @[BlockRam.scala 154:18]
        rdata[2] is invalid @[BlockRam.scala 154:18]
        rdata[3] is invalid @[BlockRam.scala 154:18]
    node _T_10 = eq(mask[0], UInt<1>("h1")) @[BlockRam.scala 160:11]
    node _T_11 = mux(_T_10, rdata[0], UInt<1>("h0")) @[BlockRam.scala 160:8]
    node _T_12 = eq(mask[1], UInt<1>("h1")) @[BlockRam.scala 160:11]
    node _T_13 = mux(_T_12, rdata[1], UInt<1>("h0")) @[BlockRam.scala 160:8]
    node _T_14 = eq(mask[2], UInt<1>("h1")) @[BlockRam.scala 160:11]
    node _T_15 = mux(_T_14, rdata[2], UInt<1>("h0")) @[BlockRam.scala 160:8]
    node _T_16 = eq(mask[3], UInt<1>("h1")) @[BlockRam.scala 160:11]
    node _T_17 = mux(_T_16, rdata[3], UInt<1>("h0")) @[BlockRam.scala 160:8]
    data[0] <= _T_11 @[BlockRam.scala 159:8]
    data[1] <= _T_13 @[BlockRam.scala 159:8]
    data[2] <= _T_15 @[BlockRam.scala 159:8]
    data[3] <= _T_17 @[BlockRam.scala 159:8]
    node io_rsp_bits_dataResponse_lo = cat(data[1], data[0]) @[Cat.scala 31:58]
    node io_rsp_bits_dataResponse_hi = cat(data[3], data[2]) @[Cat.scala 31:58]
    node _io_rsp_bits_dataResponse_T = cat(io_rsp_bits_dataResponse_hi, io_rsp_bits_dataResponse_lo) @[Cat.scala 31:58]
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
    output io : { pin : UInt<1>}

    inst instr_adapter of TilelinkAdapter @[IbexJigsaw.scala 19:31]
    instr_adapter.clock <= clock
    instr_adapter.reset <= reset
    inst data_adapter of TilelinkAdapter_1 @[IbexJigsaw.scala 20:30]
    data_adapter.clock <= clock
    data_adapter.reset <= reset
    inst instr_mem of BlockRamWithoutMasking @[IbexJigsaw.scala 22:27]
    instr_mem.clock <= clock
    instr_mem.reset <= reset
    inst data_mem of BlockRamWithMasking @[IbexJigsaw.scala 23:27]
    data_mem.clock <= clock
    data_mem.reset <= reset
    instr_mem.io.req <= instr_adapter.io.reqOut @[IbexJigsaw.scala 25:29]
    instr_adapter.io.rspIn <= instr_mem.io.rsp @[IbexJigsaw.scala 26:22]
    data_mem.io.req <= data_adapter.io.reqOut @[IbexJigsaw.scala 28:28]
    data_adapter.io.rspIn <= data_mem.io.rsp @[IbexJigsaw.scala 29:21]
    inst ibex of BlackBoxIbexCore @[IbexJigsaw.scala 33:22]
    ibex.scan_rst_ni is invalid
    ibex.core_sleep_o is invalid
    ibex.alert_major_o is invalid
    ibex.alert_minor_o is invalid
    ibex.fetch_enable_i is invalid
    ibex.debug_req_i is invalid
    ibex.irq_nm_i is invalid
    ibex.irq_fast_i is invalid
    ibex.irq_external_i is invalid
    ibex.irq_timer_i is invalid
    ibex.irq_software_i is invalid
    ibex.data_err_i is invalid
    ibex.data_rdata_i is invalid
    ibex.data_wdata_o is invalid
    ibex.data_addr_o is invalid
    ibex.data_be_o is invalid
    ibex.data_we_o is invalid
    ibex.data_rvalid_i is invalid
    ibex.data_gnt_i is invalid
    ibex.data_req_o is invalid
    ibex.instr_err_i is invalid
    ibex.instr_rdata_i is invalid
    ibex.instr_addr_o is invalid
    ibex.instr_rvalid_i is invalid
    ibex.instr_gnt_i is invalid
    ibex.instr_req_o is invalid
    ibex.hart_id_i is invalid
    ibex.test_en_i is invalid
    ibex.rst_ni is invalid
    ibex.clk_i is invalid
    node _clk_T = asUInt(clock) @[IbexJigsaw.scala 35:36]
    node _clk_T_1 = bits(_clk_T, 0, 0) @[IbexJigsaw.scala 35:38]
    wire clk : UInt<1>
    clk <= _clk_T_1
    node _rst_T = bits(reset, 0, 0) @[IbexJigsaw.scala 36:38]
    wire rst : UInt<1>
    rst <= _rst_T
    ibex.clk_i <= clock @[IbexJigsaw.scala 38:19]
    node _ibex_io_rst_ni_T = not(rst) @[IbexJigsaw.scala 39:23]
    ibex.rst_ni <= _ibex_io_rst_ni_T @[IbexJigsaw.scala 39:20]
    ibex.test_en_i <= UInt<1>("h1") @[IbexJigsaw.scala 40:23]
    ibex.hart_id_i <= UInt<12>("hf14") @[IbexJigsaw.scala 41:23]
    instr_adapter.io.reqIn.valid <= ibex.instr_req_o @[IbexJigsaw.scala 44:34]
    node _instr_adapter_io_reqIn_bits_addrRequest_T = bits(ibex.instr_addr_o, 31, 2) @[IbexJigsaw.scala 45:68]
    instr_adapter.io.reqIn.bits.addrRequest <= _instr_adapter_io_reqIn_bits_addrRequest_T @[IbexJigsaw.scala 45:45]
    instr_adapter.io.reqIn.bits.isWrite <= UInt<1>("h0") @[IbexJigsaw.scala 46:41]
    instr_adapter.io.reqIn.bits.activeByteLane <= UInt<1>("h0") @[IbexJigsaw.scala 47:48]
    instr_adapter.io.reqIn.bits.dataRequest <= UInt<1>("h0") @[IbexJigsaw.scala 48:45]
    ibex.instr_gnt_i <= instr_adapter.io.reqIn.ready @[IbexJigsaw.scala 49:25]
    ibex.instr_rvalid_i <= instr_adapter.io.rspOut.valid @[IbexJigsaw.scala 50:28]
    ibex.instr_rdata_i <= instr_adapter.io.rspOut.bits.dataResponse @[IbexJigsaw.scala 51:27]
    ibex.instr_err_i <= instr_adapter.io.rspOut.bits.error @[IbexJigsaw.scala 53:25]
    instr_adapter.io.rspOut.ready <= UInt<1>("h1") @[IbexJigsaw.scala 54:35]
    data_adapter.io.reqIn.valid <= ibex.data_req_o @[IbexJigsaw.scala 58:33]
    data_adapter.io.reqIn.bits.addrRequest <= ibex.data_addr_o @[IbexJigsaw.scala 59:44]
    data_adapter.io.reqIn.bits.dataRequest <= ibex.data_wdata_o @[IbexJigsaw.scala 60:44]
    data_adapter.io.reqIn.bits.isWrite <= ibex.data_we_o @[IbexJigsaw.scala 61:40]
    data_adapter.io.reqIn.bits.activeByteLane <= ibex.data_be_o @[IbexJigsaw.scala 62:47]
    ibex.data_gnt_i <= data_adapter.io.reqIn.ready @[IbexJigsaw.scala 63:24]
    ibex.data_rvalid_i <= data_adapter.io.rspOut.valid @[IbexJigsaw.scala 64:27]
    ibex.data_rdata_i <= data_adapter.io.rspOut.bits.dataResponse @[IbexJigsaw.scala 65:26]
    ibex.data_err_i <= data_adapter.io.rspOut.bits.error @[IbexJigsaw.scala 67:24]
    data_adapter.io.rspOut.ready <= UInt<1>("h1") @[IbexJigsaw.scala 68:34]
    ibex.debug_req_i <= UInt<1>("h0") @[IbexJigsaw.scala 71:25]
    ibex.irq_software_i <= UInt<1>("h0") @[IbexJigsaw.scala 72:28]
    ibex.irq_timer_i <= UInt<1>("h0") @[IbexJigsaw.scala 73:25]
    ibex.irq_external_i <= UInt<1>("h0") @[IbexJigsaw.scala 74:28]
    ibex.irq_fast_i <= UInt<1>("h0") @[IbexJigsaw.scala 75:24]
    ibex.irq_nm_i <= UInt<1>("h0") @[IbexJigsaw.scala 76:22]
    ibex.fetch_enable_i <= UInt<1>("h1") @[IbexJigsaw.scala 77:28]
    ibex.scan_rst_ni <= UInt<1>("h1") @[IbexJigsaw.scala 78:25]
    io.pin <= ibex.core_sleep_o @[IbexJigsaw.scala 80:12]

