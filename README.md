# Crates

It's 2012. After several years of finantial crisis and unemployment, Johny has
found a new job as warehouse assistant. There are hundred of crates to be
carried to their right place. But that won't be easy. The warehouse is full
of impossible nooks and tricks that will require more brain than muscle. Will
you help Johny to do his job and impress his boss?

## What????

Crates is a MSX game developed in 21st century. Here you will find the source
code to compile it into a format that can be executed in your MSX computer.

## Build

The code is build using GNU Make. It depends on Pasmo[1] to assemble the code.

If you have `pasmo` in your path, just type `make` and the following will be
build:

* `build/rom/crates.rom`, a ROM image suitable to be burned to have Crates
into a cartridge. You can also execute it in an emulator.

* `build/disk`, a directory with several files that can be written into a
floppy disk to load the game from. Use `LOAD"CRATES.BAS",R` to load the game
from the disk.

## License

Crates is published under the terms of Mozilla Public License v2.

[1]: http://pasmo.speccy.org
