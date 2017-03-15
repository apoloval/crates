INCLUDES=-I include -I src
SOURCES=\
  src/controls.asm \
  src/crates.asm \
  src/graphics.asm \
  src/graphics-data.asm \
  src/mem.asm \
  src/menu.asm

all: build/rom/crates.rom

build/rom/crates.rom: ${SOURCES} src/main.asm
	mkdir -p build/rom
	pasmo ${INCLUDES} src/main.asm build/rom/crates.rom

.PHONY clean:
	rm -rf build
