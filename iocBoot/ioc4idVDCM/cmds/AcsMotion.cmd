# Load ACS support, motorAcsMotion is built as a submodule of motor
# iocshLoad("$(MOTOR)/iocsh/ACS_Motion_tcp.iocsh", "INSTANCE=ACS1,IP_ADDR=164.54.115.16,NUM_AXES=5,IDLE_POLL=0.2")
iocshLoad("$(MOTOR_ACSMOTION)/iocsh/ACS_Motion_tcp.iocsh", "INSTANCE=ACS1,IP_ADDR=164.54.115.16,NUM_AXES=5,IDLE_POLL=0.2")

# Load motor records
dbLoadTemplate("substitutions/AcsMotion.substitutions","P=$(PREFIX)")

# Load an asyn record for debugging
dbLoadRecords("$(ASYN)/db/asynRecord.db","P=$(PREFIX),R=asyn_1,PORT=ACS1_ETH,ADDR=0,OMAX=256,IMAX=256")


# TODO: Get rid of this once we have autosave

# Set ERES to EFAC for each axis
doAfterIocInit("dbpf('$(PREFIX)m1.ERES','-5.72957795e-07')")
doAfterIocInit("dbpf('$(PREFIX)m2.ERES','0.00005')")
doAfterIocInit("dbpf('$(PREFIX)m3.ERES','0.00005')")
doAfterIocInit("dbpf('$(PREFIX)m4.ERES','0.000001')")
doAfterIocInit("dbpf('$(PREFIX)m5.ERES','0.00000002677')")

# set offset for bragg angle conversion
doAfterIocInit("dbpf('$(PREFIX)m1.OFF','101.26886969629788')")
doAfterIocInit("dbpf('$(PREFIX)m1.FOFF','1')") # frozen

# Set VMAX
doAfterIocInit("dbpf('$(PREFIX)m1.VMAX','0.7')")
doAfterIocInit("dbpf('$(PREFIX)m2.VMAX','1.0')")
doAfterIocInit("dbpf('$(PREFIX)m3.VMAX','0.6')")
doAfterIocInit("dbpf('$(PREFIX)m4.VMAX','0.05')")
doAfterIocInit("dbpf('$(PREFIX)m5.VMAX','0.0004')")

# Set use encoder = YES
doAfterIocInit("dbpf('$(PREFIX)m1.UEIP','1')")
doAfterIocInit("dbpf('$(PREFIX)m2.UEIP','1')")
doAfterIocInit("dbpf('$(PREFIX)m3.UEIP','1')")
doAfterIocInit("dbpf('$(PREFIX)m4.UEIP','1')")
doAfterIocInit("dbpf('$(PREFIX)m5.UEIP','1')")