PROJECT = test
SOURCE_FILES = test.v
ASSIGNMENT_FILES = test.qpf test.qsf

MAP_ARGS = --family="Cyclone II"
FIT_ARGS = --part=EP2C5T144C8
ASM_ARGS =
STA_ARGS =


all: smart.log output_files/$(PROJECT).asm.rpt output_files/$(PROJECT).sta.rpt

clean:
	rm -rf output_files/*.rpt smart.log *.htm *.eqn *.pin *.sof *.pof *.qpf *.qsf db incremental_db

map: smart.log $(PROJECT).map.rpt
fit: smart.log $(PROJECT).fit.rpt
asm: smart.log $(PROJECT).asm.rpt
sta: smart.log $(PROJECT).sta.rpt
smart: smart.log


output_files/$(PROJECT).map.rpt: $(SOURCE_FILES)
	quartus_map $(MAP_ARGS) $(PROJECT)

output_files/$(PROJECT).fit.rpt: output_files/$(PROJECT).map.rpt
	quartus_fit $(FIT_ARGS) $(PROJECT)

output_files/$(PROJECT).asm.rpt: output_files/$(PROJECT).fit.rpt
	quartus_asm $(ASM_ARGS) $(PROJECT)

output_files/$(PROJECT).sta.rpt: output_files/$(PROJECT).fit.rpt
	quartus_sta $(STA_ARGS) $(PROJECT) 

smart.log: $(ASSIGNMENT_FILES)
	quartus_sh --determine_smart_action $(PROJECT) > smart.log

$(ASSIGNMENT_FILES): ${PROJECT}.tcl
	quartus_sh -t ${PROJECT}.tcl

.PHONY: all clean map fit asm sta smart
