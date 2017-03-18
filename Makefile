INCLUDES=-I include -I src
SOURCES=\
  src/controls.asm \
  src/graphics.asm \
  src/graphics-data.asm \
  src/menu.asm \
	src/variables.asm
ROM_TARGETS=\
	build/rom/crates.rom
DISK_TARGETS=\
	build/disk/crates.bas \
	build/disk/crates.scr \
	build/disk/crates0.bin
ALL_TARGETS=\
	${ROM_TARGETS} \
	${DISK_TARGETS}
ALL_SYMS=\
	build/disk/crates.sym \
	build/disk/crates_openmsx.sym \
	build/rom/crates_openmsx.sym

# Some definitions for ROM version
HEAP_BASE_ADDR=0xc000
STACK_BASE_ADDR=0xf380

# Some definitions for disk version
HEAP_BASE_ADDR=0xc000
SCREEN_BASE_ADDR=0x8400
MAIN_BASE_ADDR=0x8900

all: ${ALL_TARGETS}

sym: ${ALL_SYMS}

build/rom/crates.rom: ${SOURCES} src/rom/main.asm
	mkdir -p build/rom
	pasmo ${INCLUDES} \
		-E HEAP_BASE_ADDR=${HEAP_BASE_ADDR} \
		-E STACK_BASE_ADDR=${STACK_BASE_ADDR} \
		src/rom/main.asm \
		build/rom/crates.rom \
		build/rom/crates.sym

build/disk/crates.bas: src/disk/crates.bas
	mkdir -p build/disk
	cp $< $@

build/disk/crates.scr: ${SOURCES} src/disk/screen.asm
	mkdir -p build/disk
	pasmo ${INCLUDES} \
		-E BINFILE_BASE_ADDR=${SCREEN_BASE_ADDR} \
		-E HEAP_BASE_ADDR=${HEAP_BASE_ADDR} \
		src/disk/screen.asm \
		build/disk/crates.scr \
		build/disk/crates.scr.sym

build/disk/crates0.bin: ${SOURCES} src/disk/main.asm
	mkdir -p build/disk
	pasmo ${INCLUDES} \
		-E BINFILE_BASE_ADDR=${MAIN_BASE_ADDR} \
		-E HEAP_BASE_ADDR=${HEAP_BASE_ADDR} \
		src/disk/main.asm \
		build/disk/crates0.bin \
		build/disk/crates0.bin.sym

build/disk/crates0.bin.sym: build/disk/crates0.bin
build/disk/crates.scr.sym: build/disk/crates.scr
build/rom/crates.sym: build/rom/crates.rom
build/disk/crates.sym: build/disk/crates0.bin.sym build/disk/crates.scr.sym
	cat $^ > $@

%_openmsx.sym: %.sym
	awk '{ print $$1 ": " $$2 " " $$3}' $< | sed 's/H$$/h/g' | sed 's/EQU/equ/g' > $@

.PHONY clean:
	rm -rf build
