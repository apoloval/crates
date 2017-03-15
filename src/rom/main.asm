;-----------------------------------------------------------------------------;
; File        : rom/main.asm
; Description : A wrapper to generate a .rom file loadable as cartridge
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

include "msx-bios.asm"
include "variables.asm"

org 0x4000

header:
	db	"AB"
	dw	rom_entry
	ds	12

rom_entry:
; Prepare the stack
	ld	hl, STACK_BASE_ADDR
	ld	sp, hl

	call	init_screen
	call	load_graphics
	call	init_keys
	call	run_menu
stop:
	jr	stop

include "menu.asm"
include "graphics.asm"
include "graphics-data.asm"
include "controls.asm"

org 0xbfff
ending db 0
