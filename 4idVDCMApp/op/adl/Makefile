all:
	export CAQTDM_DISPLAY_PATH=$(CAQTDM_DISPLAY_PATH):/APSshare/uisys/sr/id
	/APSshare/bin/adl2ui vdcm.adl
	/APSshare/bin/adl2ui crystal_select.adl
	mv vdcm.ui ../ui/autoconvert/
	mv crystal_select.ui ../ui/autoconvert/
clean:
	rm ../ui/autoconvert/vdcm.ui
	rm ../ui/autoconvert/crystal_select.ui
