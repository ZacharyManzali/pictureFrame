# Local shortcuts. CI runs the same steps (see .github/workflows).
#   make hw            ERC + DRC + all fab/assembly/doc outputs -> outputs/
#   make check         ERC + DRC only (fast, needs only KiCad)
#   make fw            build firmware        (BOARD=nucleo_f401re by default)
#   make flash         flash the last firmware build

BOARD   ?= nucleo_f401re
KIBOT   ?= $(HOME)/.venvs/kibot/bin/kibot
HW      := hardware
OUT     := outputs

# KiBot needs to know where KiCad's libraries and templates live.
KICAD_SHARE ?= /usr/share/kicad
export KICAD9_SYMBOL_DIR    ?= $(KICAD_SHARE)/symbols
export KICAD9_FOOTPRINT_DIR ?= $(KICAD_SHARE)/footprints
export KICAD9_3DMODEL_DIR   ?= $(KICAD_SHARE)/3dmodels
export KICAD9_TEMPLATE_DIR  ?= $(KICAD_SHARE)/template
export PATH := $(dir $(KIBOT)):$(PATH)

.PHONY: hw check fw flash clean

hw:
	$(KIBOT) -c $(HW)/kibot.yaml -e $(HW)/board.kicad_sch -b $(HW)/board.kicad_pcb -d $(OUT)

check:
	mkdir -p $(OUT)
	kicad-cli sch erc --exit-code-violations -o $(OUT)/erc.rpt $(HW)/board.kicad_sch
	kicad-cli pcb drc --exit-code-violations --schematic-parity -o $(OUT)/drc.rpt $(HW)/board.kicad_pcb

fw:
	west build -b $(BOARD) -d build/$(BOARD) firmware/app

flash:
	west flash -d build/$(BOARD)

clean:
	rm -rf $(OUT) build
