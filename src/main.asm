;-----------------------------------------------------------------------------;
; File        : rom.asm
; Description : A wrapper to generate a .rom file loadable as cartridge
;
; Copyright (C) 2015 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

org 0x4000

header:
	db "AB"
	dw main
  ds 12

include "crates.asm"
include "menu.asm"
include "graphics.asm"
include "graphics-data.asm"
include "controls.asm"

include "mem.asm"

org 0xbfff
ending db 0
