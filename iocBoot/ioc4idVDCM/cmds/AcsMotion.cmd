# Load ACS support, it is build as a standalone module
iocshLoad("$(MOTOR_ACSMOTION)/iocsh/ACS_Motion_tcp.iocsh", "INSTANCE=ACS1,IP_ADDR=164.54.115.16,NUM_AXES=5,IDLE_POLL=0.2")

# Load motor records
dbLoadTemplate("substitutions/AcsMotion.substitutions","P=$(PREFIX)")

# Load an asyn record for debugging
dbLoadRecords("$(ASYN)/db/asynRecord.db","P=$(PREFIX),R=asyn_1,PORT=ACS1,ADDR=0,OMAX=256,IMAX=256")


# Set ERES to EFAC for each axis
doAfterIocInit("dbpf('$(PREFIX)m1.ERES','-5.72957795e-07')") # converted to deg
doAfterIocInit("dbpf('$(PREFIX)m2.ERES','0.00005')")
doAfterIocInit("dbpf('$(PREFIX)m3.ERES','0.00005')")
doAfterIocInit("dbpf('$(PREFIX)m4.ERES','3.9184953e-6')") # converted to mrad
doAfterIocInit("dbpf('$(PREFIX)m5.ERES','0.00000002677')")

# Offset for bragg angle to match indicator on mono
doAfterIocInit("dbpf('$(PREFIX)m1.OFF','101.26886969629788')")
doAfterIocInit("dbpf('$(PREFIX)m1.FOFF','1')") # frozen

# Set monitor deadband for Bragg motor
doAfterIocInit("dbpf('$(PREFIX)m1.MDEL','0.0001')")

# Offset for crystal selection (X) to zero at left limit
doAfterIocInit("dbpf('$(PREFIX)m2.OFF','-55.0')")
doAfterIocInit("dbpf('$(PREFIX)m2.FOFF','1')") # frozen

# offset for crystal gap (Y) with known enc=52.209 -> 25mm gap
doAfterIocInit("dbpf('$(PREFIX)m3.OFF','-27.209')")
doAfterIocInit("dbpf('$(PREFIX)m3.FOFF','1')") # frozen
doAfterIocInit("dbpf('$(PREFIX)m3.HLM','26.8')")
doAfterIocInit("dbpf('$(PREFIX)m3.LLM','8.2')")

# offset for pitch 2
doAfterIocInit("dbpf('$(PREFIX)m4.OFF','-99.1665')") # centered between limits
doAfterIocInit("dbpf('$(PREFIX)m4.FOFF','1')") # frozen
doAfterIocInit("dbpf('$(PREFIX)m4.HLM','5.2')")
doAfterIocInit("dbpf('$(PREFIX)m4.LLM','-5.2')")

# Set VMAX
doAfterIocInit("dbpf('$(PREFIX)m1.VMAX','0.4')") # deg/s
doAfterIocInit("dbpf('$(PREFIX)m2.VMAX','1.0')") # mm/s
doAfterIocInit("dbpf('$(PREFIX)m3.VMAX','0.6')") # mm/s
# doAfterIocInit("dbpf('$(PREFIX)m4.VMAX','0.01')") # deg/s
doAfterIocInit("dbpf('$(PREFIX)m4.VMAX','0.17')") # mrad/s
doAfterIocInit("dbpf('$(PREFIX)m5.VMAX','0.0004')") # rad/s

# Set use encoder = YES
doAfterIocInit("dbpf('$(PREFIX)m1.UEIP','1')")
doAfterIocInit("dbpf('$(PREFIX)m2.UEIP','1')")
doAfterIocInit("dbpf('$(PREFIX)m3.UEIP','1')")
doAfterIocInit("dbpf('$(PREFIX)m4.UEIP','1')")
doAfterIocInit("dbpf('$(PREFIX)m5.UEIP','1')")

# Define the crystal locations
doAfterIocInit("dbpf('$(PREFIX)SiPosition','27.5')")
doAfterIocInit("dbpf('$(PREFIX)SiCPosition','1.0')")
doAfterIocInit("dbpf('$(PREFIX)SiPosition.DISP','1')") # disable put
doAfterIocInit("dbpf('$(PREFIX)SiCPosition.DISP','1')")
