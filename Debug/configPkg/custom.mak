## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,e66 linker.cmd \
  package/cfg/mcip_slave_pe66.oe66 \

linker.cmd: package/cfg/mcip_slave_pe66.xdl
	$(SED) 's"^\"\(package/cfg/mcip_slave_pe66cfg.cmd\)\"$""\"E:/Studio/TICCS/mcip_slave/Debug/configPkg/\1\""' package/cfg/mcip_slave_pe66.xdl > $@
