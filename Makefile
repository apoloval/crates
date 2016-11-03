INCLUDES=-I include -I src
SOURCES=\
  src/controls.asm \
  src/crates.asm \
  src/graphics.asm \
  src/graphics-data.asm \
  src/mem.asm \
  src/menu.asm

all: crates.rom

crates.rom: ${SOURCES} src/main.asm
	pasmo ${INCLUDES} src/main.asm crates.rom

.PHONY clean:
	rm -f *.rom *.bin
