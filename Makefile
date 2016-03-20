PROJECT = test
SOURCE_FILES = test.v

MAP_ARGS = --family="Cyclone II"
FIT_ARGS = --part=EP2C5T144C8
ASM_ARGS =
STA_ARGS =


all: smart.log output_files/$(PROJECT).asm.rpt output_files/$(PROJECT).sta.rpt

clean:
	rm -rf map.chg output_files/*.rpt smart.log *.htm *.eqn *.pin *.sof *.pof *.qpf *.qsf db incremental_db

map: smart.log output_files/$(PROJECT).map.rpt
fit: smart.log output_files/$(PROJECT).fit.rpt
asm: smart.log output_files/$(PROJECT).asm.rpt
sta: smart.log output_files/$(PROJECT).sta.rpt
smart: smart.log

upload: output_files/$(PROJECT).asm.rpt
	quartus_pgm -z --mode=JTAG --operation="p;output_files/$(PROJECT).sof"

upload_as: output_files/$(PROJECT).asm.rpt
	quartus_pgm -z --mode=AS --operation="p;output_files/$(PROJECT).pof"


output_files/$(PROJECT).map.rpt: $(SOURCE_FILES) $(PROJECT).qpf
	quartus_map $(MAP_ARGS) $(PROJECT)

output_files/$(PROJECT).fit.rpt: output_files/$(PROJECT).map.rpt
	quartus_fit $(FIT_ARGS) $(PROJECT)

output_files/$(PROJECT).asm.rpt: output_files/$(PROJECT).fit.rpt
	quartus_asm $(ASM_ARGS) $(PROJECT)

output_files/$(PROJECT).sta.rpt: output_files/$(PROJECT).fit.rpt
	quartus_sta $(STA_ARGS) $(PROJECT) 

smart.log: $(PROJECT).qpf $(PROJECT).qsf
	quartus_sh --determine_smart_action $(PROJECT) > smart.log

$(PROJECT).qpf $(PROJECT).qsf: $(PROJECT).tcl
	quartus_sh -t $(PROJECT).tcl

.PHONY: all clean map fit asm sta smart upload upload_as
