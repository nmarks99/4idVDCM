# Use the following line if motorAcsMotion is built as a submodule of motor
iocshLoad("$(MOTOR)/iocsh/ACS_Motion_tcp.iocsh", "INSTANCE=ACS1,IP_ADDR=164.54.106.160,NUM_AXES=8,MOVING_POLL=0.1,IDLE_POLL=0.2")
iocshLoad("$(MOTOR)/iocsh/ACS_Motion_AuxIO_tcp.iocsh", "INSTANCE=ACS1_IO,IP_ADDR=164.54.106.160,NUM_CHAN=32,POLL_PERIOD=0.1")

# Load motor records
dbLoadTemplate("substitutions/AcsMotion.substitutions","P=$(PREFIX)")
dbLoadTemplate("substitutions/AcsMotionAuxIO.substitutions","P=$(PREFIX)")

# Load an asyn record for debugging
dbLoadRecords("$(ASYN)/db/asynRecord.db","P=$(PREFIX),R=asyn,PORT=ACS1_ETH,ADDR=0,OMAX=256,IMAX=256")
dbLoadRecords("$(ASYN)/db/asynRecord.db","P=$(PREFIX),R=io:asyn,PORT=ACS1_IO_ETH,ADDR=0,OMAX=256,IMAX=256")
